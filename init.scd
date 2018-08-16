(
    var hasLaunchpad;
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 2;
    ~numMics = 4;
    ~numSubs = 2;

    Buffer.freeAll;
    s.quit;
    s.options.numInputBusChannels = ~numMics;
    s.options.numOutputBusChannels = 8;
    //make sure there's enough memory for the delay lines
    s.options.memSize = 65536;
    s.options.numBuffers = 2048;
    s.latency  = 0.01;
    MIDIClient.init;
    MIDIIn.connectAll;
    hasLaunchpad = MIDIClient.externalDestinations.asString;
    if(hasLaunchpad.contains("Launchpad")){
        ~launchpadOut = MIDIOut.newByName("Launchpad", "Launchpad MIDI 1");
        ~launchpadOut.control(176, 0, 0);
    };
    s.waitForBoot(
        {
            // s.meter;
            //test the speakers
            fork{
                var dur = 1;
                ~numSpeakers.do{|i, idx| 
                    {Out.ar(idx, SinOsc.ar(880) * XLine.kr(0.2, 0.00001, dur, doneAction: 2))}.play;
                    dur.wait
                };
                // test subs, sum of headphone outputs. Hardwired to bus 6+7
                {Out.ar(6, SinOsc.ar(88 ! 2) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;
            };

            //load synthdefs
            this.executeFile((~projectfolder++"sdefs.scd").standardizePath);

            //read all samples in "audio" folder to buffers, 
            //one dictionary entry for each subfolder
            //s.sync to make sure the buffers get properly loaded
            ~buffers = Dictionary.new;
            PathName((~projectfolder++"audio").standardizePath).folders.do({|folder| 
                ~buffers.add(folder.folderName.asSymbol -> folder.entries.collect({|file|
                    s.sync;
                    Buffer.readChannel(s, file.fullPath, channels: 0);
                }));
            });
            "Buffers read".postln;

            //set up groups
            this.executeFile((~projectfolder++"groups.scd").standardizePath);
            "groups.scd done".postln;

            //create tracks 
            this.executeFile((~projectfolder++"tracks.scd").standardizePath);
            "tracks.scd done".postln;

            //patterns
            PathName(~projectfolder++"patterns").filesDo({|file| 
                this.executeFile(file.absolutePath);
                postf("% done\n", file); 
            });

            // set up minibee global variables
            this.executeFile((~projectfolder++"minibee/mbGlob.scd").standardizePath);
            "mbGlob.scd done".postln;

            // set up mbDeltaTrigs
            this.executeFile((~projectfolder++"minibee/mbDeltaTrigs.scd").standardizePath);
            "mbDeltaTrigs.scd done".postln;

            // set up mbCCs
            this.executeFile((~projectfolder++"minibee/mbCC.scd").standardizePath);
            "mbCC.scd done".postln;

            // set up light
            this.executeFile((~projectfolder++"light.scd").standardizePath);
            "light.scd done".postln;

            // in the end, load the cues and pray that it works
            this.executeFile((~projectfolder++"cues.scd").standardizePath);
            "cues.scd done".postln;
        }
    );
)

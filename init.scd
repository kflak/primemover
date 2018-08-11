(
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 2;
    ~numMics = 2;
    ~numSubs = 2;

    // address of openFrameworks project
    // ~of = NetAddr.new("127.0.0.1", 12345);

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
    MIDIdef.noteOn(\test, {arg ...args; args.postln});
    MIDIdef.cc(\test1, {arg ...args; args.postln});
    ~launchpadOut = MIDIOut.newByName("Launchpad", "Launchpad MIDI 1");

    s.waitForBoot(
        {
            // s.meter;
            // s.plotTree;
            //load synthdefs
            this.executeFile((~projectfolder++"sdefs.scd").standardizePath);

            //read all samples in "audio" folder to buffers, 
            //one dictionary entry for each subfolder
            ~buffers = Dictionary.new;
            PathName((~projectfolder++"audio").standardizePath).folders.do({|folder| 
                ~buffers.add(folder.folderName.asSymbol -> folder.entries.collect({|file|
                    s.sync;
                    Buffer.readChannel(s, file.fullPath, channels: 0);
                }));
            });
            // PathName((~projectfolder++"audio").standardizePath).folders.do({|folder| 
            //     ~buffers[folder.<            
            // });
            "Buffers read".postln;

            //set up groups
            this.executeFile((~projectfolder++"groups.scd").standardizePath);
            "groups.scd done".postln;
            // s.sync;

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
            // this.executeFile((~projectfolder++"light.scd").standardizePath);
            // "mbCC.scd done".postln;

            // in the end, plug them all into cues and pray that it works
            this.executeFile((~projectfolder++"cues.scd").standardizePath);
            "cues.scd done".postln;

            // 2.wait;
            s.sync;

            this.executeFile((~projectfolder++"cuegui.scd").standardizePath);
            "cuegui.scd done".postln;
        }
    );


)

// speaker test
(
    Tdef(\speakerTest, { ~numSpeakers.do{|i, idx| 
        var dur = 1;
        {Out.ar(idx, SinOsc.ar(880) * XLine.kr(0.2, 0.00001, dur, doneAction: 2))}.play;
        dur.wait; }}
    );
)

Tdef(\speakerTest).play;

// subs, sum of headphone outputs
{Out.ar(6, SinOsc.ar(88 ! 2) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;


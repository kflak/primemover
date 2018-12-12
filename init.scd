(
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 2;
    ~numMics = 4;
    ~numSubs = 2;
    ~micOffset = 4;
    ~subBus = ~numSpeakers;
    ~hasLaunchpad = false;
    ~hasQmidiNet = false;
    ~inBus = ~numSpeakers + ~numSpeakers;

    MIDIClient.init;
    // MIDIIn.connectAll;
    MIDIClient.sources.do{|device, idx|
        if(device.name.contains("Launchpad")){
            MIDIIn.connect(idx, device);
            "% connected\n".postf(device.name);
            ~hasLaunchpad = true;
        }
    };
    // if(MIDIClient.externalDestinations.asString.contains("Launchpad")){~hasLaunchpad = true};
    // if(MIDIClient.externalDestinations.asString.contains("QmidiNet")){~hasQmidiNet = true};

    Buffer.freeAll;
    s.quit;
    s.options.numInputBusChannels = ~numMics + ~micOffset;
    s.options.numOutputBusChannels = ~inBus;
    //make sure there's enough memory for the delay lines
    s.options.memSize = 65536;
    //make sure there's enough buffers
    s.options.numBuffers = 2048;
    //make sure there's enough internal buffers
    s.options.numWireBufs = 256;
    s.latency  = 0.02;
    s.waitForBoot(
        {
            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/setup.scd").standardizePath);
                "Launchpad set up".postln;
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
            // if(~hasQmidiNet){
            //     this.executeFile((~projectfolder++"light.scd").standardizePath);
            //     "light.scd done".postln;
            // };

            // in the end, load the cues and pray that it works
            this.executeFile((~projectfolder++"cues.scd").standardizePath);
            "cues.scd done".postln;

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
                1.wait;
                //turn off launchpad again
                ~launchpadOut.control(176, 0, 0);
            }
        }
    );
)



// (
//     fork{ var dur = 1;
//         ~numSpeakers.do{|i, idx| 
//             {Out.ar(idx, SinOsc.ar(880) * XLine.kr(0.1, 0.00001, dur, doneAction: 2))}.play;
//             dur.wait
//         };
//         // test subs, sum of speaker outputs.
//         {Out.ar(~numSpeakers, SinOsc.ar(88) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;
//         1.wait;
//         {Out.ar(~numSpeakers + 1, SinOsc.ar(88) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;
//     };
// )
// (
//     ~ch[\mic0].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //külli
//     ~ch[\mic1].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //rakesh
//     ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //kenneth
//     ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //isabell
// )
// (
//     ~ch[\mic0].set(\gate, 0);
//     ~ch[\mic1].set(\gate, 0);
//     ~ch[\mic2].set(\gate, 0);
//     ~ch[\mic3].set(\gate, 0);
// )

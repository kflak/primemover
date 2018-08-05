(
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 6;
    ~numMics = 2;
    ~numSubs = 0;

    // address of openFrameworks project
    // ~of = NetAddr.new("127.0.0.1", 12345);

    Buffer.freeAll;
    s.quit;
    s.options.numInputBusChannels = ~numMics;
    s.options.numOutputBusChannels = ~numSpeakers;
    //make sure there's enough memory for the delay lines
    s.options.memSize = 65536;
    s.latency  = 0.01;
    s.waitForBoot(
        {
            // s.meter;
            // s.plotTree;

            //load synthdefs
            this.executeFile((~projectfolder++"sdefs.scd").standardizePath);
            // s.sync;

            //load buffers
            this.executeFile((~projectfolder++"buffers.scd").standardizePath);

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

            2.wait;

            this.executeFile((~projectfolder++"cuegui.scd").standardizePath);
            "cuegui.scd done".postln;
        }
    );


)

s.plotTree;

//speaker test
// (
//     Tdef(\speakerTest, { ~numSpeakers.do{|i, idx| 
//         {Out.ar(idx, SinOsc.ar(440) * XLine.kr(0.2, 0.00001, 1, doneAction: 2))}.play;
//         1.wait; }}
//     );
// )

// Tdef(\speakerTest).play;

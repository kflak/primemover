(
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 2;

    // s.options.inDevice = "Fireface UC Mac (23309203)";
    // s.options.outDevice = "Fireface UC Mac (23309203)";
    // s.options.outDevice = "Built-in Output";

    Buffer.freeAll;
    s.options.numInputBusChannels = 2;
    s.options.numOutputBusChannels = ~numSpeakers;
    s.quit;
    s.waitForBoot({
        s.meter;
        s.plotTree;

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

        PathName(~projectfolder++"patterns").filesDo({|file| 
            this.executeFile(file.absolutePath);
            postf("% done\n", file); 
        });

        // set up launchcontrol
        // this.executeFile((~projectfolder++"lc.scd").standardizePath);
        // "lc.scd done".postln;

        // set up mbs global variables
        this.executeFile((~projectfolder++"mbGlob.scd").standardizePath);
        "mbGlob.scd done".postln;

        // set up mbDeltaTrigs
        this.executeFile((~projectfolder++"mbDeltaTrigs.scd").standardizePath);
        "mbDeltaTrigs.scd done".postln;

        // set up mbCCs
        this.executeFile((~projectfolder++"mbCC.scd").standardizePath);
        "mbCC.scd done".postln;

        //various test files and functions
        this.executeFile((~projectfolder++"score.scd").standardizePath);
        "score.scd done".postln;

        //looper
        this.executeFile((~projectfolder++"looper.scd").standardizePath);
        "looper.scd done".postln;

        // cues
        // this.executeFile((~projectfolder++"cues.scd").standardizePath);
        // "cues.scd done".postln;
    });
)

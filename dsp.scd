(
    // s.options.inDevice = "Fireface UC Mac (23309203)";
    // s.options.outDevice = "Fireface UC Mac (23309203)";
    // s.options.outDevice = "Built-in Output";
    Buffer.freeAll;
    s.options.numInputBusChannels = 2;
    s.options.numOutputBusChannels = 18;
    // s.options.numOutputBusChannels = 6 + ~numSpeakers;
    // s.options.blockSize_(256);
    s.quit;
    s.waitForBoot({
        s.meter;
        s.plotTree;

        fork{
            //load synthdefs
            this.executeFile((~projectfolder++"sdefs.scd").standardizePath);
            1.wait;

            //load buffers
            this.executeFile((~projectfolder++"buffers.scd").standardizePath);

            //set up groups
            this.executeFile((~projectfolder++"groups.scd").standardizePath);
            "groups.scd done".postln;

            0.3.wait;

            //create tracks 
            this.executeFile((~projectfolder++"tracks.scd").standardizePath);
            "tracks.scd done".postln;
        };
    });
)

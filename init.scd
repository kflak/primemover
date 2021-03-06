(
    ~projectfolder = "/home/kf/sc/primemover/";
    ~numSpeakers = 3;
    ~numMics = 4;
    ~numSubs = 1;
    ~micOffset = 4;
    ~subBus = ~numSpeakers;
    ~hasLaunchpad = false;
    ~hasQmidiNet = false;
    ~inBus = ~numSpeakers + ~numSpeakers;

    MIDIClient.init;
    MIDIClient.sources.do{|device, idx|
        if(device.name.contains("Launchpad")){
            MIDIIn.connect(idx, device);
            "% connected\n".postf(device.name);
            ~hasLaunchpad = true;
        }
    };

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
    s.latency  = 0.04;
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
                    Buffer.readChannel(s, file.fullPath, channels: 0);
                }));
            });
            "Reading buffers...".postln;
            s.sync;
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

            // in the end, load the cues and pray that it works
            this.executeFile((~projectfolder++"cues.scd").standardizePath);
            "cues.scd done".postln;

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
                1.wait;
                //turn off launchpad again
                ~launchpadOut.control(176, 0, 0);
            };

            // sensortest
            [9, 12].do{|id, idx| ~deltaTriggers[\water][idx].play() };
            [13, 14].do{|id, idx| ~deltaTriggers[\em][idx].play()};
            [10, 11].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play() };
        }
    );
)


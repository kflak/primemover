(
    {    
        ~crunchycue = Routine {
            var audienceSound = nil ! 2;
            ~buffers[\audienceBuf] = 2.collect{|i|
                Buffer.readChannel(
                    s, 
                    ~projectfolder++"audio/live/audience.wav",
                    channels: 0
                )
            };
            
            //clean up from previous cue
            ~whispersynth.set(\gate, 0); 
            Pdef(\tens).stop;
            ~tenscue.stop;

            ~ch[\heartbeat].set(\gate, 0, \attack, 120, \rel, 120);

            "Kenneth stops singing, Crunchy impro starts".postln;

            //mic off
            ~ch[\mic2].set(\gate, 0);
            //reset graindelay feedback amount
            ~ch[\grdelayLong].set(\fb, 0.5);
            //Külli sensors on
            [10, 11].do{|id, idx| 
                ~deltaTriggers[\sineGrain][idx].play(out: ~bus[\master], target: ~group[\mix] )
            };
            //rakesh sensors off
            [13, 14].do{|id, idx| ~deltaTriggers[\em][idx].release(1)}; 
            120.wait;

            Pdef(\rainFaraway).play;

            90.wait;

            Pdef(\rainFaraway).stop;
            Pdef(\rain).play;

            60.wait;

            Pdef(\sine).play;

            60.wait;

            Pdef(\chatLow).play;

            40.wait;

            Pdef(\cello).play;
            Pdef(\chat).play;
            Pdef(\chatLow).stop;

            20.wait;

            [10, 11].do{|id, idx|
                ~deltaTriggers[\sineGrain][idx].release(1)
            };

            100.wait;

            Pdef(\em).play;

            60.wait;

            Pdef(\rain).stop;

            60.wait;

            Pdef(\metro).play;

            60.wait;

            Pdef(\cello).stop;
            Pdef(\fast_intro).play;
            // Pdef(\chat).play;

            40.wait;

            Pdef(\fast_intro).stop;
            Pdef(\fast).play;

            40.wait;

            Pdef(\fast).stop;
            Pdef(\chat).stop;
            Pdef(\fast_next).play;
            Pdef(\nasa).play;
            Pdef(\crashes_1).play;
            Pdef(\em).stop;
            Pdef(\metro).stop;

            60.wait;

            Pdef(\nasa).stop;
            Pdef(\crashes_1).stop;
            Pdef(\fast_klang_liftoff_cue).play;

            10.wait;

            Pdef(\nasa_liftoff).play;

            25.wait;

            Pdef(\fast_next).stop;

            15.wait;

            Pdef(\rain).play;
            Pdef(\sine).stop;
            Pdef(\fmdrone).play;

            90.wait;

            Pdef(\fmdrone).stop;
            ~ch[\heartbeat].set(\gate, 1);
            Pdef(\heartbeatHi).play(TempoClock(0.8));
            2.do{|i| 
                audienceSound[i] = Synth(
                    \cleangate,
                    \gate, 1,
                    \buf, ~buffers[\audienceBuf][i],
                    \out, ~bus[\master],
                    \pan, i,
                    \attack, 20,
                    \rel, 100,
                    \fx1, ~bus[\grdelayLong],
                    \fx1lvl, -10.dbamp
                )
            };

            30.wait;

            Pdef(\lullaby).play;

            40.wait;

            Pdef(\rain).stop;
            Pdef(\rainLow).play;

            40.wait;

            Pdef(\rainLow).stop;
            Pdef(\lullaby).stop;
            2.do{|i| audienceSound[i].set(\fx1lvl, 0, \gate, 0)};

            10.wait;

            Pdef(\nasa_liftoff).stop;

            80.wait;

            ~ch[\heartbeat].set(\gate, 0);

            120.wait;

            Pdef(\heartbeatHi).stop;

        }.play;
    }
)

(
    {
        ~swirlcue = Routine {

            "Swirl".postln;

            ~ch[\heartbeat].set(\gate, 0, \attack, 120, \rel, 120);

            //Külli sensors off
            [10, 11].do{|id, idx| ~deltaTriggers[\sineGrain][idx].release(1) };
            // Backup when no sensors
            // Pdef(\sineGrainTrain).stop;

            40.wait;

            Pdef(\rainFaraway).play;

            60.wait;

            Pdef(\rainFaraway).stop;
            Pdef(\rain).play;

            30.wait;

            Pdef(\sine).play;

            80.wait;

            Pdef(\chatLow).play;

            50.wait;

            Pdef(\cello).play;
            // Pdef(\chat).play;
            // Pdef(\chatLow).stop;

            // 20.wait;

            100.wait;

            Pdef(\em).play;
            Pdef(\chatLow).stop;
            Pdef(\chat1).play;

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
            Pdef(\chat1).stop;
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

            30.wait;

            Pdef(\lullaby).play;

            40.wait;

            Pdef(\rain).stop;
            Pdef(\rainLow).play;

            20.wait;

            Pdef(\lullaby).stop;

            20.wait;

            Pdef(\rainLow).stop;

            10.wait;

            Pdef(\nasa_liftoff).stop;

            80.wait;

            ~ch[\heartbeat].set(\gate, 0);

            120.wait;

            Pdef(\heartbeatHi).stop;
        }.play;
    }
)

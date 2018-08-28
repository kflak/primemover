(
    {    
        ~crunchycue = Routine {

            //clean up from previous cue
            ~whispersynth.set(\gate, 0); 
            Pdef(\tens).stop;
            ~tenscue.stop;

            ~ch[\heartbeat].set(\gate, 0, \attack, 240, \rel, 120);

            "Kenneth stops singing, Crunchy impro starts".postln;

            //mic off
            ~ch[\mic2].set(\gate, 0);
            //reset graindelay feedback amount
            ~ch[\grdelayLong].set(\fb, 0.5);

            //Külli sensors on
            // [10, 11].do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\crunchy], target: ~group[\mix]) };
            // [10, 11].do{|id, idx| ~deltaTriggers[\chips][idx].play(out: ~bus[\crunchy], target: ~group[\mix]) };
            // [10, 11].do{|id, idx| ~deltaTriggers[\bubbles][idx].play(out: ~bus[\crunchy], target: ~group[\mix]) };

            [10, 11].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play( out: ~bus[\master], target: ~group[\mix] )}; //Külli sensors on
            [13, 14].do{|id, idx| ~deltaTriggers[\em][idx].release(1)}; //rakesh off
            120.wait;

            Pdef(\rain).play;

            60.wait; // QUARTET
            // 30.wait;

            Pdef(\chat).play;

            60.wait; // QUARTET
            // 30.wait;

            Pdef(\sine).play;

            60.wait; // QUARTET
            // 90.wait; //DUET

            40.wait;

            Pdef(\cello).play;

            20.wait;

            [10, 11].do{|id, idx| ~deltaTriggers[\sineGrain][idx].release(1)};
            // [13, 14].do{|id, idx| ~deltatriggers[\em][idx].release(1)}; //rakesh off
            // [10, 11].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)}; //Külli off 
            // [10, 11].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)}; //Külli off
            // [10, 11].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)}; //Külli off
            // [12].do{|id, idx| ~deltaTriggers[\water][idx].release(1)}; //Isabell off

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

            30.wait;

            Pdef(\lullaby).play;

            40.wait;

            ~ch[\heartbeat].set(\gate, 1);
            Pdef(\heartbeatHi).play(TempoClock(0.8));

            // 20.wait;

            Pdef(\rain).stop;
            Pdef(\rainLow).play;

            70.wait;

            // 40.wait;

            Pdef(\rainLow).stop;
            Pdef(\lullaby).stop;
            
            ~ch[\heartbeat].set(\gate, 0);

            10.wait;

            Pdef(\nasa_liftoff).stop;

            120.wait;

            Pdef(\heartbeatHi).stop;

        }.play;
    }
)

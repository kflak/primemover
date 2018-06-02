(
    {    
        ~crunchycue = Routine {

            //clean up from previous cue
            Pdef(\tens).stop;
            ~tenscue.stop;

            "Kenneth stops singing, Crunchy impro starts".postln;

            //mic off
            ~ch[\mic0].set(\gate, 0);

            //Külli sensors on
            [10, 11].do{|id, idx| ~deltaTriggers[\chew][idx].play( out: ~bus[\master], target: ~group[\mix]) };
            [10, 11].do{|id, idx| ~deltaTriggers[\chips][idx].play( out: ~bus[\master], target: ~group[\mix]) };
            [10, 11].do{|id, idx| ~deltaTriggers[\bubbles][idx].play( out: ~bus[\master], target: ~group[\mix]) };

            90.wait;

            Pdef(\rain).play;

            //Isabell sensor on
            [12].do{|id, idx| ~deltaTriggers[\water][idx].play( out: ~bus[\master], target: ~group[\mix]) };

            // 60.wait; // QUARTET
            30.wait;

            Pdef(\chat).play;

            // 60.wait; // QUARTET
            30.wait;

            Pdef(\sine).play;

            // 60.wait; // QUARTET
            90.wait; //DUET

            [13, 14].do{|id, idx| ~deltaTriggers[\em][idx].release(1)}; //Rakesh off
            [10, 11].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)}; //Külli off 
            [10, 11].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)}; //Külli off
            [10, 11].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)}; //Külli off
            [12].do{|id, idx| ~deltaTriggers[\water][idx].release(1)}; //Isabell off

            40.wait;

            Pdef(\cello).play;

            120.wait;

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

            60.wait;

            Pdef(\lullaby).play;

            // 60.wait; //QUARTET

            Pdef(\rain).stop;
            Pdef(\rainLow).play;

            90.wait;

            Pdef(\lullaby).stop;
            // Pdef(\lullabyLow).play;
            Pdef(\nasa_liftoff).stop;
            Pdef(\heartbeatHi).play(TempoClock(0.8));
            Pdef(\rainLow).stop;

            // 10.wait;

            // Pdef(\lullabyLow).stop;

            240.wait;
            
            Pdef(\heartbeatHi).stop;

        }.play;
    }
)

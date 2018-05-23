(
    {
        // s.record("/home/kf/sc/primemover/rehearsalfiles/swirl.wav");
        "Swirl".postln;

        ~swirlCue = Routine {
            Pdef(\tens).stop;
            // ~crunchy_impro.value();
            // 60.wait; 
            Pdef(\rain).play;
            110.wait;
            // 10.wait;
            Pdef(\sine).play;
            60.wait;
            ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].release(1)};
            [10, 11, 12].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)};
            [10, 11, 12].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)};
            [10, 11, 12].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)};
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
            Pdef(\chat).play;
            40.wait;
            // 7:30
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
            // 9:10
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
            60.wait;
            // ~open_mic1.value();
            // 120.wait;
            Pdef(\rain).stop;
            Pdef(\rainLow).play;
            120.wait;
            Pdef(\lullaby).stop;
            Pdef(\lullabyLow).play;
            Pdef(\nasa_liftoff).stop;
            Pdef(\heartbeat).play(TempoClock(0.8));
        }.play;
    }
)

// (
//     // ~swirlCue.play;
    // ~swirlCue.stop;
//     ~swirlCue.clear;
    // Pdef(\rain).stop;
    // Pdef(\rainLow).stop;
    // Pdef(\sine).stop;
    // Pdef(\lullabyLow).stop;
    // Pdef(\heartbeat).stop;
    // s.stopRecording
// )

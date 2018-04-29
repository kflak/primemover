(
    {
        "audience enters".postln;
        ~audienceEntersCue = Routine {     

            Pdef(\nasaSaturn).play;
            Pdef(\heartbeat).play(TempoClock(0.8));

            60.wait;

            Pdef(\tibetBellRev).play;
            Pdef(\celloBegin).play;

            60.wait;

            Pdef(\windBegin).play;

            60.wait;

            Pdef(\sineGrainTrainEnv).play;

            60.wait;

            Pdef(\aliinaCryBeginning).play;

            120.wait;
            Pdef(\school_yard_fadein).play;
            Pdef(\celloBegin).stop;

            120.wait;

            Pdef(\nasaSaturn).stop;

            30.wait;

            Pdef(\heartbeat).stop;

            30.wait;

            Pdef(\windBegin).stop;
            Pdef(\tibetBellRev).stop;
            Pdef(\sineGrainTrainEnv).stop;
            Pdef(\aliinaCryBeginning).stop;

            Pdef(\fastNonRythmical).play;

            60.wait;

            Pdef(\school_yard_fadein).stop;
            Pdef(\fastNonRythmical).stop;

            Pdef(\fastFirst).play;
            180.wait;
            Pdef(\fastSecond).play; Pdef(\fastFirst).stop;
            // 60.wait;
            // Pdef(\fastThird).play; Pdef(\fastSecond).stop;
            // 60.wait;
            // Pdef(\fastFourth).play; Pdef(\fastSecond).stop;
            // 60.wait;
            // Pdef(\fastThird).play; Pdef(\fastSecond).stop;
            // 60.wait;
            // Pdef(\fastFourth).play; Pdef(\fastThird).stop;
            // 60.wait;
        }.play;
    }
)


// (
    // Pdef(\fastFirst).stop;
    // Pdef(\fastSecond).stop;
    // Pdef(\fastThird).stop;
    // Pdef(\fastFourth).stop;
//     Pdef(\school_yard_fadein).stop;
//     ~audienceEntersCue.pause;
//     ~audienceEntersCue.stop;
// )

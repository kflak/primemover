(
    {
        ~popcornEnds = Routine {
            Pdef(\fastFirst).stop;
            Pdef(\fastSecond).stop;
            Pdef(\fastThird).stop;
            Pdef(\fastFourth).stop;
            ~audienceEntersCue.stop;
            0.1.wait;
            Pdef(\nasaSaturn).stop;
            Pdef(\heartbeat).stop;
            Pdef(\windBegin).stop;
            Pdef(\tibetBellRev).stop;
            Pdef(\sineGrainTrainEnv).stop;
            Pdef(\aliinaCryBeginning).stop;
            Pdef(\fastNonRythmical).stop;
            Pdef(\school_yard_fadein).stop;
        }.play;
    }
)
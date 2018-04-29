(
    ~cockroachCue = Routine {
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
    };

    ~cockroachFree = {        
        ~cockroachCue.stop;
        ~cockroachCue.reset;
        Pdef(\school_yard_fadein).stop;
        Pdef(\nasaSaturn).stop;
        Pdef(\heartbeat).stop;
        Pdef(\windBegin).stop;
        Pdef(\tibetBellRev).stop;
        Pdef(\sineGrainTrainEnv).stop;
        Pdef(\aliinaCryBeginning).stop;
        Pdef(\fastNonRythmical).stop;
    };
)

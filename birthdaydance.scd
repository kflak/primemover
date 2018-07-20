(

    ~birthdaydance = Routine {     

        Pdef(\nasaSaturn).play;
        Pdef(\heartbeat).play(TempoClock(0.8));

        20.wait;

        Pdef(\tibetBellRev).play;
        Pdef(\celloBegin).play;
        Pdef(\school_yard_fadein).play;

        20.wait;

        Pdef(\windBegin).play;

        20.wait;

        Pdef(\sineGrainTrainEnv).play;

        20.wait;

        Pdef(\celloBegin).stop;

        90.wait;

        Pdef(\tensBirthday).play(TempoClock(2.0));

        Pdef(\nasaSaturn).stop;
        Pdef(\school_yard_fadein).stop;

        10.wait;

        Pdef(\heartbeat).stop;

        30.wait;

        Pdef(\windBegin).stop;
        Pdef(\tibetBellRev).stop;
        Pdef(\sineGrainTrainEnv).stop;
    }.play;
)

(
    ~birthdaydance.stop;
    Pdef(\nasaSaturn).stop;
    Pdef(\heartbeat).stop;
    Pdef(\tibetBellRev).stop;
    Pdef(\celloBegin).stop;
    Pdef(\school_yard_fadein).stop;
    Pdef(\windBegin).stop;
    Pdef(\sineGrainTrainEnv).stop;
    Pdef(\tensBirthday).stop;
)

(
    {
        ~beaverRise = Routine{

            "beware the beavers!".postln;

            // ~isaJoinsBreath.stop;
            Pdef(\windBegin).stop;
            Pdef(\tibetBellRev).stop;
            Pdef(\sineGrainTrainEnv).stop;
            Pdef(\aliinaCryBeginning).stop;
            Pdef(\fastNonRythmical).play;

            30.wait;

            ~ch[\heartbeat].set(\gate, 0);

            Pdef(\school_yard_fadein).stop;
            Pdef(\fastNonRythmical).stop;
            Pdef(\fastFirst).play;

            100.wait;

            Pdef(\aliinaChat).play;
            //just in case the previous cue is still running...
            Pdef(\school_yard_fadein).stop;

            80.wait;

            Pdef(\fastSecond).play; Pdef(\fastFirst).stop;

            20.wait;

            Pdef(\aliinaChatFaster).play;
            Pdef(\aliinaChat).stop;
        }.play;
    }
)

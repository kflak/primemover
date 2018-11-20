(
    {
        ~beaverRise = Routine{

            "beware the beavers!".postln;

            //clean up from previous cue
            ~isaJoinsBreath.stop;
            Pdef(\tibetBellRev).stop;
            Pdef(\celloBegin).stop;
            Pdef(\sineGrainTrainEnv).stop;
            Pdef(\nasaBeginning).stop;
            Pdef(\nasaSaturn).stop;
            Pdef(\pinkNoiseBreath).stop;
            Pdef(\windBegin).stop;
            Pdef(\aliinaCryBeginning).stop;
            Pdef(\heartbeat).stop;
            ~ch[\heartbeat].set(\gate, 0);

            Pdef(\fastNonRythmical).play;

            30.wait;

            Pdef(\school_yard_fadein).stop;
            Pdef(\fastNonRythmical).stop;
            Pdef(\fastFirst).play;
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -30.dbamp, \gate, 1);
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -30.dbamp, \gate, 1);

            90.wait;

            Pdef(\aliinaChat).play;
            //just in case the previous cue is still running...
            // Pdef(\school_yard_fadein).stop;

            90.wait;

            Pdef(\fastSecond).play; Pdef(\fastFirst).stop;

            20.wait;

            Pdef(\aliinaChatFaster).play;
            Pdef(\aliinaChat).stop;
        }.play;
    }
)

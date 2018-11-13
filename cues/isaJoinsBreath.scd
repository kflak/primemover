(
    {

        "Isa joins breath".postln;

        ~isaJoinsBreath = Routine {     
            
            Pdef(\tibetBellRev).play;

            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);
            ~ch[\mic2].set(\gate, 0);
            ~ch[\mic3].set(\gate, 0);

            60.wait;

            Pdef(\celloBegin).play;

            40.wait;

            Pdef(\sineGrainTrainEnv).play;
            Pdef(\nasaBeginning).stop;

            40.wait;

            Pdef(\nasaSaturn).play;

            30.wait;

            Pdef(\pinkNoiseBreath).play;
            Pdef(\windBegin).play;

            30.wait;

            Pdef(\aliinaCryBeginning).play;

            100.wait;

            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -30.dbamp, \gate, 1);
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -30.dbamp, \gate, 1);

            Pdef(\school_yard_fadein).play;
            Pdef(\celloBegin).stop;

            100.wait;

            Pdef(\nasaSaturn).stop;
            Pdef(\pinkNoiseBreath).stop;

            20.wait;

            Pdef(\heartbeat).stop;
        }.play;
    };
)

// Pdef(\fastFirst).stop;
// Pdef(\fastSecond).stop;
// Pdef(\aliinaChatFaster).stop;

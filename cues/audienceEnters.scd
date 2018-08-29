(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            // s.record("~/sc/primemover/rehearsalfiles/audienceEnters.wav");

            ~ch[\heartbeat].set(\gate, 0);

            1.wait;

            ~ch[\heartbeat].set(\attack, 240, \gate, 1);
            ~ch[\mic2].set(\lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \f3lvl, -30.dbamp);
            ~ch[\mic3].set(\lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \f3lvl, -30.dbamp);
            
            Pdef(\heartbeat).play(TempoClock(0.8));

            120.wait;

            Pdef(\tibetBellRev).play;

            60.wait;

            Pdef(\nasaSaturn).play;
            Pdef(\celloBegin).play;

            60.wait;

            Pdef(\sineGrainTrainEnv).play;

            60.wait;

            Pdef(\pinkNoiseBreath).play;
            Pdef(\windBegin).play;

            60.wait;

            Pdef(\aliinaCryBeginning).play;

            120.wait;

            Pdef(\school_yard_fadein).play;
            Pdef(\celloBegin).stop;

            120.wait;

            Pdef(\nasaSaturn).stop;
            Pdef(\pinkNoiseBreath).stop;

            30.wait;

            Pdef(\heartbeat).stop;

            30.wait;

            Pdef(\windBegin).stop;
            Pdef(\tibetBellRev).stop;
            Pdef(\sineGrainTrainEnv).stop;
            Pdef(\aliinaCryBeginning).stop;
            Pdef(\fastNonRythmical).play;

            60.wait;

            ~ch[\heartbeat].set(\gate, 0);

            Pdef(\school_yard_fadein).stop;
            Pdef(\fastNonRythmical).stop;
            Pdef(\fastFirst).play;

            100.wait;

            Pdef(\aliinaChat).play;

            80.wait;

            Pdef(\fastSecond).play; Pdef(\fastFirst).stop;

            20.wait;

            Pdef(\aliinaChatFaster).play;
            Pdef(\aliinaChat).stop;


            //comment out this after recording!
            // 120.wait; 
            // Pdef(\aliinaChatFaster).stop;
            // Pdef(\fastSecond).stop;

            // 15.wait;
            // s.stopRecording;

        }.play;
    };
)


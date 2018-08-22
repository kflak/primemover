(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            // s.record("~/sc/primemover/rehearsalfiles/audienceEnters.wav");

            ~ch[\mic2].set(\lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \f3lvl, -30.dbamp);
            
            Pdef(\nasaSaturn).play;
            Pdef(\pinkNoiseBreath).play;
            Pdef(\heartbeat).play(TempoClock(0.8));

            60.wait;

            Pdef(\tibetBellRev).play;
            Pdef(\celloBegin).play;

            120.wait;

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

            // ~ch[\mic0].set(\gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \f3lvl, -40.dbamp);
            // ~ch[\mic1].set(\gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \f3lvl, -40.dbamp);

            //DUET
            // 60.wait;
            
            //QUARTET
            // 90.wait;

            //DUET
            // 45.wait;
            
            //QUARTET
            // 75.wait;

            //comment out this after recording!
            // 120.wait; 
            // Pdef(\aliinaChatFaster).stop;
            // Pdef(\fastSecond).stop;

            // 15.wait;
            // s.stopRecording;

        }.play;
    };
)


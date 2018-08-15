(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     

            Pdef(\nasaSaturn).play;
            Pdef(\heartbeat).play(TempoClock(0.8));

            60.wait;

            Pdef(\tibetBellKlank).play;
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
            Pdef(\tibetBellKlank).stop;
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

            // Pdef(\fastSecond).stop;

        }.play;
    };
)


// (
// Pdef(\fastFirst).play;
// Pdef(\fastFirst).stop;
// Pdef(\fastSecond).stop;
//     Pdef(\school_yard_fadein).stop;
    // ~audienceEntersCue.play;
    // ~audienceEntersCue.stop;
// )
// s.stopRecording;

// (
//     fork{
//         20.wait;
//         Pdef(\fastFirst).play;
//         180.wait;
//         Pdef(\fastSecond).play;
//         1.wait;
//         Pdef(\fastFirst).stop;
//         179.wait;
//         Pdef(\fastSecond).stop;
//         // ~ch[\mic0].set( \gate, 1, \fx1, ~bus[\jpverb], \fx1lvl, -10.dbamp, \fx2, ~bus[\grdelayMedium], \fx3lvl, 0.dbamp, ~bus[\grdelayLong], \fx3lvl, -10.dbamp);
//         // ~ch[\mic0].set( \gate, 1, \fx1, ~bus[\jpverb], \fx1lvl, -10.dbamp, \fx2, ~bus[\grdelayMedium], \fx2lvl, 0, \fx3, ~bus[\grdelayLong], \fx3lvl, 0);
//         // ~ch[\mic1].set( \gate, 1, \fx1, ~bus[\jpverb], \fx1lvl, -10.dbamp);

//     }
// )
            // ~ch[\mic0].set(\gate, 0);
            // ~ch[\mic1].set(\gate, 0);

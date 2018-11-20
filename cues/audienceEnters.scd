(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            //clean up from Swirl
            ~swirlcue.stop;
            Pdef(\rainFaraway).stop;
            Pdef(\rain).stop;
            Pdef(\sine).stop;
            Pdef(\chatLow).stop;
            Pdef(\cello).stop;
            Pdef(\em).stop;
            Pdef(\chat1).stop;
            Pdef(\metro).stop;
            Pdef(\fast_intro).stop;
            Pdef(\fast).stop;
            Pdef(\fast_klang_liftoff_cue).stop;
            Pdef(\nasa_liftoff).stop;
            Pdef(\fast_next).stop;
            Pdef(\fmdrone).stop;
            Pdef(\heartbeatHi).stop;
            Pdef(\lullaby).stop;
            ~ch[\heartbeat].set(\gate, 0);

            1.wait;

            ~ch[\heartbeat].set( \attack, 240, \gate, 1, \rel, 30);
            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
            
            Pdef(\heartbeat).play(TempoClock(0.8));

            Pdef(\nasaBeginning).play;

            // s.record(
            //     ~projectfolder++"/audio/live/audience.wav", 
            //     bus: ~inBus, 
            //     numChannels: 2
            // );

        }.play;
    };
)

// ~ch[\mic2].set(\gate, 0)
// ~ch[\mic3].set(\gate, 0)
// Pdef(\heartbeat).stop;
// Pdef(\nasaBeginning).stop;

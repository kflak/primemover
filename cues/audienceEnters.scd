(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            ~ch[\heartbeat].set(\gate, 0);

            1.wait;

            ~ch[\heartbeat].set( \attack, 240, \gate, 1);
            ~ch[\mic0].set(\lvlin, -6.dbamp, \lvlout, -6.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350, \hishelfdb, -8);
            ~ch[\mic1].set(\lvlin, -6.dbamp, \lvlout, -3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350);
            ~ch[\mic2].set(\lvlin, 3.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp);
            ~ch[\mic3].set(\lvlin, 3.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp);
            
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

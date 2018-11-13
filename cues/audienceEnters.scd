(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            ~ch[\heartbeat].set(\gate, 0);

            1.wait;

            ~ch[\heartbeat].set( \attack, 240, \gate, 1);
            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
            
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

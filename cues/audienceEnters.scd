(
    {

        "audience enters".postln;

        ~audienceEntersCue = Routine {     
            
            ~ch[\heartbeat].set(\gate, 0);

            1.wait;

            ~ch[\heartbeat].set( \attack, 240, \gate, 1);
            ~ch[\mic2].set( \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \hishelffreq, -12);
            ~ch[\mic3].set( \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \hishelffreq, -12);
            
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


(
    {
        ~heartdialog = Routine {

            "Heart dialog ends".postln;

            ~darknesscue.stop;

            Tdef(\darkness).play;
            Pdef(\heartbeatLo).stop;

            108.wait;

            //switch off mics
            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);
            ~ch[\mic2].set(\gate, 0);
            ~ch[\mic3].set(\gate, 0);

            Tdef(\writetext).stop;
            Pdef(\tens).play(TempoClock(2.0)).quant_(0);
            if(~hasLaunchpad){~launchpadOut.control(176, 0, 0); MIDIdef.freeAll};

            20.wait;

            ~whispersynth.set(\gate, 0); 
            Pdef(\darknessVanaema).stop;
            Tdef(\darkness).stop;
            Tdef(\darkness).reset;
            Pdef(\darknessBlips).stop;
            Pdef(\darknessBlipsFaster).stop;
            Pdef(\darknessBreathFadeIn).stop;
            Pdef(\darknessSub).stop;
            Pdef(\darknessTibet).stop;

            130.wait;

            // ~whispersynth.set(\gate, 0); 

            60.wait;

            "Rakesh solo".postln;
            ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\em])};
            // Backup when no sensor
            // Pdef(\emSolo).play;

            "Kenneth mics on, prepare for song".postln;

            ~ch[\grdelayLong].set(\fb, 0.6);
            ~ch[\mic2].set(\gate, 1, \lvlin, -6.dbamp, \lvlout, -0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp, \hishelffreq, 500, \hishelfdb, -3);
            60.wait;

            Pdef(\tens).stop;
        }.play
    }
)

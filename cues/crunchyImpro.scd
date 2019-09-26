(
    {
        "Kenneth stops singing, Külli impro starts".postln;

        //clean up from previous cue
        ~heartdialog.stop;
        ~whispersynth.set(\gate, 0);
        Tdef(\writetext).stop;
        if(~hasLaunchpad){~launchpadOut.control(176, 0, 0)};
        Pdef(\darknessVanaema).stop;
        Tdef(\darkness).stop;
        Tdef(\darkness).reset;
        Pdef(\darknessBlips).stop;
        Pdef(\darknessBlipsFaster).stop;
        Pdef(\darknessBreathFadeIn).stop;
        Pdef(\darknessSub).stop;
        Pdef(\darknessTibet).stop;
        Pdef(\tens).stop;
        ~ch[\mic0].set(\gate, 0);
        ~ch[\mic1].set(\gate, 0);
        ~ch[\mic2].set(\gate, 0);
        ~ch[\mic3].set(\gate, 0);
        //Külli sensors on
        [10, 11].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play() };
        //rakesh sensors off
        [13, 14].do{|id, idx| ~deltaTriggers[\em][idx].release(1)}; 

        // Backup when no sensors
        // Pdef(\sineGrainTrain).play;
        // Pdef(\emSolo).stop;

        fork{
            10.do{|i|
                var increment = 0.02;
                var feedback = 0.6 - (i + 1 * increment);
                ~ch[\grdelayLong].set(\fb, feedback);
                1.wait;
            };
            10.wait;
            ~ch[\grdelayLong].set(\fb, 0.5);
        };
    }
)

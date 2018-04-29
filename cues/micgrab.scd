(
    {
        "performers grab the mics".postln;
        ~micgrabCue = Routine {
            //if these are not stopped already. Mostly for being able
            //to skip ahead through the cuelist and make sure all is off
            //that should be off

            //and this is the actual, realtime cue
            ~deltaTriggers[\sampIDs].do{|id, idx| ~deltaTriggers[\samp][idx].release(1)};
            Pdef(\fast).stop;
            Pdef(\nasaSaturnMicgrab).play;
            ~ch[\mic0].set(
                \gate, 1, 
                \fx1, ~bus[\grdelayLong], 
                \fx1lvl, 0.0,
                \fx2, ~bus[\jpverb], 
                \fx2lvl, -20.dbamp
            );
            ~ch[\mic1].set(
                \gate, 1, 
                \fx1, ~bus[\grdelayLong], 
                \fx1lvl, 0.0,
                \fx2, ~bus[\jpverb], 
                \fx2lvl, -20.dbamp
            );

            120.wait;

            ~ch[\mic0].set(\fxlvl1, -15.dbamp);
            ~ch[\mic1].set(\fxlvl1, -15.dbamp);

            30.wait;

            ~ch[\mic0].set(\fxlvl1, -6.dbamp);
            ~ch[\mic1].set(\fxlvl1, -6.dbamp);

            Pdef(\tens).play(TempoClock(2.0));

            30.wait;
            Pdef(\nasaSaturnMicgrab).stop;

            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);

        }.play;
    }
)

// ~micgrabCue.pause;
// ~micgrabCue.stop;

(
    {
        "Kenneth sings on top of Külli's shoulders".postln;
        //redundancy
        Pdef(\tens).stop;
        Pdef(\nasaSaturnMicgrab).stop;
        ~micgrabCue.stop;
        ~ch[\mic1].set(\gate, 0);

        //real cue
        ~ch[\mic0].set(
            \gate, 1,
            \lvlin, -6.dbamp,
            \lvlout, 0.dbamp,
            \pan, 0.5,
            \out, ~bus[\fbsong],
            \fx1, ~bus[\grdelayLong],
            \fx1lvl, -6.dbamp,
            \fx2, ~bus[\jpverb],
            \fx2lvl, -6.dbamp
        )
    }
)

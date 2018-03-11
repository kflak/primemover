//TODO: make wavy teaser for the swirl.
(
    var phrases = ();

    phrases.put(\fast_click_water, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\water], inf),
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \amp, Pexprand(-20.dbamp, -3.dbamp),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_click, 
        Pbind(
            \instrument, \click,
            \group, ~group[\instr],
            \spread, Pwhite(1.8, 2.7),
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \db, Pseq([Pseries.fromEndpoints(-70, -3, 20), Pexprand(-20, 0)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_kick,
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \midinote, 30,
            \pan, Pwhite(-1.0, 1.0, inf),
            \dur, Prand([0.2, 0.4, 0.6], inf),
            \db, Pwhite(-25, -15),
            \attack, 0.001, 
            \rel, Pwhite(0.4, 0.6),
            \out, ~bus[\master],
        )
    );

    phrases.put(\fast_klang,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 75.midicps,
            \dur, Prand([0.1, 0.1, 0.2, 0.4], inf),
            \db, Pwhite(-50, -30),
            \attack, 0.0, 
            \rel, Pwhite(1.5, 2.0),
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    Pdef(\fast_klang_liftoff_cue,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 87.midicps,
            \dur, 0.15,
            \db, Pseries.fromEndpoints(-50, -25, 48),
            \attack, 0.1, 
            \rel, 0.0,
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    Pdef(\fast_intro,
        Psym(
            Pseq([[\fast_click_water, \fast_click]]), phrases
        )
    );

    Pdef(\fast,
        Psym(
            Pseq([[\fast_click_water, \fast_click, \fast_kick]]), phrases
        )
    );

    Pdef(\fast_next,
        Psym(
            Pseq([[\fast_klang, \fast_click_water, \fast_click, \fast_kick]]), phrases
        )
    );
)

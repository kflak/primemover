(
    var phrases = ();

    phrases.put(\aliina_laugh, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \buf, Prand(~buffers[\aliina_laugh], inf),
            \rel, Pkey(\dur) * 0.5,
            \attack, Pkey(\dur) * 0.1,
            \db, Pwhite(-10, -6),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, 0.dbamp, inf),
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -6.dbamp,
        );
    );		

    phrases.put(\fast_click_water, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\water], inf),
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \db, Pwhite(-20, -3),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_click_water_delay, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\water], inf),
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \db, Pwhite(-20, 0),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_click, 
        Pbind(
            \instrument, \click,
            \group, ~group[\instr],
            \spread, Pwhite(1.8, 2.7),
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \db, Pseq([Pseries.fromEndpoints(-70, -3, 20), Pwhite(-10, 0)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_click_water_nonrythm, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\water], inf),
            \group, ~group[\instr],
            \dur, Pexprand(0.3, 2.0),
            \db, Pwhite(-10, 0),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    phrases.put(\fast_click_nonrythm, 
        Pbind(
            \instrument, \click,
            \group, ~group[\instr],
            \spread, Pwhite(1.8, 2.7),
            \dur, Pexprand(0.3, 2.0),
            \db, Pseq([Pseries.fromEndpoints(-70, 0, 20), Pexprand(-10, 0)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\fast],
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
            \db, Pwhite(-30, -25) - 10,
            \attack, 0.001, 
            \rel, Pwhite(0.4, 0.6),
            \out, ~bus[\fast],
        )
    );

    phrases.put(\fast_kickThird,
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \midinote, 30,
            \pan, Pwhite(-1.0, 1.0, inf),
            \dur, Prand([0.2, 0.4, 0.6], inf),
            \db, Pwhite(-30, -25),
            \attack, 0.001, 
            \fx1, ~bus[\grdelay],
            \fx1lvl, -20.dbamp,
            \rel, Pwhite(0.4, 0.6),
            \out, ~bus[\fast],
        )
    );

    phrases.put(\fast_klang,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 75.midicps,
            \dur, Prand([0.1, 0.1, 0.2, 0.4], inf),
            \db, Pwhite(-70, -40),
            \attack, 0.0, 
            \rel, Pwhite(1.5, 2.0),
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    phrases.put(\fast_klangSecond,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 75.midicps,
            \dur, Prand([0.1, 0.1, 0.2, 0.4], inf),
            \db, Pwhite(-70, -40),
            \attack, 0.0, 
            \rel, Pwhite(1.5, 2.0),
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    phrases.put(\fast_klang_delay,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, Pexprand(200, 1200),
            \dur, Prand([0.1, 0.1, 0.1, 0.2], inf),
            \db, Pwhite(-70, -50),
            \attack, 0.01, 
            \rel, 1,
            \spread, Pwhite(1.80, 2.20, inf),
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, 0.dbamp,
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, 0.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    phrases.put(\windPulse, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            // \dur, Prand([0.1, 0.1, 0.1, 0.2, 0.3], inf),
            \dur, Prand([0.1, 0.1, 0.1, 0.2, 0.3], inf),
            \rate, Pexprand(0.5, 1.5),
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \rel, Pkey(\dur) * 0.2,
            \attack, Pkey(\dur) * 0.1,
            \db, Pwhite(0, 6),
            \thresh, -12.dbamp,
            \ratio, 8,
            \compgain, 12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -10.dbamp,
            \out, ~bus[\fast],
        );
    );		

    phrases.put(\windPulseFourth, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.1, 0.1, 0.2, 0.3], inf),
            \rate, Pexprand(0.5, 1.5),
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \rel, Pkey(\dur) * 0.5,
            \attack, Pkey(\dur) * 0.1,
            \db, Pwhite(0, 6),
            \thresh, -12.dbamp,
            \ratio, 8,
            \compgain, 12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \out, ~bus[\fast],
        );
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
            \out, ~bus[\fast],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    Pdef(\fastNonRythmical, 
        Psym(
            Pseq([[\fast_click_water_nonrythm, \fast_click_nonrythm]]), phrases
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

    Pdef(\fastFirst,
        Psym(
            Pseq([[\fast_click_water, \fast_click, \fast_kick]]), phrases
        )
    );

    Pdef(\fastSecond,
        Psym(
            Pseq([[\aliina_laugh, \fast_klang_delay, \fast_click_water, \fast_click, \fast_kick]]), phrases
        )
    );

    Pdef(\fastThird,
        Psym(
            Pseq([[\fast_click_water_delay, \fast_click, \fast_kick, \windPulse]]), phrases
        )
    );

    Pdef(\fastFourth,
        Psym(
            Pseq([[\aliina_laugh, \fast_click_water_delay, \fast_click, \fast_kick, \windPulseFourth]]), phrases
        )
    );
)

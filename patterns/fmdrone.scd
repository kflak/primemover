(
    Pdef(\fmdrone,
        Pbind(
            \instrument, \fm,
            \group, ~group[\instr],
            \db, -37,
            \carfreq, 50,
            \modfreq, Pexprand(49, 52),
            \moddepth, Pexprand(5, 150),
            \dur, Pwhite(8.0, 10.0),
            \rel, Pkey(\dur) * 3,
            \attack, Pkey(\dur),
            \modattack, Pkey(\attack),
            \modrel, Pkey(\rel),
            \pan, Pwhite(-1.0, 1.0), 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium],
            // \fx2lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2lvl, -5.dbamp,
        )
    );
)


// Pdef(\fmdrone).play;
// Pdef(\fmdrone).stop;

// Synth(\pm, [\amp, -15.dbamp, \carfreq, 31, \modfreq, 61, \moddepth, 300, \attack, 2, \modattack, 9, \modrel, 9, \rel, 10]);


// 73.994099212393
// 46.30517964728
// 10.189873809735

// 47.222505114454
// 95.643449846338
// 18.927482031256

// 52.838129377326
// 56.493646518459
// 17.177142576153

// 43.033392581446
// 51.30132704554
// 12.219950287878

// 54.071053375304
// 108.10759229484
// 14.032120230759

// 50.098147830461
// 92.231685755906
// 11.570707309224

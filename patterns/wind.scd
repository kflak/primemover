(
    Pdef(\wind, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 10),
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \rel, 16,
            \attack, 3.0,
            // \amp, -26.dbamp,
            \db, 3,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		

    Pdef(\windBegin, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 6,
            \rate, 0.75,
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \attack, Pkey(\dur) * 0.8,
            \rel, Pkey(\dur) * 0.8,
            \db, Pseq((-70, -60..-2), Pseq([-2], inf), 1),
            \hipassfreq, 200,
            \fx1, ~bus[\jpverb],
            \fx1lvl, 0.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		

    Pdef(\windPulse, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 2,
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind]),
            \rel, Pkey(\dur) * 2,
            \attack, Pkey(\dur) * 0.2,
            \amp, 6.dbamp,
            \gain, 20,
            \thresh, -12.dbamp,
            \ratio, 8,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		

    Pdef(\windPulseSameBuf, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pwhite(2, 3),
            \rate, 1,
            \loop, 0,
            // \buf, ~buffers[\nurme_wind][1],
            \buf, Prand(~buffers[\nurme_wind], 12),
            \rel, Pkey(\dur) * 1.2,
            \attack, Pkey(\dur),
            \db, Pseries.fromEndpoints(12, -20, 12),
            \gain, 20,
            \thresh, -12.dbamp,
            \ratio, 8,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		

    Pdef(\windAccents,
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 1/3,
            \buf, Prand(~buffers[\stoveperc], inf),
            \rel, Pseq([
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
            ], 1),
            \amp, Pseq([ 0.5, 0.10, 0.06, 0.2, 0.10, 0.04] * 2),
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
        );
    );

    Pdef(\windOmaLaul, 
        Psym(
            Pseq([[\windPulse, \windAccents]], 30);
        )
    );

)

// Pdef(\windOmaLaul).play(TempoClock(1.25))
// Pdef(\windOmaLaul).stop;
// s.record("~/Desktop/windpulseEnd.aiff"); Pdef(\windPulseSameBuf).play(TempoClock(1));
// s.stopRecording;

// Pdef(\windPulseSameBuf).stop;
// Pdef(\windPulseSameBuf).play(TempoClock(1.0));

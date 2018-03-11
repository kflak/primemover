(
    Pdef(\dynKlangDrone, 
        Pbind(
            \instrument, \dyn_klang,
            \group, ~group[\instr],
            \freq, Pexprand(55, 88),
            \amp, Pwhite(-9.dbamp, -6.dbamp),
            \dur, Pexprand(5.0, 10.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(1.0, 50.0),
            \amdepth, Pwhite(100, 500),
            \fmfreq, Pexprand(0.01, 10),
            \fmdepth, Pwhite(2, 20),
            \spread, Pexprand(1.5, 2.5),
            \out, ~bus[\master],
            \attack, Pwhite(30, 45),
            \rel, Pwhite(20.0, 40.0),
        )
    );
)

// Pdef(\dynKlangDrone).play;
// Pdef(\dynKlangDrone).stop;

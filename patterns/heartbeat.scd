(
    ~heartbeatclock = TempoClock.new(1.2);
    ~heartbeat10clock = TempoClock.new(0.5);

    Pdef(\heartbeat, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pseq([50, 36], inf),
            \db, Pseq([-25, -30], inf) - 5,
            \dur, Pseq([0.2, 1], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\master],
            \attack, 0.01,
            \rel, 0.3
        )
    );

    Pdef(\heartbeat10, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pseq([50, 36, 33, 50, 35, 30, 48, 35, 30, 30], inf),
            \db, Pseq([-22, -25, -28, -22, -25, -30, -23, -30, -32, -35], inf),
            \dur, 0.2,
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\master],
            \attack, 0.01,
            \rel, 0.3
        )
    );
)

// Pdef(\heartbeat).play(~heartbeatclock);
// Pdef(\heartbeat).stop;


// ~heartbeatclock.tempo_(1.2);


// Pdef(\heartbeat10).play(~heartbeat10clock);
// Pdef(\heartbeat10).stop;
// ~heartbeat10clock.tempo_(1.0);

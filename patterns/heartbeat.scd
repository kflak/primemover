(
    ~heartbeatclock = TempoClock.new(1.2);
    ~heartbeat10clock = TempoClock.new(0.5);

    Pdef(\heartbeat, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-30, -35] + 1, inf),
            \dur, Pseq([0.2, 1], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            \attack, 0.01,
            \rel, 0.2,
            \da, 2,
        )
    );

    Pdef(\heartbeatHi, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-28, -33] - 0, inf),
            \dur, Pseq([0.2, 1], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            //for that time when you want a launchpad to have a heart. 
            //Not this show, unfortunately...
            // \midiout, Pfunc({
            //     128.do{|i|~launchpadOut.noteOn(0, i, ~launchpadColor[\redhi])};
            //     0.1.wait;
            //     ~launchpadOut.control(176, 0, 0);
            // }),
            \attack, 0.1,
            \rel, 0.3,
            \da, 2,
        )
    );

    Pdef(\heartbeatLo, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-28, -33] - 15, inf),
            \dur, Pseq([0.2, 1], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            \attack, 0.1,
            \rel, 0.3,
            \da, 2,
        )
    );

    Pdef(\heartbeat10, 
        Pbind(
            \instrument, \sineGate,
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

// Pdef(\heartbeatHi).play(TempoClock(0.8));
// Pdef(\heartbeatHi).stop;



// s.plotTree;
// ~heartbeatclock.tempo_(1.2);


// Pdef(\heartbeat10).play(~heartbeat10clock);
// Pdef(\heartbeat10).stop;
// ~heartbeat10clock.tempo_(1.0);

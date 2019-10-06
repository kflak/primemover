(
    ~heartbeatclock = TempoClock.new(1.2);
    ~heartbeat10clock = TempoClock.new(0.5);

    Pdef(\heartbeat, 
        Pbind(
            \instrument, \sineGate,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-30, -35] + 4, inf),
            \dur, Pseq([0.2, 0.2, Rest(0.8)], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            \attack, 0.004,
            \legato, 0.1,
            \rel, 0.2,
            \da, 2,
        )
    );

    Pdef(\heartbeatHi, 
        Pbind(
            \instrument, \sineGate,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-28, -33] + 4, inf),
            // \dur, Pseq([0.2, 1], inf),
            \dur, Pseq([0.2, 0.2, Rest(0.8)], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            \legato, 0.1,
            //for that time when you want a launchpad to have a heart. 
            //Not this show, unfortunately...
            // \midiout, Pfunc({
            //     128.do{|i|~launchpadOut.noteOn(0, i, ~launchpadColor[\redhi])};
            //     0.1.wait;
            //     ~launchpadOut.control(176, 0, 0);
            // }),
            // \attack, 0.1,
            \attack, 0.004,
            \rel, 0.3,
            \da, 2,
        )
    );

    Pdef(\heartbeatLo, 
        Pbind(
            \instrument, \sineGate,
            \group, ~group[\instr],
            \freq, Pseq([50, 50], inf),
            \db, Pseq([-28, -33] - 15, inf),
            // \dur, Pseq([0.2, 1], inf),
            \dur, Pseq([0.2, 0.2, Rest(0.8)], inf),
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\heartbeat],
            \legato, 0.1,
            // \attack, 0.1,
            \attack, 0.004,
            \rel, 0.3,
            \da, 2,
        )
    );

)

// Pdef(\heartbeat).play(TempoClock(0.8));
// Pdef(\heartbeat).stop;



// s.plotTree;
// ~heartbeatclock.tempo_(1.2);


// Pdef(\heartbeat10).play(~heartbeat10clock);
// Pdef(\heartbeat10).stop;
// ~heartbeat10clock.tempo_(1.0);

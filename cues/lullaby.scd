(
    fork {
        3.do {
            Synth(\clean_circle_pan, [
                \buf, ~buffers[\lullaby][0], 
                \attack, 20, 
                \rel, 300, 
                \loop, 1,
                \amp, -40.dbamp, 
                \hipassfreq, 500,
                \panspeed, 0.01, 
                \fx1, ~bus[\jpverb], 
                \fx1lvl, -12.dbamp]
            );
            50.wait;
        };
    };
)

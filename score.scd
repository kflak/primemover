(
    ~beginning = {
        "*Beginning*".postln;
        fork{
            ~wind.value(threshold: 0.1, min_amp: -30.dbamp); //all
            ~samp.value(); //all
            60.wait;
            ~klang_klank.value(); //11
            20.wait;
            ~aliina.value();
            20.wait;
            ~water.value();
            10.wait;
            ~wind_free.value(); //all
            ~samp_free.value(); //all
            ~klang_klank_free.value(); //11
            5.wait;
            Pdef(\tens).quant_(0).play(~tensclock);
            ~aliina_free.value();
            30.wait;
            ~water_free.value();
            ~wind.value(); //all
            ~samp.value(threshold: 0.5); //all
            60.wait;
            ~aliina.value(threshold: 0.7);
            ~samp_free.value(); //all
            ~wind_free.value();
            30.wait;
            ~samp.value(); //all
            ~wind.value(); //all
            30.wait;
            ~aliina.value(threshold: 0.2);
            Pdef(\tens).quant_(0).stop(~tensclock);
            ~wind_free.value();
            ~samp_free.value(); //all
            40.wait;
            ~aliina_free.value();
        }
    };

    ~crunchy_impro = {
        "*Crunchy_impro*".postln;
        ~chew.value();
        ~bubbles.value();
        ~chips.value();
    };

    ~wudan = {
        fork{
            "*wudan*".postln;
            5.wait;
            ~chew_free.value();
            ~bubbles_free.value();
            ~chips_free.value();
            10.wait;
            ~rec_mb_playback.value();
            45.wait;
            ~aliina_cry.value(threshold: 0.1);
        }
    };

    ~end = {
        "*End*".postln;
        ~rec_mb_playback_free.value();    
        ~aliina_cry_free.value();
    };

    ~open_mic1 = {
        ~mic1 = Synth(\soundin, [
            \in, 0,
            \lvlin, -6.dbamp,
            \out, ~bus[\master],
            \amp, -6.dbamp,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -3.dbamp,
            \pan, 0,
            \width, ~numSpeakers
        ], target: ~group[\instr]);
    };

    ~close_mic1 = {
        ~mic1.set(\gate, 0);
    };

    ~lullaby = {
        fork {
            3.do {
                Synth(\clean_circle_pan, [
                    \buf, ~buffers[\lullaby][0], 
                    \attack, 20, 
                    \rel, 300, 
                    \loop, 1,
                    \amp, -20.dbamp, 
                    \hipassfreq, 500,
                    \panspeed, 0.01, 
                    \fx1, ~bus[\jpverb], 
                    \fx1lvl, -12.dbamp]
                );
                50.wait;
            };
        };
    };

    ~swirl = {
        fork {
            Pdef(\rain).play;
            10.wait;
            Pdef(\sine).play;
            100.wait;
            Pdef(\cello).play;
            120.wait;
            Pdef(\em).play;
            60.wait;
            Pdef(\rain).stop;
            60.wait;
            Pdef(\metro).play;
            60.wait;
            Pdef(\cello).stop;
            Pdef(\fast_intro).play;
            40.wait;
            // 7:30
            Pdef(\fast_intro).stop;
            Pdef(\fast).play;
            40.wait;
            Pdef(\fast).stop;
            Pdef(\fast_next).play;
            Pdef(\nasa).play;
            Pdef(\crashes_1).play;
            Pdef(\em).stop;
            Pdef(\metro).stop;
            60.wait;
            // 9:10
            Pdef(\nasa).stop;
            Pdef(\crashes_1).stop;
            10.wait;
            Pdef(\fast_klang_liftoff_cue).play;
            Pdef(\nasa_liftoff).play;
            25.wait;
            Pdef(\fast_next).stop;
            15.wait;
            Pdef(\rain).play;
            Pdef(\sine).stop;
            60.wait;
            ~lullaby.value();
            60.wait;
            ~open_mic1.value();
            // 120.wait;
            Pdef(\rain).stop;
            120.wait;
            Pdef(\nasa_liftoff).stop;
        }
    };
)

// ~close_mic1.value();
// Pdef(\tens).play(~tensclock);
// ~swirl.value();
// ~lullaby.value();

// (
//     x = fork {
//         10.wait;
//         Pdef(\sine).play;
//         Pdef(\cello).play;
//         60.wait;
//         ~metro.value(threshold: 0.05, max_amp: -12.dbamp);
//         120.wait;
//         Pdef(\sine).stop;
//         Pdef(\cello).stop;
//         30.wait;
//         Pdef(\crashes_1).play;
//         130.wait;
//         Pdef(\crashes_1).stop;
//         ~metro_free.value();
//         20.wait;
//         ~chips.value(ids: [10, 11], max_amp: -12.dbamp);
//     }
// )
// ~wind_cc_free.value();
// ~chew_free.value();
// ~chips_free.value();
// ~metro_free.value();
// ~open_mic1.value();
// ~close_mic1.value();
// ~metro.value(threshold: 0.05);
// ~metro_free.value();
// ~nasa.value(threshold: 0.05, min_amp: -60.dbamp, max_amp: -30.dbamp);
// ~nasa_free.value();

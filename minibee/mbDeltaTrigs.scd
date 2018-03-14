(
    ~deltaTriggers = IdentityDictionary.new;
    MBDeltaTrig.mbData = ~mbData;
    MBDeltaTrig.numSpeakers = ~numSpeakers;

    ~deltaTriggers.put(\combdust, 
        MBDeltaTrig.new( 
            speedlim: 0.5, 
            threshold: 0.2, 
            minibeeID: 10, 
            minAmp: -70.dbamp, 
            maxAmp: -36.dbamp,
            function: { |outbus, dt, minAmp, maxAmp|
                Synth(\click_dust,
                    [
                        \attack, 0,
                        \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                        \density, dt.linlin(0.0, 1.0, 1, 20),
                        \rel, dt.linlin(0.0, 1.0, 2.0, 10.0),
                        \decaytime, dt * 5,
                        \delaytime, rrand(30, 1000).reciprocal,
                        \pan, rrand(-1.0, 1.0),
                        \out, outbus,
                        \fx1, ~bus[\jpverb],
                        \fx1lvl, rrand(-3, 0).dbamp,
                    ],
                    ~group[\instr]
                )
            };
            //channelParameters:
        )
    );

    ~deltaTriggers.put(\dust, 
        MBDeltaTrig.new( 
            speedlim: 0.5, 
            threshold: 0.2, 
            minibeeID: 12, 
            minAmp: -64.dbamp, 
            maxAmp: -16.dbamp,
            function: { |outbus, dt, minAmp, maxAmp|
                Synth(\fmgrain_dust, 
                    [
                        \attack, 0, 
                        \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                        \density, dt.linlin(0.0, 1.0, 1, 20), 
                        \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                        \pan, rrand(-1.0, 1.0), 
                        \carfreq, rrand(20, 800),
                        \modfreq, rrand(0.1, 20),
                        \grainsize, dt.linlin(0.0, 1.0, 0.01, 0.001), 
                        \out, outbus,
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(-6, 0).dbamp,
                    ], 
                    ~group[\instr]
                );
            };
        )
    );

    ~deltaTriggers.put(\nasa, 
        ~mbIDs.collect{|id| 
            MBDeltaTrig.new( 
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id, 
                minAmp: -32.dbamp, 
                maxAmp: -12.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                    var attack = release * 0.3;
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\nasa].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, attack,
                            \rel, release,
                            \rate, rrand(0.5, 1.5),
                            \pan, rrand(-1.0, 1.0), 
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-30, 0).dbamp
                        ], 
                        ~group[\instr]
                    );
                };
            )
        };
    );

    ~deltaTriggers.put(\metro,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.4,
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -12.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                    var attack = release * 0.3;
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\metro].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, attack,
                            \rel, release,
                            \rate, rrand(0.5, 1.5),
                            \pan, rrand(-1.0, 1.0), 
                            \hipassfreq, 120,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-30, 0).dbamp
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\ratio, 8, \limit, 0.8]
            )
        };
    );

    ~deltaTriggers.put(\em,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.4,
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -6.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                    var attack = release * 0.3;
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\em].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, attack,
                            \rel, release,
                            \rate, rrand(0.5, 1.5),
                            \pan, rrand(-1.0, 1.0), 
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-30, 0).dbamp
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\ratio, 8, \compgain, 16.dbamp, \limit, 0.8]
            );
        }
    );

    ~deltaTriggers.put(\wind,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.4, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -6.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                    var attack = release;
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\nurme_wind].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, attack,
                            \rel, release,
                            \rate, rrand(0.5, 1.5),
                            \pan, rrand(-1.0, 1.0), 
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, dt.linlin(0.0, 1.0, 0.3, 0.0)
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\ratio, 8, \compgain, 16.dbamp, \limit, 0.8]
            );
        }
    );

    ~deltaTriggers.put(\sine,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.05, 
                minibeeID: id, 
                minAmp: -60.dbamp, 
                maxAmp: -40.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(
                        \sine, [
                            \freq, exprand(660, 1200),
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \pan, rrand(-1.0, 1.0),
                            \amfreq, rrand(1, 5),
                            \fx1lvl, (dt * 4).clip(0.0, 1.0),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \rel, dt * 10,
                        ],
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\boiling,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 0.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\bubbles][0],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 18.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 2.0),
                            \startpos, rrand(0, ~buffers[\bubbles][0].numFrames),
                            \loop, 1,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-36, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\home,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -8.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\home_sounds][0],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 18.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 2.0),
                            \startpos, rrand(0, ~buffers[\home_sounds][0].numFrames),
                            \loop, 1,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-36, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            );
        }
    );

    ~deltaTriggers.put(\samp,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -12.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, (~buffers[\cello] ++ ~buffers[\brpiano]).choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 18.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 2.0),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-12, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\rec_mb_playback,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 2.5, 
                threshold: 0.1, 
                minibeeID: id,
                minAmp: -15.dbamp, 
                maxAmp: 0.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~rec_buf[~mbIDs.indexOf[id]],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \pan, rrand(-1.0, 1.0), 
                            \rel,  15,
                            \loop, 0,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(0.8, 1.0),
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 9.dbamp, \ratio, 4, \limit, 0.8, \locut, 90]
            )
        }
    );

    ~deltaTriggers.put(\birdie, 
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -36.dbamp, 
                maxAmp: 0.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(
                        \birdie, [
                            \out, outbus,
                            \grainsize, rrand(0.01, 0.2),
                            \density, 20.rand,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, 1.0.rand,
                            \fx2, ~bus[\grdelay],
                            \fx2lvl, 1.0.rand,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\water, 
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -6.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\water].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                            \loop, 0,
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.9, 1.2),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-12, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\chew, 
        [10, 11].do{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 6.dbamp, 
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\dancing_bodies][2],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 6.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 1.6),
                            \hipassfreq, 150,
                            \out, outbus,
                            // \fx1, ~bus[\jpverb], 
                            // \fx1lvl, rrand(-32, -12).dbamp,
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40]
            )
        }
    );

    ~deltaTriggers.put(\bubbles, 
        [10, 11].do{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 6.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\dancing_bodies][1],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 4.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.9, 1.2),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-32, -12).dbamp,
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40]
            )
        }
    );

    ~deltaTriggers.put(\chips, 
        [10, 11].do{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 6.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    // fork {
                    // var sustain = dt;
                    var release = dt * 4;
                    // var duration = sustain + release;
                    Synth(\varirate_perc, 
                        [
                            \buf, ~buffers[\chipskit].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \pan, rrand(-1.0, 1.0), 
                            \rel, release,
                            \ratefrom, rrand(0.9, 1.5),
                            \rateto, rrand(0.6, 1.5),
                            \ratedur, release,
                            \hipassfreq, 150,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-32, -12).dbamp,
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40]
            )
        }
    );

    ~deltaTriggers.put(\aliina_cry,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.15, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -6.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\aliina_unhappy].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, dt.linlin(0.0, 1.0, 1.0, 0.1),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                            \loop, 0,
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.9, 1.2),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-12, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\aliina,
        ~mbIDs.collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.2, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -6.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, (~buffers[\aliina_happy] ++ ~buffers[\aliina_unhappy] ++ ~buffers[\aliina_laugh]).choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, dt.linlin(0.0, 1.0, 1.0, 0.1),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.9, 1.2),
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-12, 0).dbamp,
                            \fx2, ~bus[\grdelay], 
                            \fx2lvl, rrand(-12, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                };
            )
        }
    );

    ~deltaTriggers.put(\klang,
        MBDeltaTrig.new(
            speedlim: 0.5, 
            threshold: 0.1, 
            minibeeID: 10,
            minAmp: -60.dbamp,
            maxAmp: -24.dbamp,
            function: {|outbus, dt, minAmp, maxAmp|
                Synth(\klang, [
                    \freq, exprand(40, 80), 
                    \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                    \spread, rrand(1.1, 3.5), 
                    \out, outbus,
                    \fx1, ~bus[\jpverb], 
                    \fx1lvl, rrand(0.2, 1.0),
                    \fx2, ~bus[\grdelay], 
                    \fx2lvl, rrand(-12, 0).dbamp,
                    \rel, dt * 12,
                ],
                ~group[\instr]);
            },
            channelParameters: [\ratio, 8, \compgain, 12.dbamp, \limit, 0.8]
        )
    );

    ~deltaTriggers.put(\klank,
        MBDeltaTrig.new(
            speedlim: 0.5, 
            threshold: 0.1, 
            minibeeID: 13,
            minAmp: -60.dbamp,
            maxAmp: -24.dbamp,
            function: {|outbus, dt, minAmp, maxAmp|
                Synth(\klank, [
                    \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                    \rel, dt * 10,
                    \freq, rrand(200, 1000), 
                    \spread, rrand(1.1, 3.5), 
                    \decay, rrand(0.1, 0.1),
                    \out, outbus,
                    \fx1, ~bus[\jpverb], 
                    \fx1lvl, rrand(0.2, 1.0),
                    \fx2, ~bus[\grdelay], 
                    \fx2lvl, rrand(-12, 0).dbamp,
                ],
                ~group[\instr])
            },
            channelParameters: [\ratio, 8, \compgain, 12.dbamp, \limit, 0.8]
        )
    );
)

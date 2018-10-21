(
    ~deltaTriggers = IdentityDictionary.new;
    MBDeltaTrig.mbData = ~mbData;
    MBDeltaTrig.numSpeakers = ~numSpeakers;

    ~deltaTriggers.put(\sineGrainIDs, [10]);
    ~deltaTriggers.put(\sineGrain,
        ~deltaTriggers[\sineGrainIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.07, 
                minibeeID: id, 
                minAmp: -50.dbamp, 
                maxAmp: -26.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    Synth(\sineGrainTrain,
                        [
                            \freq, exprand(660, 1100),
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \grainfreq, rrand(1.0, 10.0),
                            \grainsize, rrand(0.0001, 0.1),
                            \combdelay, rrand(0.0001, 0.001),
                            \combdecay, rrand(0.1, 2.0),
                            \comblvl, rrand(0.7, 1.0),
                            \hipassfreq, 150,
                            \hishelffreq, 1000,
                            \hishelfdb, -12,
                            \pan, rrand(-1.0, 1.0),
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, rrand(0, -12.dbamp),
                            \out, ~bus[\master],
                            \attack, dt.linlin(0.0, 1.0, 0.5, 3.0),
                            \rel, dt.linlin(0.0, 1.0, 1.0, 10.0)
                        ],
                        ~group[\instr]
                    );
                };
            )
        }
    );

    ~deltaTriggers.put(\ryuishIDs, [11]);
    ~deltaTriggers.put(\ryuish, 
        ~deltaTriggers[\ryuishIDs].collect{|id|
            MBDeltaTrig.new( 
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id, 
                minAmp: -70.dbamp, 
                maxAmp: -16.dbamp,
                function: { |outbus, dt, minAmp, maxAmp|
                    Synth(\klang,
                        [
                            \attack, dt.linlin(0.0, 1.0, 0.5, 3),
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \freq, 48 + [0, 2, 3, 5].midicps.choose,
                            \rel, dt.linlin(0.0, 1.0, 1.0, 4.0),
                            \pan, rrand(-1.0, 1.0),
                            \spread, rrand(1.995, 2.005),
                            \out, outbus,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, rrand(-24, -3).dbamp,
                        ],
                        ~group[\instr]
                    );
                    Synth(\klank,
                        [
                            \attack, dt.linlin(0.0, 1.0, 0.5, 3),
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \freq, 60 + [0, 2, 3, 5].midicps.choose,
                            \rel, dt.linlin(0.0, 1.0, 1.0, 4.0),
                            \pan, rrand(-1.0, 1.0),
                            \spread, rrand(1.995, 2.005),
                            \out, outbus,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, rrand(-24, -3).dbamp,
                        ],
                        ~group[\instr]
                    )
                };
                //channelParameters:
            )
        }
    );

    // ~deltaTriggers[\aliina];
    ~deltaTriggers.put(\combdustIDs, [12]);
    ~deltaTriggers.put(\combdust, 
        ~deltaTriggers[\combdustIDs].collect{|id|
            MBDeltaTrig.new( 
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id, 
                minAmp: -40.dbamp, 
                maxAmp: -16.dbamp,
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
        }
    );

    ~deltaTriggers.put(\dustIDs, [13]);
    ~deltaTriggers.put(\dust, 
        ~deltaTriggers[\dustIDs].collect{|id|
            MBDeltaTrig.new( 
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id, 
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
                            \carfreq, rrand(100, 800),
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
        }
    );

    ~deltaTriggers.put(\nasaIDs, [14]);
    ~deltaTriggers.put(\nasa, 
        ~deltaTriggers[\nasaIDs].collect{|id| 
            MBDeltaTrig.new( 
                speedlim: 0.5, 
                threshold: 0.1, 
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

    ~deltaTriggers.put(\metroIDs, [10]);
    ~deltaTriggers.put(\metro,
        ~deltaTriggers[\metroIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1,
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

    ~deltaTriggers.put(\emIDs, [11]);
    ~deltaTriggers.put(\em,
        ~deltaTriggers[\emIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1,
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 0.dbamp,
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
                            \fx1lvl, rrand(-30, 0).dbamp,
                            \fx2, ~bus[\grdelayMedium], 
                            \fx2lvl, rrand(-30, 0).dbamp
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\ratio, 8, \compgain, 16.dbamp, \limit, 0.8]
            );
        }
    );

    ~deltaTriggers.put(\windIDs, [12]);
    ~deltaTriggers.put(\wind,
        ~deltaTriggers[\windIDs].collect{|id|
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

    ~deltaTriggers.put(\sineIDs, [13]);
    ~deltaTriggers.put(\sine,
        ~deltaTriggers[\sineIDs].collect{|id|
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

    ~deltaTriggers.put(\boilingIDs, [14]);
    ~deltaTriggers.put(\boiling,
        ~deltaTriggers[\boilingIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
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

    ~deltaTriggers.put(\homeIDs, [10]);
    ~deltaTriggers.put(\home,
        ~deltaTriggers[\homeIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
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

    ~deltaTriggers.put(\sampIDs, [11]);
    ~deltaTriggers.put(\samp,
        ~deltaTriggers[\sampIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
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

    ~deltaTriggers.put(\rec_mb_playbackIDs, [12]);
    ~deltaTriggers.put(\rec_mb_playback,
        ~deltaTriggers[\rec_mb_playbackIDs].collect{|id|
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

    ~deltaTriggers.put(\birdieIDs, [13]);
    ~deltaTriggers.put(\birdie, 
        ~deltaTriggers[\birdieIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id,
                minAmp: -56.dbamp, 
                maxAmp: -26.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(
                        \birdie, [
                            \out, outbus,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
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

    ~deltaTriggers.put(\waterIDs, [14]); 
    ~deltaTriggers.put(\water, 
        ~deltaTriggers[\waterIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id,
                minAmp: -44.dbamp, 
                maxAmp: -18.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\water].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                            \loop, 0,
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 1.2),
                            \ratio, 4,
                            \hishelfdb, -6,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-12, 0).dbamp,
                            \fx2, ~bus[\grdelayMedium], 
                            \fx2lvl, rrand(-24, -12).dbamp,
                            \fx3, ~bus[\grdelayLong], 
                            \fx3lvl, rrand(-24, -12).dbamp,
                        ], 
                        ~group[\instr]
                    );
                },
            )
        }
    );

    ~deltaTriggers.put(\chewIDs, [10]); 
    ~deltaTriggers.put(\chew, 
        ~deltaTriggers[\chewIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.07, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 9.dbamp, 
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\dancing_bodies][2],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \gain, 9.dbamp,
                            \rel, dt.linlin(0.0, 1.0, 2.0, 6.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.5, 1.6),
                            \hipassfreq, 150,
                            \out, outbus,
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 25.dbamp, \ratio, 8, \limit, 0.8, \locut, 40]
            )
        }
    );

    ~deltaTriggers.put(\bubblesIDs, [11]); 
    ~deltaTriggers.put(\bubbles, 
        ~deltaTriggers[\bubblesIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.07, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 9.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, ~buffers[\dancing_bodies][1],
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \gain, 6.dbamp,
                            \rel, dt.linlin(0.0, 1.0, 2.0, 4.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, rrand(0.9, 1.2),
                            \hipassfreq, 150,
                            \out, outbus,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, rrand(-32, -12).dbamp,
                        ], 
                        ~group[\instr]
                    );
                }, 
                channelParameters: [\compgain, 20.dbamp, \ratio, 8, \limit, 0.8, \locut, 120]
            )
        }
    );

    ~deltaTriggers.put(\chipsIDs, [12]);
    ~deltaTriggers.put(\chips, 
        ~deltaTriggers[\chipsIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.07, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: 9.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    var release = dt * 4;
                    Synth(\varirate_perc, 
                        [
                            \buf, ~buffers[\chipskit].choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \gain, 9.dbamp,
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
                channelParameters: [\compgain, 25.dbamp, \ratio, 8, \limit, 0.8, \locut, 40]
            )
        }
    );

    ~deltaTriggers.put(\aliina_cryIDs, [13]);
    ~deltaTriggers.put(\aliina_cry,
        ~deltaTriggers[\aliina_cryIDs].collect{|id|
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

    ~deltaTriggers.put(\aliinaLaughIDs, [14]);
    ~deltaTriggers.put(\aliinaLaugh,
        ~deltaTriggers[\aliinaLaughIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id,
                minAmp: -32.dbamp, 
                maxAmp: -12.dbamp,
                function: {|outbus, dt, minAmp, maxAmp|
                    Synth(\clean, 
                        [
                            \buf, (~buffers[\aliina_laugh]).choose,
                            \amp, dt.linlin(0.0, 1.0, minAmp, maxAmp),
                            \attack, dt.linlin(0.0, 1.0, 1.0, 0.1),
                            \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                            \pan, rrand(-1.0, 1.0), 
                            \rate, 1,
                            \out, outbus,
                            \loop, 0,
                            \fx1, ~bus[\jpverb], 
                            \fx1lvl, -20.dbamp,
                            // \fx1lvl, rrand(-12, 0).dbamp,
                            // \fx2, ~bus[\grdelay], 
                            // \fx2lvl, rrand(-12, 0).dbamp,
                        ], 
                        ~group[\instr]
                    );
                };
            )
        }
    );

    ~deltaTriggers.put(\aliinaIDs, [10]);
    ~deltaTriggers.put(\aliina,
        ~deltaTriggers[\aliinaIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
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

    ~deltaTriggers.put(\klangIDs, [11]);
    ~deltaTriggers.put(\klang,
        ~deltaTriggers[\klangIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id,
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
        }
    );

    ~deltaTriggers.put(\klankIDs, [12]);
    ~deltaTriggers.put(\klank,
        ~deltaTriggers[\klankIDs].collect{|id|
            MBDeltaTrig.new(
                speedlim: 0.5, 
                threshold: 0.1, 
                minibeeID: id,
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
        }
    );
)

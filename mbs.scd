//TODO: Posture recognition
//TODO: Automate the creation of continuous controllers in the same was as with delta triggers
(
    var mb = [10, 11, 12, 13, 14, 15];
    var mb_delta_trig;
    var num_mbs = mb.size;
    var all_values = 0.0 ! 3 ! num_mbs;
    var all_prev = 0.0 ! 3 ! num_mbs;
    var deltas = 0.0 ! num_mbs;
    var resampling_freq = 20;
    var clock = SystemClock;
    var kbus = Dictionary.new();
    var rec_buf;
    var calc_delta = {|id|
        var cur, prev, dt, idx;
        idx = mb.indexOf(id);
        cur = all_values[idx].copy;
        prev = all_prev[idx].copy;

        if(prev.notNil) {
            dt = (cur - prev).abs.sum/3;
            all_prev[idx] = cur.copy;
            dt;
        }{
            all_prev[idx] = cur.copy;
        };
    };

    var tdef = {|name=\default, id=10, speedlim=0.2, threshold=0.3, min_amp, max_amp, trigfunc, outbus|
        Tdef(name.asSymbol, { 
            var free = true;
            inf.do({
                var idx = mb.indexOf(id);
                var dt = deltas[idx];
                if(free) {
                    if(dt > threshold){
                        trigfunc.value(outbus, dt, idx, min_amp, max_amp);
                        [name, dt, id, idx, min_amp, max_amp, outbus].postln;
                        free = false;    
                        clock.sched(speedlim,{
                            free = true;
                        });
                    };
                };
                resampling_freq.reciprocal.wait;
            });
        }).play;
    };

    var put_deltas = Routine { 
        inf.do {
            mb.do {|id, idx|
                deltas[idx] = calc_delta.value(id);
            };
            resampling_freq.reciprocal.wait;
        }
    }.play;

    //put all the mb data into one array
    OSCdef(\put_all, {|data|
        var idx = mb.indexOf(data[1]);
        all_values[idx] = (data[2..] * 15.0 - 7.0).clip(0.0, 1.0);
    }, '/minibee/data');

    /******************** rec_mb ********************/
    // connect recording to launchcontrol, plug recorded buffer into mb
    rec_buf = num_mbs.collect{Buffer.alloc(s, s.sampleRate, 1)};
    ~rec_mb = {
        var prime_buf = Buffer.alloc(s, s.sampleRate * 120, 1); //main buffer to use as input, will be copied to subsequent buffers
        var t0 = thisThread.seconds;
        var rec_synth;
        var name = \rec_mb;
        var inbus=s.options.numInputBusChannels;
        var start = {
            rec_synth = Synth(
                \rec_in, [
                    \in, inbus, 
                    \out, ~bus[\master], 
                    \buf, prime_buf, 
                    \fx1, ~bus[\jpverb];
                    \fx1lvl, 0.2,
                ]
            );
        };
        var stop = {|idx|
            var dur, samples, t1;
            fork {
                rec_synth.free;
                0.1.wait;
                t1 = thisThread.seconds;
                dur = t1 - t0;
                samples = (dur * s.sampleRate).asInt;
                rec_buf[idx].free;
                0.1.wait;
                rec_buf[idx] = Buffer.alloc(s, samples, 1);
                rec_buf.postln;
                prime_buf.copyData(rec_buf[idx], numSamples: samples);
                prime_buf.zero;
            }
        };
        mb.do {|id, idx|
            ~lc.elAt(\pg0, \bt, idx, 0).action_({
                start.value;
            }); //noteon, start recording
            ~lc.elAt(\pg0, \bt, idx, 1).action_({
                // var new_name=(name++id).asSymbol, speedlim=0.8, threshold=0.1;
                stop.value(idx); //noteoff, stop recording
                // tdef.value(new_name, id, speedlim, threshold, trigfunc);
            });
        };
    }.value();

    /******************** mb_delta_trig: all the "simple" delta-triggered functions in one array ********************/
    // syntax: [\name, speedlim, trigger-threshold, mb-id array, min amp, max amp, function to be triggered]
    mb_delta_trig = [
        [
            \combdust, 0.5, 0.2, [13], -70.dbamp, -36.dbamp,
            { |outbus, dt, idx, min_amp, max_amp|
                Synth(\click_dust, 
                    [
                        \attack, 0, 
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
                );
            },
        ],
        [
            \dust, 0.5, 0.1, [12], -64.dbamp, -16.dbamp, 
            { |outbus, dt, idx, min_amp, max_amp|
                Synth(\fmgrain_dust, 
                    [
                        \attack, 0, 
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
            },
        ],
        [
            \nasa, 0.5, 0.4, mb, -32.dbamp, -12.dbamp,
            { |outbus, dt, idx, min_amp, max_amp|
                var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                var attack = release * 0.3;
                Synth(\clean, 
                    [
                        \buf, ~buffers[\nasa].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
            }, \ratio, 8, \limit, 0.8
        ],
        [
            \metro, 0.5, 0.4, mb, -32.dbamp, -12.dbamp,
            { |outbus, dt, idx, min_amp, max_amp|
                var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                var attack = release * 0.3;
                Synth(\clean, 
                    [
                        \buf, ~buffers[\metro].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
            }, \ratio, 8, \limit, 0.8
        ],
        [
            \em, 0.5, 0.4, mb, -32.dbamp, -6.dbamp,
            { |outbus, dt, idx, min_amp, max_amp|
                var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                var attack = release * 0.3;
                Synth(\clean, 
                    [
                        \buf, ~buffers[\em].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
            }, \ratio, 8, \compgain, 16.dbamp, \limit, 0.8
        ],
        [
            \wind, 0.5, 0.4, mb, -32.dbamp, -6.dbamp,
            { |outbus, dt, idx, min_amp, max_amp|
                var release = dt.linlin(0.0, 1.0, 3.0, 5.0);
                var attack = release;
                Synth(\clean, 
                    [
                        \buf, ~buffers[\nurme_wind].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
            }, \ratio, 8, \compgain, 16.dbamp, \limit, 0.8
        ],
        [
            \sine, 0.5, 0.05, [10, 11], -60.dbamp, -40.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(
                    \sine, [
                        \freq, exprand(660, 1200),
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \boiling, 0.5, 0.2, mb, -32.dbamp, 0.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\bubbles][0],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \home, 0.5, 0.2, mb, -32.dbamp, -8.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\home_sounds][0],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \samp, 0.5, 0.2, mb, -32.dbamp, -12.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, (~buffers[\cello] ++ ~buffers[\brpiano]).choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \rec_mb_playback, 2.5, 0.1, mb, -15.dbamp, 0.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, rec_buf[idx],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
                        \pan, rrand(-1.0, 1.0), 
                        \rel,  15,
                        \loop, 0,
                        \out, outbus,
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(0.8, 1.0),
                    ], 
                    ~group[\instr]
                );
            }, \compgain, 9.dbamp, \ratio, 4, \limit, 0.8, \locut, 90
        ],
        [
            \birdie,  0.5, 0.2, mb, -36.dbamp, 0.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
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
        ],
        [
            \evev,  0.5, 0.2, mb, -32.dbamp, 0.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\evev][idx],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
                        \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                        \pan, rrand(-1.0, 1.0), 
                        \rate, rrand(0.9, 1.2),
                        \out, outbus,
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(-12, 0).dbamp,
                        // \fx2, ~bus[\grdelay], 
                        // \fx2lvl, rrand(-12, 0).dbamp,
                    ], 
                    ~group[\instr]
                );
            }, \ratio, 8, \compgain, 16.dbamp, \limit, 0.8
        ],
        [
            \water,  0.5, 0.2, mb,-32.dbamp, -6.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\water].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \chew,  0.5, 0.2, [12], -32.dbamp, 6.dbamp, 
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\dancing_bodies][3],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
                        \rel, dt.linlin(0.0, 1.0, 2.0, 6.0), 
                        \pan, rrand(-1.0, 1.0), 
                        \rate, rrand(0.5, 1.6),
                        \hipassfreq, 150,
                        \out, outbus,
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(-24, -6).dbamp,
                    ], 
                    ~group[\instr]
                );
            }, \compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40
        ],
        [
            \bubbles,  0.5, 0.2, [14], -32.dbamp, 6.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\dancing_bodies][2],
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
                        \rel, dt.linlin(0.0, 1.0, 2.0, 10.0), 
                        \pan, rrand(-1.0, 1.0), 
                        \rate, rrand(0.9, 1.2),
                        \out, outbus,
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(-12, 0).dbamp,
                    ], 
                    ~group[\instr]
                );
            }, \compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40
        ],
        [
            \chips,  0.5, 0.2, [13], -32.dbamp, 6.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                // fork {
                // var sustain = dt;
                var release = dt * 4;
                // var duration = sustain + release;
                Synth(\varirate_perc, 
                    [
                        \buf, ~buffers[\chipskit].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
                        \pan, rrand(-1.0, 1.0), 
                        \rel, release,
                        \ratefrom, rrand(0.9, 1.5),
                        \rateto, rrand(0.6, 1.5),
                        \ratedur, release,
                        \hipassfreq, 150,
                        \out, outbus,
                        // \fx1, ~bus[\jpverb], 
                        // \fx1lvl, rrand(-6, 0).dbamp,
                    ], 
                    ~group[\instr]
                );
            }, \compgain, 12.dbamp, \ratio, 8, \limit, 0.8, \locut, 40
        ],
        [
            \aliina_cry, 0.5, 0.15, mb, -32.dbamp, -6.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, ~buffers[\aliina_unhappy].choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \aliina, 0.5, 0.2, mb, -32.dbamp, -6.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                Synth(\clean, 
                    [
                        \buf, (~buffers[\aliina_happy] ++ ~buffers[\aliina_unhappy] ++ ~buffers[\aliina_laugh]).choose,
                        \amp, dt.linlin(0.0, 1.0, min_amp, max_amp),
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
        ],
        [
            \klang_klank, 0.5, 0.1, [10, 13], -60.dbamp, -24.dbamp,
            {|outbus, dt, idx, min_amp, max_amp|
                [
                    {
                        Synth(\klang, [
                            \freq, exprand(40, 80), 
                            \amp, dt.linlin(0.0, 1.0, -60.dbamp, -24.dbamp),
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
                    {
                        Synth(\klank, [
                            \amp, dt.linlin(0.0, 1.0, -32.dbamp, -6.dbamp),
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
                ].choose.value;
            }, \ratio, 8, \compgain, 12.dbamp, \limit, 0.8
        ]
    ];


    /******************** create tdefs based on mb_delta_trig ********************/ 
    mb_delta_trig.do {|item|
        var name_ = item[0].asSymbol;
        var speedlim_ = item[1];
        var threshold_ = item[2];
        var ids_ = item[3];
        var min_amp_ = item[4];
        var max_amp_ = item[5];
        var trigfunc_ = item[6];
        var freefunc = (name_++\_free).asSymbol;
        var bus = Bus.audio(s, ~numSpeakers); //from SOUNDMAKING synths to CHANNELSTRIP
        var channel_strip_params = item[7..];
        name_.envirPut({
            arg speedlim = speedlim_, threshold = threshold_, ids = ids_, min_amp = min_amp_, max_amp = max_amp_, name = name_, trigfunc = trigfunc_;
            var tdef_names = ids.collect({|id| name++id.asSymbol});
            var channel_strip = Synth(
                \chstrip_multi, [ \in, bus, \out, ~bus[\master] ] ++ channel_strip_params, target: ~group[\mix]
            );
            tdef_names.do{|tname, idx| 
                postf("Tdef('%') created\n", tname);
                tdef.value(tname, ids[idx], speedlim, threshold, min_amp, max_amp, trigfunc, bus);
            };    
            freefunc.envirPut({
                tdef_names.do{|tname|
                    postf("Tdef('%') cleared\n", tname);
                    Tdef(tname.asSymbol).clear;
                };
                clock.sched(45, {channel_strip.free; bus.free});
            });
        });
    };

    /******************** continuous controls ********************/

    /******************** continuous controls ********************/
    ~wind_cc_generator = {
        arg ids = [10, 11];
        var name = \wind_cc;
        var freefunc = name++\_free.asSymbol;
        name.envirPut({
            var tdef_names = ids.collect({|id| name++id.asSymbol});
            tdef_names.do{|tname, idx|
                var synthname = tname++\_synth;
                synthname.asSymbol.envirPut( 
                    Synth(\cleangate, [
                        \buf, ~buffers[\nurme_wind][idx], 
                        \loop, 1, 
                        \amp, 0.0, 
                        \lagup, 0.5,
                        \lagdown, 1.5,
                        \pan, idx.linlin(0, ids.size, 0.0, 1.0),
                        \width, ~numSpeakers,
                        \gate, 1,
                        \hipassfreq, 120,
                        \out, ~bus[\master],
                    ], target: ~group[\instr],)
                );
                Tdef(tname.asSymbol, {
                    var amp, lowpassfreq, fx1lvl;
                    var id = mb.indexOf(ids[idx]);
                    inf.do({
                        amp = (deltas[id] * 9.0).clip(0.0, 1.0);
                        lowpassfreq = all_values[id][0] * 10000 + 40;
                        fx1lvl = (deltas[id] * 15.0).clip(0.0, 1.0);
                        synthname.asSymbol.envirGet.set(\amp, amp, \lowpassfreq, lowpassfreq, \fx1lvl, fx1lvl);
                        (1/resampling_freq).wait;
                    });
                }).play;
                postf("Tdef('%') created\n", tname);
            };
            freefunc.asSymbol.envirPut({
                tdef_names.do{|tname|
                    var synthname = tname++\_synth;
                    Tdef(tname.asSymbol).clear;
                    synthname.asSymbol.envirGet.set(\gate, 0);
                    postf("Tdef('%') cleared\n", tname);
                };
            });
        })
    }.value();

    // ~wind_cc.value();
    // ~wind_cc_free.value();

    ~homodeus_cc_generator = {
        arg ids = [10, 11];
        var name = \homodeus_cc;
        var freefunc = name++\_free.asSymbol;
        name.envirPut({
            var tdef_names = ids.collect({|id| name++id.asSymbol});
            tdef_names.do{|tname, idx|
                var synthname = tname++\_synth;
                synthname.asSymbol.envirPut( 
                    Synth(\cleangate, [
                        \buf, ~buffers[\homodeus][idx],
                        \loop, 1, 
                        \amp, 0.0, 
                        \lagup, 0.3,
                        \lagdown, 1.5,
                        \width, ~numSpeakers,
                        \gate, 1,
                        \hipassfreq, 120,
                        \out, ~bus[\master],
                    ], target: ~group[\instr],)
                );
                Tdef(tname.asSymbol, {
                    var rate, amp, lowpassfreq, fx1lvl;
                    var id = mb.indexOf(ids[idx]);
                    inf.do({
                        amp = (deltas[id] * 6.0).clip(0.0, -12.dbamp);
                        // rate = (deltas[id] * 6).clip(0.5, 1.0);
                        rate = (all_values[id][0] * 2).clip(0.75, 1.0);
                        lowpassfreq = all_values[[id][0]] * 10000 + 40;
                        fx1lvl = (deltas[[id]] * 15.0).clip(0.0, 1.0);
                        synthname.asSymbol.envirGet.set(\amp, amp, \lowpassfreq, lowpassfreq, \fx1lvl, fx1lvl, \rate, rate);
                        (1/resampling_freq).wait;
                    });
                }).play;
                postf("Tdef('%') created\n", tname);
            };
            freefunc.asSymbol.envirPut({
                tdef_names.do{|tname|
                    var synthname = tname++\_synth;
                    Tdef(tname.asSymbol).clear;
                    synthname.asSymbol.envirGet.set(\gate, 0);
                    postf("Tdef('%') cleared\n", tname);
                };
            });
        })
    }.value();

    // ~homodeus_cc.value();
    // ~homodeus_cc_free.value();

    ~scrub_cc_generator = {
        arg ids = [10, 11], lagup=1, lagdown=1.5;
        var name = \scrub_cc;
        var freefunc = name++\_free.asSymbol;
        name.envirPut({
            var tdef_names = ids.collect({|id| name++id.asSymbol});
            tdef_names.do{|tname, idx|
                var synthname = tname++\_synth;
                synthname.asSymbol.envirPut( 
                    Synth(\scrub, [
                        \buf, ~buffers[\song][idx],
                        \amp, 0.0, 
                        \grainsize, 1,
                        \lagup, lagup,
                        \lagdown, lagdown,
                        \gate, 1,
                        \hipassfreq, 120,
                        \out, ~bus[\master],
                    ], target: ~group[\instr],)
                );
                Tdef(tname.asSymbol, {
                    var amp, fx1lvl, pos;
                    var id = mb.indexOf(ids[idx]);
                    inf.do({
                        amp = (deltas[id] * 6.0).clip(0.0, -12.dbamp);
                        if (amp < 0.1){amp = 0};
                        fx1lvl = (deltas[id] * 6.0).clip(0.0, -12.dbamp);
                        pos = all_values[id][0];
                        synthname.asSymbol.envirGet.set(\amp, amp, \pos, pos, \fx1lvl, fx1lvl);
                        (1/resampling_freq).wait;
                    });
                }).play;
                postf("Tdef('%') created\n", tname);
            };
            freefunc.asSymbol.envirPut({
                tdef_names.do{|tname|
                    var synthname = tname++\_synth;
                    Tdef(tname.asSymbol).clear;
                    synthname.asSymbol.envirGet.set(\gate, 0);
                    postf("Tdef('%') cleared\n", tname);
                };
            });
        })
    }.value();

    // ~scrub_cc.value();
    // ~scrub_cc_free.value();
    
    /******************** posture recognition ********************/
    ~num_poses = 8;
    ~pos_mbs = mb;
    ~poses = -1.0 ! (~pos_mbs.size * 3) ! ~num_poses;
    ~pos_put = {|in|
        ~poses[in] = all_values.copy.flatten; //record pose
        [in, ~poses[in]].postln;
    };

    ~pos_rec = {|name=\defaultpos, speedlim=0.2, threshold=0.2, trigfunc|

        var pos_compare = {|mb_array|
            var min = 1.0;
            var in = mb_array.flatten;
            var closest_match = -1;
            ~poses.do({|item, idx|
                var diff;
                if(in.size == item.size){
                    diff = in - item;
                    diff = diff.abs.sum;
                    diff = diff / ~num_poses;
                    if (diff < min) {
                        closest_match = idx;
                        min = diff;
                    };
                };
            });
            [closest_match, min];
        };

        var tdef = {|name, speedlim, threshold, trigfunc|
            Tdef(name.asSymbol, {|trigfunc|
                var pos_sr = 10; //frequency of comparing postures
                var free = true;
                inf.do({
                    if (free) {
                        var in = pos_compare.value(all_values.flatten);
                        var pos_idx = in[0];
                        var value = in[1];
                        if (value < threshold) {
                            trigfunc.value(pos_idx);
                            free = false;    
                            clock.sched(speedlim,{
                                free = true;
                            });
                        }; 
                    };
                    pos_sr.reciprocal.wait;
                });
            }).play;
        };
        tdef.value(name, speedlim, trigfunc, threshold);
    };

)

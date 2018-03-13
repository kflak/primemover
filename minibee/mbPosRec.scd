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
    /******************** rec_mb ********************/
    // connect recording to launchcontrol, plug recorded buffer into mb
    ~rec_buf = num_mbs.collect{Buffer.alloc(s, s.sampleRate, 1)};
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
                ~rec_buf[idx].free;
                0.1.wait;
                ~rec_buf[idx] = Buffer.alloc(s, samples, 1);
                ~rec_buf.postln;
                prime_buf.copyData(~rec_buf[idx], numSamples: samples);
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



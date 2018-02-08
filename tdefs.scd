(

    /******************** swarm behavior ********************/

    //dictionary for globally accessible swarm variables
    ~swarm = Dictionary();

    Tdef(\swarm, {
        var freq, amp, pan;
        var numsounds=32;
        var lag=0.5;
        var freqavg=0.0, ampavg=0.0, panavg=0.0;
        var freqlimit = 2.midicps;
        var maxfreq=40.midicps, minfreq=10.midicps; 
        var maxrate=20, minrate=0.5;
        var maxamp=0.9/numsounds, minamp=0.5/numsounds;
        ~swarm[\sound] = Array.newClear(numsounds);

        freq = ({rrand(minfreq,maxfreq)} ! numsounds);
        amp = ({rrand(minamp, maxamp)} ! numsounds);
        pan = ({rrand(-0.7,0.7)} ! numsounds);


        // populate array of synths acoording to a probability distribution of synths...
        numsounds.do({ arg i;
            var synth = [\bpnoise, \cleangate].wchoose([50, 20].normalizeSum);

            ~swarm[\sound][i] = (
                Synth(
                    synth, [
                        \attack, 20,
                        \freq, freq[i],
                        \rate, freq[i].linlin(minfreq, maxfreq, minrate, maxrate),
                        \rq, rrand(1, 15).reciprocal,
                        \amp, amp[i],
                        \pan, pan[i],
                        \lag, lag,
                        \amfreq, rrand(0.5, 5),
                        \amdepth, rrand(0.5, 3),
                        \gate, 1,
                        \fx1, ~bus[\jpverb],
                        \fx1lvl, rrand(0.2, 0.8),
                        \rel, rrand(50, 120),
                        \buf, (~buffers[\dancing_bodies]++~buffers[\brpiano]).choose,
                        \out, ~bus[\swarm],
                        \attack, rrand(60, 360),
                    ], target: ~group[\instr]
                )
            );

            freqavg = freqavg + freq[i];
            ampavg = ampavg + amp[i];
            panavg = panavg + pan[i];

        });

        //get initial average frequency, amp and pan

        freqavg = freqavg/freq.size;
        ampavg = ampavg/amp.size;
        panavg = panavg/pan.size;

        // go for the swarming behavior!

        inf.do({

            var freqsum=0.0, ampsum=0.0, pansum=0.0;
            var new_min_rate=0.5, new_max_rate=50;

            numsounds.do({ arg i;
                var freqdist=0.0, ampdist=0.0, pandist=0.0,
                minfreqdistpos = (1000 ! numsounds), minfreqdistneg= (-1000 ! numsounds),
                minampdistpos=1, minampdistneg= -1,
                minpandistpos=2, minpandistneg= -2;

                //calculate distances to average frequency, amp, pan
                freqdist = freqavg - freq[i];
                ampdist = ampavg - amp[i];
                pandist = panavg - pan[i];

                //figure out the distance to the closest neighbor...
                numsounds.do({ arg j;
                    var freqd, ampd, pand;
                    if(i != j){
                        freqd = freq[j]-freq[i];
                        if (freqd.isPositive){
                            if(freqd < minfreqdistpos[i]){
                                minfreqdistpos[i] = freqd;
                            }
                        }{
                            if(freqd > minfreqdistneg[i]){
                                minfreqdistneg[i] = freqd;
                            };
                        };
                    };

                });

                // which ~swarm[\sound] has only one neighbor?
                if(minfreqdistpos[i] == 1000){minfreqdistpos[i] = 0.0};
                if(minfreqdistneg[i] == -1000){minfreqdistneg[i] = 0.0};


                // move 1/10th of the distance towards the average freq, amp, pan. TODO: amp and pan
                if ((minfreqdistpos[i] > freqlimit) || (minfreqdistneg[i] < freqlimit.neg)){
                    freq[i] = freq[i] + (freqdist * 0.1);
                }{
                    freq[i] = freq[i] + minfreqdistpos[i] + minfreqdistneg[i];
                };

                //make the occasional random jump
                if(0.97.coin){
                    freq[i] = freq[i] + rrand(-2.0, 2.0)
                }{
                    freq[i] = freq[i] + rrand(-1000, 1000)
                };

                freq[i] = freq[i].clip(0.1,127.midicps);

                //clear out some space in the mid range
                //			if((freq[i] > 50.midicps) && (freq[i] < 75.midicps)){ freq[i] = freq[i] * 0.25}; //2 octaves down
                //			if((freq[i] > 75.midicps) && (freq[i] < 90.midicps)){ freq[i] = freq[i] * 2 }; //1 octaves up

                amp[i] = amp[i] + (ampdist * 0.1);
                amp[i] = amp[i].clip(0.0, 0.3);
                pan[i] = pan[i] + (pandist * 0.1);

                //calculate the running sums
                freqsum = freqsum + freq[i];
                ampsum = ampsum + amp[i];
                pansum = pansum + pan[i];

                ~swarm[\sound][i].set(
                    \freq, freq[i],
                    \rate, freq[i].linlin(20, 127.midicps, new_min_rate, new_max_rate),
                    \amp, amp[i],
                    \pan, pan[i],
                    \amfreq, rrand(0.5, 10),
                    \amdepth, rrand(0.4, 1.0)
                );
            });

            //get new average values
            freqavg = freqsum/freq.size;
            ampavg = ampsum/amp.size;
            panavg = pansum/pan.size;

            rrand(lag, lag * 4).wait;
        });
    });

    /******************** end swarm ********************/

    /******************** sine_gran ********************/
    Tdef(\sine_gran, 
        {
            inf.do {
                Synth(\sine, [
                    \freq, exprand(660, 1200),
                    \amp, rrand(-70.dbamp, -60.dbamp),
                    \pan, rrand(-1.0, 1.0),
                    \amfreq, rrand(1, 5),
                    \fx1lvl, rrand(0.3, 1.0),
                    \out, ~bus[\sine],
                    \fx1, ~bus[\jpverb], 
                    \fx2, ~bus[\grdelay], 
                    \fx2lvl, rrand(0.9, 1.0),
                    \rel, rrand(3.0, 10.0),
                ],
                ~group[\instr]);
                exprand(0.5, 15.0).wait;
            };
        };
    );

    /******************** sine_harm ********************/
    Tdef(\sine_harm, 
        {
            inf.do {
                Synth(\sine, [
                    \freq, [60, 64, 67, 70, 72].choose.midicps,
                    \amp, rrand(-60.dbamp, -30.dbamp),
                    \pan, rrand(-1.0, 1.0),
                    \amfreq, exprand(1.0, 20.0),
                    \fx1lvl, exprand(0.3, 1.0),
                    \out, ~bus[\sine],
                    \fx1, ~bus[\jpverb], 
                    \attack, rrand(0.5, 2.0),
                    \rel, rrand(3.0, 10.0),
                ],
                ~group[\instr]);
                exprand(0.5, 15.0).wait;
            };
        };
    );


    /******************** klang_klank ********************/
    Tdef(\klang_klank, {
        inf.do {
            [
                {
                    Synth(\klang, [
                        \freq, exprand(40, 80), 
                        \amp, rrand(-60.dbamp, -24.dbamp),
                        \spread, rrand(1.1, 3.5), 
                        \pan, rrand(-1.0, 1.0),
                        \out, ~bus[\klang_klank],
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(0.2, 1.0),
                        \fx2, ~bus[\grdelay], 
                        \fx2lvl, rrand(0.9, 1.0),
                        \rel, rrand(3.0, 12.0),
                    ],
                    ~group[\instr]);
                },
                {
                    Synth(\klank, [
                        \amp, rrand(-32.dbamp, -24.dbamp),
                        \rel, rrand(4.0, 10.0),
                        \freq, rrand(200, 1000), 
                        \pan, rrand(-1.0, 1.0),
                        \spread, rrand(1.1, 3.5), 
                        \decay, rrand(0.1, 0.1),
                        \out, ~bus[\klang_klank],
                        \fx1, ~bus[\jpverb], 
                        \fx1lvl, rrand(0.2, 1.0),
                        \fx2, ~bus[\grdelay], 
                        \fx2lvl, rrand(0.9, 1.0),
                    ],
                    ~group[\instr])
                },
            ].wchoose([50, 50].normalizeSum).value;
            exprand(1.0, 10.0).wait;
        }
    });

    /******************** beach emulator ********************/
    Tdef(\beach, {
        inf.do({
            Synth(\bpnoise, [
                \rel, rrand(8, 40),
                \attack, rrand(10, 15),
                \pan, rrand(-1.0, 1.0),
                \freq, rrand(1000, 3000),
                \rq, rrand(0.8,1),
                \amp, 0.15
            ]);
            rrand(2, 10).wait;
        })
    });
)

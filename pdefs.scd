(
    //******************** tens ********************  	
    var buf = ~buffers[\brpiano]++~buffers[\cello]++~buffers[\rubberball];
    var bufquiet = ~buffers[\brpiano]++~buffers[\cello];
    ~tensclock = TempoClock.new(2.0);

    Pdef(\buf, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pshuf((1.0 ! 2) ++ (0.5 ! 5) ++ (0.25 ! 2), 1),
            \rate, Prand((-2.0, -1.875 .. -0.25) ++ (0.5, 1.0 .. 2.0), inf),
            \attack, 0.02,
            \amp, Pseq([
                0.3, 
                Pwhite(0.08, 0.1, 2),
                0.3, 
                Pwhite(0.08, 0.1, 2),
                0.2, 
                Pwhite(0.08, 0.1, 6) ], 1 
            ),
            \buf, Prand(buf, inf),
            \startpos, Pif(
                Pkey(\rate).isNegative, 
                48000, 
                0
            ),
            \ratio, 8,	
            \gain, 3.dbamp,
            \thresh, -12.dbamp,
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \rel, Pexprand(0.8, 1.5, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\bufquiet, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pshuf([1.0] ++ (0.5 ! 4) ++ (0.25 ! 8), 1),
            \rate, Prand((0.5, 1.0 .. 2.0), inf),
            \attack, 0.2,
            \amp, Pseq(
                [
                    0.1, 
                    Pwhite(0.08, 0.1, 2),
                    0.1, 
                    Pwhite(0.08, 0.1, 2),
                    0.1, 
                    Pwhite(0.08, 0.1, 6) 
                ], 1 
            ),
            \buf, Prand(bufquiet, inf),
            \startpos, Pif(
                Pkey(\rate).isNegative, 
                48000, 
                0
            ),
            \ratio, 8,	
            \gain, 0.dbamp,
            \thresh, -12.dbamp,
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            // \fx1lvl, Pwhite(0.6, 1.0, inf),
            \rel, Pseq([
                0.4,
                Pexprand(0.2, 0.3, 2),
                0.4,
                Pexprand(0.2, 0.3, 2),
                0.4,
                Pexprand(0.2, 0.3, 3), ]
            ),
            \out, ~bus[\tens],
        )
    );

    Pdef(\klank, 
        Pbind(
            \instrument, \klank,
            \group, ~group[\instr],
            \midinote, Pseq(Array.series(10, 80, -10), inf),
            \spread, Pwhite(1.1, 3, inf),
            \dur, 0.5, 
            \attack, 0,
            \amp, Pseq(Array.geom(10, 0.9, 0.6), 1),
            \rel, 0.5,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\klang, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \midinote, Pwhite(30, 32, inf),
            \dur, 0.5, 
            \attack, 0.001,
            \db, Pseq([-12, Pwhite(-40, -30, 2), -15, Pwhite(-40, -30, 2), -24, Pwhite(-40, -30, 3)]),
            \rel, 0.5,
            \out, ~bus[\tens],
        )
    );

    Pdef(\sine_boom, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, 60,
            \dur, Pseq([3.0], 1),
            \db, -25,
            \attack, 0.01, 
            \rel, 0.4,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
        )
    );


    Pdef(\reso_boom, 
        Pbind(
            \instrument, \reso,
            \group, ~group[\instr],
            \freq, 30,
            \dur, Pseq([3.0], 1),
            \db, -40,
            \attack, 0.03, 
            \spread, Pwhite(1.1, 5.0, inf),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-70.dbamp, -30.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\reso, 
        Pbind(
            \instrument, \reso,
            \group, ~group[\instr],
            \freq, Pseq([
                30,
                Pexprand(60, 700, inf)
            ]),
            \dur, Pseq([
                1.0,
                Pshuf((0.5 ! 2), (0.25 ! 4), 1), ], 1
            ),
            \db, Pseq([-30, Pwhite(-50, -40, inf), inf]),
            \attack, 0.03, 
            \pan, Pwhite(-1.0, 1.0, inf),
            \spread, Pwhite(1.1, 5.0, inf),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\resoquiet, 
        Pbind(
            \instrument, \reso,
            \group, ~group[\instr],
            \freq, Pseq([
                30,
                Pexprand(60, 700, inf)
            ]),
            \dur, Pseq([
                1.0,
                Pshuf((0.5 ! 2), (0.25 ! 4), 1), ], 1
            ),
            \amp, Pseq([
                0.02,
                Pwhite(0.001, 0.02, inf)], inf
            ),
            \attack, 0, 
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\countin,
        Pbind(
            \instrument, \reso,
            \group, ~group[\instr],
            \dur, Pseq((0.5 ! 8) ++ (0.25 ! 4)), 
            \spread, Pwhite(1.1, 5, inf),
            \freq, Pseq([
                30,
                Pexprand(100, 500, 2),
                Pwhite(40, 60, 1),
                Pexprand(100, 500, 2),
                Pwhite(40, 60, 1),
                Pexprand(100, 500, 6)], 1
            ),
            \amp, Pseq([
                0.03,
                Pwhite(0.01, 0.02, 2),
                0.02,
                Pwhite(0.01, 0.02, 2),
                0.02,
                Pwhite(0.01, 0.02, 6)], 1
            ),
            \attack, 0,
            \pan, Pwhite(-1.0, 1.0, inf),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \out, ~bus[\tens],
        );	
    );

    Pdef(\countinquiet,
        Pbind(
            \instrument, \reso,
            \group, ~group[\instr],
            \dur, Pseq((0.5 ! 3) ++ (0.25 ! 6) ++ (0.5 ! 2) ++ (0.25 ! 4)), 
            \spread, Pwhite(1.1, 5, inf),
            \freq, Pseq([
                60,
                Pexprand(100, 500, 2),
                Pwhite(60, 80, 1),
                Pexprand(100, 500, 2),
                Pwhite(60, 80, 1),
                Pexprand(100, 500, 6)], 1
            ),
            \amp, Pseq([
                0.03,
                Pwhite(0.005, 0.01, 2),
                0.02,
                Pwhite(0.005, 0.01, 5),
                0.02,
                Pwhite(0.005, 0.01, 6)], 1
            ),
            \attack, 0,
            \pan, Pwhite(-1.0, 1.0, inf),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \out, ~bus[\tens],
        );	
    );

    Pdef(\aliina_laugh, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 0.5,
            \buf, Prand(~buffers[\aliina_laugh], inf),
            \rel, 0.5,
            \amp, Pseq([ 0.25, 0.16, 0.16, 0.25, 0.16, 0.16, 0.25, 0.16, 0.16, 0.16] * 0.8),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(0.2, 0.6),
        );
    );		

    Pdef(\click_stove, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 0.5,
            \buf, Prand(~buffers[\stoveperc], inf),
            \rel, Pseq([
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
                Pwhite(0.1, 0.1, 1),
                Pwhite(0.05, 0.1, 3),
            ], 1),
            \amp, Pseq([ 0.2, 0.02, 0.02, 0.1, 0.02, 0.02, 0.1, 0.02, 0.02, 0.02] * 0.8),
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
        );
    );		

    Pdef(\click, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 0.5,
            \buf, Prand(~buffers[\water], inf),
            \rel, Pseq([
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
                Pwhite(0.1, 0.2, 1),
                Pwhite(0.05, 0.1, 2),
                Pwhite(0.1, 0.1, 1),
                Pwhite(0.05, 0.1, 3),
            ], inf),
            \amp, Pseq([ 0.2, 0.02, 0.02, 0.1, 0.02, 0.02, 0.1, 0.02, 0.02, 0.02] * 0.8),
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
        );
    );		

    Pdef(\cello_rise, 
        Pbind(
            \instrument, \varirate,
            \group, ~group[\instr],
            \dur, Pseq([60], 1),
            \loop, 0,
            \legato, 1,
            \ratefrom, 0.25,
            \rateto, 1,
            \ratedur, 50,
            \buf, ~buffers[\cello][9],
            \rel, 0.01,
            \amp, 0.25,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, 1,
            \fx2, ~bus[\grdelay],
            \fx2lvl, 0.6,
        );
    );		

    Pdef(\crash, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pseq([10], 1),
            \rate, 1,
            \buf, ~buffers[\explosions][2],
            \rel, 7,
            \amp, 0.25,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp,
            \fx2, ~bus[\grdelay],
            \fx2lvl, 0.5,
        );
    );		

    Pdef(\crashes, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pseq(0.5 ! 10, 1),
            \rate, 1,
            \buf, Prand(~buffers[\explosions], inf),
            \rel, 7,
            \amp, Pseq(Array.geom(10, 0.01, 1.2), 1),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-24.dbamp, -12.dbamp),
        );
    );		

    Pdef(\aliina_laugh_end, 
        Pbind(
            \instrument, \cleangate,
            \group, ~group[\instr],
            \dur, Pseq(3 ! 5, 1),
            \rate, 1,
            \loop, 0,
            \buf, Pseq([
                ~buffers[\aliina_laugh][31], 
                ~buffers[\aliina_laugh][21], 
                ~buffers[\aliina_laugh][28], 
                ~buffers[\aliina_laugh][25], 
            ]),
            \rel, 4,
            \amp, Pseq(Array.geom(4, 0.1, 0.9), 1),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, 1.0,
        );
    );		

    Pdef(\wind_end, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pseq(10 ! 1, 1),
            \rate, 1,
            \buf, Pseq([~buffers[\nurme_wind][1]]),
            \rel, 30,
            \amp, 0.7,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, 1.0,
        );
    );		

    Pdef(\klang_end, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \dur, Pseq(10 ! 1, 1),
            \freq, 1500,
            \spread, 2.1,
            \attack, 3.0,
            \rel, 25,
            \amp, 0.003,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
        )
    );

    Pdef(\tens, 
        Psym(
            Pseq([
                Pseq([[\sine_boom, \click, \click_stove]], 1),
                Pseq([[\sine_boom, \countinquiet, \click, \click_stove, \aliina_laugh]], 3),
                Pseq([[\sine_boom, \countin, \click, \click_stove, \buf]], 4),
                Pseq([[\sine_boom, \countin, \click, \buf, \click_stove, \klang]], 4),
                Pseq([Prand([[\reso, \buf, \klang], [\reso, \aliina_laugh, \klank, \klang]])], 2), 
                Pseq([[\sine_boom, \click, \click_stove]], 1),
                Pseq([[\sine_boom, \countinquiet, \click, \click_stove, \aliina_laugh]], 3),
                Pseq([[\sine_boom, \countin, \click, \click_stove, \buf]], 4),
                Pseq([[\sine_boom, \countin, \click, \buf, \click_stove, \klang]], 4),
                Pseq([Prand([[\reso, \buf, \klang], [\reso, \aliina_laugh, \klank, \klang]])], 2), 
                Pseq([[\bufquiet, \countin, \reso, \klank, \click, \click_stove, \crashes]], 2),
                Pseq([[\sine_boom, \countinquiet, \click, \click_stove, \aliina_laugh]], 3),
                Pseq([[\sine_boom, \countin, \click, \click_stove, \buf]], 4),
                Pseq([[\countin, \click, \buf, \click_stove, \klang]], 4),
                Pseq([Prand([[\reso, \buf, \klang], [\reso, \aliina_laugh, \klank, \klang]])], 2), 
                Pseq([[\bufquiet, \countin, \reso, \klank, \click, \click_stove, \crashes]], 2),
                Pseq([[\crash, \wind_end, \klang_end]], 1),
                Pseq([\aliina_laugh_end], 1),
                Pseq([[\breaths, \sine_quiet]], inf)
            ]),
        ),
    );

    /******************** end tens ********************/
    /******************** cello ********************/

    Pdef(\cello, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(1, 10),
            \rate, Prand([0.25, 0.5, 1], inf),
            \loop, 1,
            \buf, Prand(~buffers[\cello_tiit], inf),
            \rel, Pexprand(4, 16),
            \attack, Pwhite(2, 5),
            \db, Pseq([Pseries.fromEndpoints(-35, -20, 30), Pwhite(-25, -20, inf)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -24.dbamp,
            // \fx2, ~bus[\grdelay],
            // \fx2lvl, Pwhite(-24.dbamp, -12.dbamp),
        );
    );		

    // Pdef(\cello).play;
    // Pdef(\cello).stop;
    /******************** bell_low_chord ********************/
    Pdef(\bell_low_chord, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \midinote, [24, 27, 31, 59],
            \spread, Pwhite(2.0, 2.01),
            \dur, 8, 
            \attack, Pwhite(1.3, 2.9),
            \amp, 0.5 * [rrand(-18, -15), rrand(-21, -18), rrand(-30, -25), rrand(-40, -36)].dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 1.5,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    /******************** bell ********************/
    Pdef(\bell_low, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 80,
            \spread, Pwhite(1.95, 2.05),
            \dur, Pexprand(2, 8),
            \attack, Pwhite(2.3, 3.9),
            \amp, Pwhite(-50.dbamp, -40.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 2,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
            \fx2, ~bus[\jpverb],
            \fx2lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    Pdef(\bell_hi, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \midinote, [24, 27, 31, 59] + 36,
            \spread, Pwhite(1.8, 2.7),
            \dur, 8, 
            \attack, Pwhite(1.3, 2.9),
            \amp, 0.05 * [rrand(-18, -15), rrand(-21, -18), rrand(-30, -25), rrand(-40, -36)].dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 1.5,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    Pdef(\bell,
        Psym(
            Pseq([[\bell_low_chord, \bell_hi]])
        )
    );

    /******************** wind ********************/
    Pdef(\wind, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 10),
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \rel, 16,
            \attack, 3.0,
            \amp, -26.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		

    /******************** aliina_laugh ********************/

    Pdef(\aliina_laugh_1, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(5, 20),
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\aliina_laugh], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.5,
            \amp, -40.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -3.dbamp,
        );
    );		

    /******************** fast ********************/
    Pdef(\fast_click_water, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\water], inf),
            \group, ~group[\instr],
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \amp, Pexprand(-20.dbamp, -3.dbamp),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    Pdef(\fast_click, 
        Pbind(
            \instrument, \click,
            \group, ~group[\instr],
            \spread, Pwhite(1.8, 2.7),
            \dur, Prand([0.1, 0.2, 0.3], inf),
            \db, Pseq([Pseries.fromEndpoints(-70, -3, 20), Pexprand(-20, 0)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pexprand(0.0004, 0.001),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-12.dbamp, -0.dbamp),
            \fx2, ~bus[\grdelay],
            \fx2lvl, Pwhite(-12.dbamp, -3.dbamp),
        );
    );

    // Pdef('fast').play;
    Pdef(\fast_kick,
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \midinote, 30,
            \pan, Pwhite(-1.0, 1.0, inf),
            \dur, Prand([0.2, 0.4, 0.6], inf),
            \db, Pwhite(-25, -15),
            \attack, 0.001, 
            \rel, Pwhite(0.4, 0.6),
            \out, ~bus[\master],
        )
    );

    Pdef(\fast_klang,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 75.midicps,
            \dur, Prand([0.1, 0.1, 0.2, 0.4], inf),
            \db, Pwhite(-50, -30),
            \attack, 0.0, 
            \rel, Pwhite(1.5, 2.0),
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    Pdef(\fast_klang_liftoff_cue,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 87.midicps,
            \dur, 0.15,
            \db, Pseries.fromEndpoints(-50, -25, 48),
            \attack, 0.1, 
            \rel, 0.0,
            \spread, Pwhite(1.95, 2.05, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    Pdef(\fast_intro,
        Psym(
            Pseq([[\fast_click_water, \fast_click]]),
        )
    );

    Pdef(\fast,
        Psym(
            Pseq([[\fast_click_water, \fast_click, \fast_kick]]),
        )
    );

    Pdef(\fast_next,
        Psym(
            Pseq([[\fast_klang, \fast_click_water, \fast_click, \fast_kick]]),
        )
    );

    /******************** em (electromagnetic fun) ********************/
    Pdef(\em, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\em], inf),
            ~group[\instr];
            \db, Pwhite(-30, -10),
            \dur, Pexprand(1.0, 7.0),
            \rel, Pkey(\dur),
            \attack, Pkey(\dur) * 0.3,
            \rate, Pexprand(0.25, 0.75),
            \pan, Pwhite(-1.0, 1.0), 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            // \fx2, ~bus[\grdelay], 
            // \fx2lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );

    /******************** sine_quiet ********************/
    Pdef(\sine_quiet, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \amp, Pwhite(-70.dbamp, -60.dbamp),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(1, 5),
            \fx1lvl, Pwhite(-60.dbamp, -9.dbamp),
            \out, ~bus[\master],
            \rel, Pwhite(3.0, 10.0),
        )
    );

    /******************** sine ********************/
    Pdef(\sine, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \amp, Pwhite(-70.dbamp, -40.dbamp),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(1, 5),
            \fx1lvl, Pwhite(-60.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \rel, Pwhite(3.0, 10.0),
        )
    );

    /******************** metro ********************/
    Pdef(\metro, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\metro], inf),
            ~group[\instr];
            // \amp, Pwhite(-40.dbamp, -30.dbamp),
            \db, Pwhite(-15, -9),
            \dur, Pexprand(5.0, 10.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.5,
            \ratio, 6,
            \gain, 3.dbamp,
            \thresh, -16.dbamp,
            \rate, Pexprand(0.75, 1.1),
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 100,
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb], 
            // \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );

    /******************** school_yard ********************/
    Pdef(\school_yard, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\school_yard], inf),
            ~group[\instr];
            \amp, Pexprand(-30.dbamp, -20.dbamp),
            \dur, Pexprand(2.0, 10.0),
            // \rel, Pkey(\dur) * 1.5,
            \rel, 16,
            // \attack, Pkey(\dur) * 0.5,
            \attack, 6,
            \pan, Pwhite(-1.0, 1.0), 
            \loop, 1,
            \hipassfreq, 100,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -0.dbamp),
        )
    );

    /******************** nasa ********************/
    Pdef(\nasa, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pwhite(2, 4, inf),
            \rate, Pexprand(0.9, 1.3, inf),
            \buf, Pseq([~buffers[\nasa][4], Prand(~buffers[\nasa], inf)], inf),
            \attack, Pkey(\dur) * rrand(1, 2),
            \rel, Pkey(\dur) * rrand(3, 4),
            \loop, 1,
            \hishelfdb, -12,
            // \startpos, Pwhite(0, Pkey(\buf).numFrames, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
            // \amp, Pwhite(-50.dbamp, -20.dbamp, inf),
            \db, Pseq([Pseries.fromEndpoints(-60, -20, 15), Pwhite(-30, -15, inf)]),
            \ratio, 2,    
            \thresh, -12.dbamp,
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, 1, 
            \out, ~bus[\master],
        )
    );

    // Pdef(\nasa).play;
    // Pdef(\nasa).stop;

    Pdef(\nasa_liftoff, 
        Pbind(
            \instrument, Pseq([\clean, \clean_circle_pan, \clean_circle_pan, \clean, \clean, \clean]), 
            \group, ~group[\instr],
            \dur, Pseq([30, 10, 10, 20, 20, 20]),
            \buf, Pseq([
                ~buffers[\nasa][0], 
                ~buffers[\nasa][4], 
                ~buffers[\nasa][4], 
                ~buffers[\nasa][6], 
                ~buffers[\nasa][6], 
                ~buffers[\nasa][6]
            ]),
            \rel, Pseq([120, 80, 80, 90, 90, 90]),
            \loop, Pseq([0, 0, 0, 1, 1, 1]),
            \rate, Pseq([1, 1, 1, 0.5, 0.5, 0.5]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \panspeed, 0.03,
            \width, ~numSpeakers,
            \db, Pseq([-15, -6, -6, -12, -12, -12, -12]),
            \hipassfreq, Pseq([350, 120, 120, 200, 200, 200]),
            \attack, Pseq([20, 10, 10, 10, 10, 10]),
            \ratio, 2,    
            \thresh, -12.dbamp,
            \out, ~bus[\master],
        )
    );

    // Pdef(\nasa_liftoff).play;
    // Pdef(\nasa_liftoff).stop;
    // /******************** rain ********************/
    Pdef(\rain, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(3, 10),
            \rate, Pexprand(0.9, 1.2),
            \loop, 1,
            \buf, Prand(~buffers[\rain], inf),
            \rel, 60,
            \attack, 20.0,
            \hipassfreq, 120,
            \amp, -9.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, -12.dbamp,
        );
    );		

    /******************** bubbles ********************/
    Pdef(\bubbles, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 5),
            \rate, 0.20,
            \loop, 1,
            \buf, Prand(~buffers[\bubbles], inf),
            \rel, 16,
            \attack, 5.0,
            \hipassfreq, 120,
            \amp, -3.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp,
        );
    );		

    /******************** breaths ********************/
    Pdef(\breaths, 
        Pbind(
            \instrument, \clean_circle_pan,
            \group, ~group[\instr],
            \dur, Pexprand(10, 30),
            \loop, 1,
            \buf, ~buffers[\breaths][0],
            \rel, 16,
            \attack, 5.0,
            \hipassfreq, 120,
            \db, Pwhite(-25, -20),
            \panspeed, 0.01,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -9.dbamp,
        );
    );		

    // Pdef(\breaths).play;
    // Pdef(\breaths).stop;

    Pdef(\crashes_1, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 0.5, 
            \rate, 1,
            \buf, Prand(~buffers[\explosions], inf),
            \rel, 7,
            // \amp, Pseq(Array.geom(10, 0.01, 1.2), 1),
            \db, Pwhite(-40, -30),
            \hipassfreq, 200,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, 0.8,
        );
    );		

)


// ~close_mic1.value();
// x.stop;
// Pdef(\crashes_1).play;
// Pdef(\crashes_1).stop;

// Pdef(\rain).play;
// Pdef(\rain).stop;

// Pdef(\breaths).play;
// Pdef(\breaths).stop;

// Pdef(\bubbles).play;
// Pdef(\bubbles).stop;

// Pdef(\nasa).play
// Pdef(\nasa).stop

// Pdef(\metro).play;
// Pdef(\metro).stop;

// Pdef(\school_yard).play;
// Pdef(\school_yard).stop;

// Pdef(\fast_kick).play;
// Pdef(\fast_kick).stop;

// Pdef(\sine).play;
// Pdef(\sine).stop;

// Pdef(\wind).play;
// Pdef(\wind).stop;

// Pdef(\em).play;
// Pdef(\em).stop;

// Pdef(\fast_click).play;
// Pdef(\fast_click).stop;

// Pdef(\fast).play;
// Pdef(\fast).stop;

// Pdef(\cello).play;
// Pdef(\cello).stop;

// Pdef(\bell).play;
// Pdef(\bell).stop;

// Pdef(\fast_click_water).play;
// Pdef(\fast_click_water).stop;
// (
//     Pdef(\em).play;
//     Pdef(\fast_click).play;
//     Pdef(\cello).play;
//     Pdef(\fast_kick).play;
// )
// (
//     Pdef(\em).stop;
//     Pdef(\fast_click).stop;
//     Pdef(\cello).stop;
//     Pdef(\fast_kick).stop;
// )
// (
//     x = fork{
//         Pdef(\fast).play;
//         Pdef(\em).play;
//         30.wait;
//         Pdef(\fast).stop;
//         Pdef(\em).stop;
//         240.wait;
//         Pdef(\rain).play;
//         120.wait;
//         Pdef(\bubbles).play;
//         30.wait;
//         Pdef(\breaths).play;
//         10.wait;
//         Pdef(\rain).stop;
//         120.wait;
//         Pdef(\bubbles).stop;
//         60.wait;
//         Pdef(\breaths).stop;
//     }
// )

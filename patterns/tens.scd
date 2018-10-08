(
    var phrases = ();

    phrases.put(\sine_quiet, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, 1200,
            \db, -60,
            \dur, 60,
            \rel, Pkey(\dur),
            \pan, Pwhite(-1.0, 1.0, 1),
            \attack, 5,
            \amfreq, 0.05,
            \amdepth, 0.0,
            \fx1lvl, -12.dbamp,
            \out, ~bus[\master],
        )
    );

    phrases.put(\buf, 
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
            \buf, Prand(~buffers[\brpiano]++~buffers[\cello]++~buffers[\rubberball], inf),
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

    phrases.put(\bufquiet, 
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
            \buf, Prand(~buffers[\brpiano]++~buffers[\cello], inf),
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

    phrases.put(\klank, 
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

    phrases.put(\klang, 
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

    phrases.put(\sine_boom, 
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

    phrases.put(\reso_boom, 
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

    phrases.put(\reso, 
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

    phrases.put(\resoquiet, 
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

    phrases.put(\countin,
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

    phrases.put(\countinquiet,
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

    phrases.put(\aliina_laugh, 
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

    phrases.put(\click_stove, 
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

    phrases.put(\click, 
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

    phrases.put(\click_stovequiet, 
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
            \amp, Pseq([ 0.2, 0.02, 0.02, 0.1, 0.02, 0.02, 0.1, 0.02, 0.02, 0.02] * 0.2),
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
        );
    );		

    phrases.put(\clickquiet, 
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
            \amp, Pseq([ 0.2, 0.02, 0.02, 0.1, 0.02, 0.02, 0.1, 0.02, 0.02, 0.02] * 0.2),
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\tens],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-70.dbamp, -30.dbamp, inf),
        );
    );		

    phrases.put(\cello_rise, 
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

    phrases.put(\crash, 
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

    phrases.put(\crashes, 
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

    phrases.put(\aliina_laugh_end, 
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

    phrases.put(\wind_end, 
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

    phrases.put(\klang_end, 
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
                Pseq([\cello_rise], 1),
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
                Pseq([[\breaths, \sine_quiet]], 1)
            ]), phrases
        ),
    );

    Pdef(\tensBirthday,
        Psym(
            Pseq([
                Pseq([[\clickquiet, \click_stovequiet]], 2), 
                Pseq([[\click, \click_stove]], 2), 
                // Pseq([[\sine_boom, \countinquiet, \click, \click_stove, \aliina_laugh]], 2),
                Pseq([[\sine_boom, \click, \click_stove]], 2), 
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
            ]), phrases
        ),
    );
)

// Pdef(\tens).play(TempoClock(2.0));
// Pdef(\tens).stop;

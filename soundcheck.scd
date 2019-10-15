(
    //speakertest
    fork{ var dur = 1;
        4.wait;
        ~numSpeakers.do{|i, idx| 
            {Out.ar(idx, SinOsc.ar(880) * XLine.kr(0.1, 0.00001, dur, doneAction: 2))}.play;
            dur.wait
        };
        // test subs, sum of speaker outputs.
        {Out.ar(~numSpeakers, SinOsc.ar(88) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;
        dur.wait;
        {Out.ar(~numSpeakers + 1, SinOsc.ar(88) * XLine.kr(0.3, 0.00001, 4, doneAction: 2))}.play;
    };
)

(
    //audience enter mics
    ~ch[\mic2].set(\lvlout, -3.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
    ~ch[\mic3].set( \lvlout, -3.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
)
(
    var miclevel = -7.dbamp;

    "darkness".postln;

    ~ch[\mic0].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //külli
    ~ch[\mic1].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //rakesh
    ~ch[\mic2].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //kenneth
    ~ch[\mic3].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //isabell
)
(
    var level = -3.dbamp;
    //soundcheck mics
    //kulli, yellow
    ~ch[\mic0].set(
        \lvlout, level, 
        \gate, 1, 
        \fx1lvl, 0, 
        \fx2lvl, 0, 
        \fx3lvl, 0, 
        \locut, 150, 
        \hishelffreq, 8000, 
        \hishelfdb, 3, 
        \width, ~numSpeakers
    );
    // rakesh, blue
    ~ch[\mic1].set(
        \lvlout, level, 
        \gate, 1, 
        \fx1lvl, 0, 
        \fx2lvl, 0, 
        \fx3lvl, 0, 
        \locut, 150, 
        \hishelffreq, 8000, 
        \hishelfdb, 3, 
        \width, ~numSpeakers
    ); 
    // kenneth, none
    ~ch[\mic2].set(
        \lvlout, level, 
        \gate, 1, 
        \fx1lvl, 0, 
        \fx2lvl, 0, 
        \fx3lvl, 0, 
        \locut, 150, 
        \hishelffreq, 8000, 
        \hishelfdb, 3, 
        \width, ~numSpeakers
    );
    // isabell, white
    ~ch[\mic3].set(
        \lvlout, level, 
        \gate, 1, 
        \fx1lvl, 0, 
        \fx2lvl, 0, 
        \fx3lvl, 0, 
        \locut, 150, 
        \hishelffreq, 8000, 
        \hishelfdb, 3, 
        \width, ~numSpeakers
    ); //isabell, white
)
(
    ~ch[\mic0].set(\gate, 0);
    ~ch[\mic1].set(\gate, 0);
    ~ch[\mic2].set(\gate, 0);
    ~ch[\mic3].set(\gate, 0);
)
Pdef(\tens).play(TempoClock(2.0));
Pdef(\tens).stop;
~ch[\tens].set( \compgain, 12.dbamp, \ratio, 2, \limit, 0.1.dbamp, \locut, 50);

(

    fork{
        Pdef(\nasa_liftoff).play;
        40.wait;
        Pdef(\fmdrone).play;
    }

)
(
    Pdef(\nasa_liftoff).stop;
    Pdef(\fmdrone).stop
)
Pdef(\emSolo).play;
Pdef(\emSolo).stop;
~ch[\grdelayLong].set(\fb, 0.6);
~ch[\mic2].set(\gate, 1, \lvlout, -6.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp, \hishelffreq, 500, \hishelfdb, -3);

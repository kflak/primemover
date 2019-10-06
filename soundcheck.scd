(
    //speakertest
    fork{ var dur = 1;
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
    ~ch[\mic2].set(\lvlin, -0.dbamp, \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
    ~ch[\mic3].set(\lvlin, -0.dbamp, \lvlout, 0.dbamp, \gate, 1, \fx1lvl, -20.dbamp, \fx2lvl, -20.dbamp, \fx3lvl, -5.dbamp, \width, ~numSpeakers);
)
(
    //soundcheck mics
    //kulli, yellow
    ~ch[\mic0].set(
        \lvlin, -6.dbamp, 
        \lvlout, 3.dbamp, 
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
        \lvlin, -9.dbamp, 
        \lvlout, 3.dbamp, 
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
        \lvlin, -9.dbamp, 
        \lvlout, 3.dbamp, 
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
        \lvlin, -9.dbamp, 
        \lvlout, 3.dbamp, 
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

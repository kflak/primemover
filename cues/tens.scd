(
    {
        ~tenscue = Routine{

            Pdef(\tens).play(TempoClock(2.0)).quant_(0);

            20.wait;

            //switch off mics
            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);

            130.wait;

            ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\tens], target: ~group[\mix])};


            Pdef(\emLow).play; //DUET

            60.wait;

            //QUARTET
            // "Rakesh solo".postln;
            // ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};

            60.wait;

            //kill Külli's sensors
            ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};

            //QUARTET
            // 60.wait;

            "Kenneth starts singing".postln;

            ~ch[\grdelayLong].set(\fb, 0.6);
            ~ch[\mic0].set( \gate, 1, \lvlout, -6.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp);

            //DUET
            60.wait;
            Pdef(\emLow).stop;
            //QUARTET
            // 120.wait;
            // ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].release(1)};

        }.play;
    }
)

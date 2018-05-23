(
    {
        //switch off mics
        ~ch[\mic0].set(\gate, 0);
        ~ch[\mic1].set(\gate, 0);

        ~tenscue = Routine{
            Pdef(\tens).play(TempoClock(2.0));

            150.wait;

            ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\tens], target: ~group[\mix])};

            60.wait;

            "Rakesh solo".postln;
            ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};

            60.wait;

            //kill Külli sensors
            ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};

            60.wait;

            "Kenneth starts singing".postln;

            ~ch[\mic0].set( \gate, 1, \lvlout, -6.dbamp, \fx3lvl, 0.dbamp, \fx2lvl, -10.dbamp, \fx1lvl, -20.dbamp);

            // 120.wait;

            // ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].release(1)};

        }.play;
    }
)

// (
//     Pdef(\tens).stop;
//     ~tenscue.stop
// )

// (
//     "Kenneth stops singing, Crunchy impro starts".postln;
    //mic off
    // ~ch[\mic0].set(\gate, 0);

    //movement sensors on
    // ~deltaTriggers[\bubblesIDs].do{|id, idx| ~deltaTriggers[\bubbles][idx].play(out: ~bus[\master], target: ~group[\mix])};
    // ~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\master], target: ~group[\mix])};
    // ~deltaTriggers[\chipsIDs].do{|id, idx| ~deltaTriggers[\chips][idx].play(out: ~bus[\master], target: ~group[\mix])};
    // [10, 11].do{|id, idx| ~deltaTriggers[\chew][idx].play( out: ~bus[\master], maxAmp: -6.dbamp, threshold: 0.1, target: ~group[\mix]) };
    // [10, 11].do{|id, idx| ~deltaTriggers[\bubbles][idx].play( out: ~bus[\master], maxAmp: -3.dbamp, threshold: 0.2, target: ~group[\mix]) };
    // [10, 11].do{|id, idx| ~deltaTriggers[\chips][idx].play( out: ~bus[\master], maxAmp: -3.dbamp, threshold: 0.1, target: ~group[\mix]) };
// )

// (
    // ~deltaTriggers[\bubblesIDs].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)};
    // ~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)};
    // ~deltaTriggers[\chipsIDs].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)};
// )

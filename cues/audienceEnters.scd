(
    fork{     
        Pdef(\sineGrainTrainEnv).play;
        Pdef(\aliinaCryBeginning).play;
        // ~of.sendMsg("/text", "true");
        ~deltaTriggers[\sineGrainIDs].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play( out: ~bus[\master], target: ~group[\mix] )};
        ~mbCC[\wind].value();
        ~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].play(out: ~bus[\master], target: ~group[\mix])};
        ~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].threshold = 0.1};
        ~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].maxAmp = -18.dbamp};

        ~deltaTriggers[\ryuishIDs].do{|id, idx| ~deltaTriggers[\ryuish][idx].play( out: ~bus[\master], target: ~group[\mix] )};
        ~deltaTriggers[\ryuishIDs].do{|id, idx| ~deltaTriggers[\ryuish][idx].maxAmp = -18.dbamp};
        360.wait;
        Pdef(\school_yard_fadein).play;
        ~mbCC[\windIDs].do{|id, idx| ~mbCC[\windCC][idx].stop; ~mbCC[\windSynth][idx].release};
        30.wait;
        ~deltaTriggers[\sineGrainIDs].do{|id, idx| ~deltaTriggers[\sineGrain][idx].release(1)};
        ~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].release(1)};
        ~deltaTriggers[\ryuishIDs].do{|id, idx| ~deltaTriggers[\ryuish][idx].release(1)};
        Pdef(\fast_intro).play;
        Pdef(\sineGrainTrainEnv).stop;
        Pdef(\aliinaCryBeginning).stop;
    }
)


// Pdef(\fast_intro).stop;
// Pdef(\school_yard).stop;
// Pdef(\school_yard_fadein).stop;

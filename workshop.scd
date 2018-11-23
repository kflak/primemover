
~deltaTriggers[\sineGrainIDs].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play( out: ~bus[\master], target: ~group[\mix] )};
[10].do{|id, idx| ~deltaTriggers[\sineGrain][idx].release(1)};

~deltaTriggers[\ryuishIDs] = [11];
~deltaTriggers[\ryuish].do{|id, idx| ~deltaTriggers[\ryuish][idx].play( out: ~bus[\master], target: ~group[\mix] )};
~deltaTriggers[\ryuish].do{|id, idx| ~deltaTriggers[\ryuish][idx].release(1)};

~deltaTriggers[\rec].do{|id, idx| ~deltaTriggers[\rec][idx].play( out: ~bus[\master], target: ~group[\mix] )};
~deltaTriggers[\rec].do{|id, idx| ~deltaTriggers[\rec][idx].release(1)};

[12].do{|id, idx| ~deltaTriggers[\combdust][idx].play( out: ~bus[\master], target: ~group[\mix] )};
[12].do{|id, idx| ~deltaTriggers[\combdust][idx].release(1)};

[13].do{|id, idx| ~deltaTriggers[\dust][idx].play( out: ~bus[\master], target: ~group[\mix])}; 
[13].do{|id, idx| ~deltaTriggers[\dust][idx].release(1)};

[14].do{|id, idx| ~deltaTriggers[\aliina][idx].play(out: ~bus[\master], target: ~group[\mix])};
[14].do{|id, idx| ~deltaTriggers[\aliina][idx].release(1)};

[13].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\master], target: ~group[\mix])};
[13].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};

[14].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].play(out: ~bus[\master], target: ~group[\mix])};
[14].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].release(1)};

[10].do{|id, idx| ~deltaTriggers[\birdie][idx].play(out: ~bus[\master], target: ~group[\mix])};
[10].do{|id, idx| ~deltaTriggers[\birdie][idx].release(1)};

[11].do{|id, idx| ~deltaTriggers[\boiling][idx].play(out: ~bus[\master], target: ~group[\mix])};
[11].do{|id, idx| ~deltaTriggers[\boiling][idx].release(1)};

[12].do{|id, idx| ~deltaTriggers[\bubbles][idx].play(out: ~bus[\master], target: ~group[\mix])};
[12].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)};

[13].do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\master], target: ~group[\mix])};
[13].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)};

[14].do{|id, idx| ~deltaTriggers[\chips][idx].play(out: ~bus[\master], target: ~group[\mix])};
[14].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)};

[10].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};
[10].do{|id, idx| ~deltaTriggers[\em][idx].release(1)};

[11].do{|id, idx| ~deltaTriggers[\home][idx].play(out: ~bus[\master], target: ~group[\mix])};
[11].do{|id, idx| ~deltaTriggers[\home][idx].release(1)};

[12].do{|id, idx| ~deltaTriggers[\klang][idx].play(out: ~bus[\master], target: ~group[\mix])};
[12].do{|id, idx| ~deltaTriggers[\klang][idx].release(1)};

[13].do{|id, idx| ~deltaTriggers[\klank][idx].play(out: ~bus[\master], target: ~group[\mix])};
[13].do{|id, idx| ~deltaTriggers[\klank][idx].release(1)};

[14].do{|id, idx| ~deltaTriggers[\metro][idx].play(out: ~bus[\master], target: ~group[\mix])};
[14].do{|id, idx| ~deltaTriggers[\metro][idx].release(1)};

[10].do{|id, idx| ~deltaTriggers[\nasa][idx].play(out: ~bus[\master], target: ~group[\mix])};
[10].do{|id, idx| ~deltaTriggers[\nasa][idx].release(1)};

[11].do{|id, idx| ~deltaTriggers[\samp][idx].play(out: ~bus[\master], target: ~group[\mix])};
[11].do{|id, idx| ~deltaTriggers[\samp][idx].release(1)};

[12].do{|id, idx| ~deltaTriggers[\sine][idx].play(out: ~bus[\master], target: ~group[\mix])};
[12].do{|id, idx| ~deltaTriggers[\sine][idx].release(1)};

[13].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix])};
[13].do{|id, idx| ~deltaTriggers[\water][idx].release(1)};

[14].do{|id, idx| ~deltaTriggers[\wind][idx].play(out: ~bus[\master], target: ~group[\mix])};
[14].do{|id, idx| ~deltaTriggers[\wind][idx].release(1)};

~deltaTriggers[\sineGrainIDs].do{|id, idx| ~deltaTriggers[\sineGrain][idx].play( out: ~bus[\master], target: ~group[\mix] )};
~deltaTriggers[\sineGrainIDs].do{|id, idx| ~deltaTriggers[\sineGrain][idx].release(1)};

~deltaTriggers[\ryuishIDs].do{|id, idx| ~deltaTriggers[\ryuish][idx].play( out: ~bus[\master], target: ~group[\mix] )};
~deltaTriggers[\ryuishIDs].do{|id, idx| ~deltaTriggers[\ryuish][idx].release(1)};

~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].play( out: ~bus[\master], target: ~group[\mix] )};
~deltaTriggers[\combdustIDs].do{|id, idx| ~deltaTriggers[\combdust][idx].release(1)};

~deltaTriggers[\dustIDs].do{|id, idx| ~deltaTriggers[\dust][idx].play( out: ~bus[\master], target: ~group[\mix])}; 
~deltaTriggers[\dustIDs].do{|id, idx| ~deltaTriggers[\dust][idx].release(1)};

~deltaTriggers[\aliinaIDs].do{|id, idx| ~deltaTriggers[\aliina][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\aliinaIDs].do{|id, idx| ~deltaTriggers[\aliina][idx].release(1)};

~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};

~deltaTriggers[\aliina_cryIDs].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\aliina_cryIDs].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].release(1)};

~deltaTriggers[\birdieIDs].do{|id, idx| ~deltaTriggers[\birdie][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\birdieIDs].do{|id, idx| ~deltaTriggers[\birdie][idx].release(1)};

~deltaTriggers[\boilingIDs].do{|id, idx| ~deltaTriggers[\boiling][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\boilingIDs].do{|id, idx| ~deltaTriggers[\boiling][idx].release(1)};

~deltaTriggers[\bubblesIDs].do{|id, idx| ~deltaTriggers[\bubbles][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\bubblesIDs].do{|id, idx| ~deltaTriggers[\bubbles][idx].release(1)};

~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)};

~deltaTriggers[\chipsIDs].do{|id, idx| ~deltaTriggers[\chips][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\chipsIDs].do{|id, idx| ~deltaTriggers[\chips][idx].release(1)};

~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].release(1)};

~deltaTriggers[\homeIDs].do{|id, idx| ~deltaTriggers[\home][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\homeIDs].do{|id, idx| ~deltaTriggers[\home][idx].release(1)};

~deltaTriggers[\klangIDs].do{|id, idx| ~deltaTriggers[\klang][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\klangIDs].do{|id, idx| ~deltaTriggers[\klang][idx].release(1)};

~deltaTriggers[\klankIDs].do{|id, idx| ~deltaTriggers[\klank][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\klankIDs].do{|id, idx| ~deltaTriggers[\klank][idx].release(1)};

~deltaTriggers[\metroIDs].do{|id, idx| ~deltaTriggers[\metro][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\metroIDs].do{|id, idx| ~deltaTriggers[\metro][idx].release(1)};

~deltaTriggers[\nasaIDs].do{|id, idx| ~deltaTriggers[\nasa][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\nasaIDs].do{|id, idx| ~deltaTriggers[\nasa][idx].release(1)};

~deltaTriggers[\rec_mb_playbackIDs].do{|id, idx| ~deltaTriggers[\rec_mb_playback][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\rec_mb_playbackIDs].do{|id, idx| ~deltaTriggers[\rec_mb_playback][idx].release(1)};

~deltaTriggers[\sampIDs].do{|id, idx| ~deltaTriggers[\samp][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\sampIDs].do{|id, idx| ~deltaTriggers[\samp][idx].release(1)};

~deltaTriggers[\sineIDs].do{|id, idx| ~deltaTriggers[\sine][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\sineIDs].do{|id, idx| ~deltaTriggers[\sine][idx].release(1)};

~deltaTriggers[\waterIDs].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\waterIDs].do{|id, idx| ~deltaTriggers[\water][idx].release(1)};

~deltaTriggers[\windIDs].do{|id, idx| ~deltaTriggers[\wind][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\windIDs].do{|id, idx| ~deltaTriggers[\wind][idx].release(1)};

(
~deltaTriggers[\sineGrain][~mbIDs.indexOf(10)].play( out: ~bus[\master], target: ~group[\mix] );
~deltaTriggers[\ryuish][~mbIDs.indexOf(11)].play( out: ~bus[\master], target: ~group[\mix] );
~deltaTriggers[\combdust][~mbIDs.indexOf(12)].play( out: ~bus[\master], target: ~group[\mix] );
~deltaTriggers[\dust][~mbIDs.indexOf(13)].play( out: ~bus[\master], target: ~group[\mix]); 
~deltaTriggers[\aliinaLaugh][~mbIDs.indexOf(14)].play(out: ~bus[\master], target: ~group[\mix]);
)
(
~deltaTriggers[\sineGrain][~mbIDs.indexOf(10)].release(1);
~deltaTriggers[\ryuish][~mbIDs.indexOf(11)].release(1);
~deltaTriggers[\combdust][~mbIDs.indexOf(12)].release(1);
~deltaTriggers[\dust][~mbIDs.indexOf(13)].release(1);
~deltaTriggers[\aliinaLaugh][~mbIDs.indexOf(14)].release(1);
)
(
~deltaTriggers[\aliina][~mbIDs.indexOf(10)].play(out: ~bus[\master], target: ~group[\mix]);
~deltaTriggers[\bubbles][~mbIDs.indexOf(11)].play(out: ~bus[\master], target: ~group[\mix]);
~deltaTriggers[\chips][~mbIDs.indexOf(12)].play(out: ~bus[\master], target: ~group[\mix]);
~deltaTriggers[\birdie][~mbIDs.indexOf(13)].play(out: ~bus[\master], target: ~group[\mix]);
~deltaTriggers[\boiling][~mbIDs.indexOf(14)].play(out: ~bus[\master], target: ~group[\mix]);
)
(
~deltaTriggers[\aliina][~mbIDs.indexOf(10)].release(1);
~deltaTriggers[\bubbles][~mbIDs.indexOf(11)].release(1);
~deltaTriggers[\chips][~mbIDs.indexOf(12)].release(1);
~deltaTriggers[\birdie][~mbIDs.indexOf(13)].release(1);
~deltaTriggers[\boiling][~mbIDs.indexOf(14)].release(1);
)

~deltaTriggers[\aliina_cryIDs].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\aliina_cryIDs].do{|id, idx| ~deltaTriggers[\aliina_cry][idx].release(1)};

~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\master], target: ~group[\mix])};
~deltaTriggers[\chewIDs].do{|id, idx| ~deltaTriggers[\chew][idx].release(1)};

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

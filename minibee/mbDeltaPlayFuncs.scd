~deltaTriggers[\combdust].play( out: ~bus[\master], target: ~group[\mix] );
~deltaTriggers[\combdust].release(10);

~deltaTriggers[\dust].play( out: ~bus[\master], target: ~group[\mix]); 
~deltaTriggers[\dust].release(10);

//multiple MBs at once
~mbIDs.do{|id, idx| ~deltaTriggers[\aliina][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\aliina][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\aliina_cry][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\aliina_cry][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\birdie][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\birdie][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\boiling][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\boiling][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\bubbles][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\bubbles][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\chew][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\chew][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\chips][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\chips][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\em][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\home][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\home][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\klang_klank][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\klang_klank][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\metro][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\metro][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\nasa][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\nasa][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\rec_mb_playback][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\rec_mb_playback][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\samp][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\samp][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\sine][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\sine][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\water][idx].release(40)};

~mbIDs.do{|id, idx| ~deltaTriggers[\wind][idx].play(out: ~bus[\master], target: ~group[\mix])};
~mbIDs.do{|id, idx| ~deltaTriggers[\wind][idx].release(40)};

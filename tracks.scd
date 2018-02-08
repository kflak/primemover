(
    //  [track, initial_amplitude, synth, outbus, target_group]
    ~tr = [	
        [\tens, 1.0, \chstrip_multi, \master, \mix], 
        [\jpverb, 1.0, \jpverb,	\master, \fx], 
        [\grdelay, 1.0, \grdelay, \master, \fx], 
        [\master, 1.0, \chstrip_multi, 0, \master], 
    ];

    //create audio bus dictionary
    ~bus = Dictionary();

    //set up fx channels and channelstrips
    ~ch = Dictionary();

    ~tr.do{|item|
        item.postln;	
        //create input audio bus for each track
        ~bus.put(item[0], Bus.audio(s, 2));
        //create channel synths...
        ~ch.put(
            item[0], 
            Synth(
                item[2], 
                [ 
                    \in, ~bus[item[0]], 
                    \out, ~bus[item[3]], 
                    \amp, item[1],
                ], 
                target: ~group[item[4]]
            )
        );
    };

    //set additional synth args
    ~ch[\tens].set(\compgain, 2.dbamp, \ratio, 2, \limit, 0.dbamp, \locut, 50);
    ~ch[\grdelay].set( \lo_cut, 40, \density, 20, \grain_size, 0.001, \grain_size_rand, 0.3, \min_delay, 0.3, \max_delay, 1.5, \fb, 0.05, \mod_freq, 0.05, \mod_depth, 0.1);

)

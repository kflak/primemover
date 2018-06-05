(
    //  [track, initial_amplitude, synth, outbus, target_group]
    ~tr = [	
        [\fast, 1.0, \chstrip_multi, \master, \mix], 
        [\tens, 1.0, \chstrip_multi, \master, \mix], 
        [\crunchy, 1.0, \chstrip_multi, \master, \mix], 
        [\heartbeat, 1.0, \chstrip_multi, \master, \mix], 
        [\sineGrain, 1.0, \chstrip_multi, \master, \mix], 
        [\jpverb, 1.0, \jpverb,	\master, \fx], 
        [\grdelay, 1.0, \grdelay, \master, \fx], 
        [\grdelayMedium, -6.dbamp, \grdelay, \master, \fx], 
        [\grdelayLong, -6.dbamp, \grdelay, \master, \fx], 
        [\master, 1.0, \chstrip_multi, 0, \master], 
        [\sub, 1.0, \mixToMono, ~subOut, \sub],
    ];

    ~mic = [
        // lvlin, lvlout, outbus 
        [-6.dbamp, 0.dbamp, \master],
        [-6.dbamp, 0.dbamp, \master],
    ];

    //create audio bus dictionary
    ~bus = IdentityDictionary();

    //set up fx channels and channelstrips
    ~ch = IdentityDictionary();

    //instrument and mixer tracks
    ~tr.do{|item|
        item.postln;	
        //create input audio bus for each track
        ~bus.put(item[0], Bus.audio(s, ~numSpeakers));
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

    //microphones
    ~mic.do{|item, idx|
        postf("mic% %\n", idx, item);
        //create channel synths...
        ~ch.put(
            (\mic++idx).asSymbol,
            Synth(
                \soundin, 
                [ 
                    \in, idx,
                    \lvlin, item[0],
                    \lvlout, item[1],
                    \out, item[2],
                    \fx1, ~bus[\jpverb],
                    \fx1lvl, 0,
                    \fx2, ~bus[\grdelayMedium],
                    \fx2lvl, 0,
                    \fx3, ~bus[\grdelayLong],
                    \fx3lvl, 0,
                    \gate, 0,
                    \da, 0,
                ], 
                target: ~group[\in]
            )
        );
    };

    //set additional synth args
    ~ch[\tens].set(
        \compgain, 2.dbamp, 
        \ratio, 2, 
        \limit, 0.dbamp, 
        \locut, 50
    );
    ~ch[\fast].set(
        \compgain, 12.dbamp, 
        \ratio, 8, 
        \thresh, -10.dbamp, 
        \limit, 0.dbamp, 
        \locut, 50
    );
    ~ch[\crunchy].set( \compgain, 7.dbamp, \ratio, 8, \thresh, -5.dbamp, \limit, 0.dbamp, \locut, 100);
    ~ch[\heartbeat].set(
        \gate, 1,
        \attack, 60
    );
    ~ch[\sineGrain].set(
        \compgain, 0.dbamp, 
        \ratio, 4, 
        \limit, 0.dbamp, 
        \thresh, -12.dbamp, 
        \locut, 80
    );
    ~ch[\grdelay].set(
        \lo_cut, 40, 
        \density, 20, 
        \grain_size, 0.001, 
        \grain_size_rand, 0.3, 
        \min_delay, 0.3, 
        \max_delay, 1.5, 
        \fb, 0.05, 
        \mod_freq, 0.05, 
        \mod_depth, 0.1
    );
    ~ch[\grdelayMedium].set(
        \lo_cut, 40, 
        \density, 10, 
        \grain_size, 1.0, 
        \grain_size_rand, 0.3, 
        \min_delay, 1.0, 
        \max_delay, 4.0, 
        \fb, 0.3, 
        \mod_freq, 0.05, 
        \mod_depth, 0.1
    );
    ~ch[\grdelayLong].set(
        \lo_cut, 40, 
        \density, 10, 
        \grain_size, 1.0, 
        \grain_size_rand, 0.3, 
        \min_delay, 1.0, 
        \max_delay, 4.0, 
        \fb, 0.5, 
        \mod_freq, 0.05, 
        \mod_depth, 0.1
    );
    ~ch[\master].set(
        \compgain, 3.dbamp, 
        \ratio, 2, 
        \limit, -0.3.dbamp, 
        \thresh, -3.dbamp, 
        \locut, 40,
        \fx1, ~bus[\sub],
        \fx1lvl, 0,
    );
    ~ch[\sub].set(
        \in, ~bus[\sub],
        \hicut, 100,
    );
)

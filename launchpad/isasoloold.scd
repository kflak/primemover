(
    var notes = [0, 2, 3, 5, 7, 9, 10, 12];
    var activePads = 128;
    var srcID = MIDIClient.sources.indexOf("Launchpad");
    srcID.postln;

    ~lpsynth = nil ! 127;

    //clear launchpad
    ~launchpadOut.control(176, 0, 0);

    //set all active pads
    activePads.do{|i|
        if((i%16) < 8) {
            case
            {i < 8} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
            {i < 24} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
            {i < 40} {~launchpadOut.noteOn(0, i, ~launchpadColor[\redlo])}
            {i < 56} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
            {i < 72} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
            {i < 88} {~launchpadOut.noteOn(0, i, ~launchpadColor[\redlo])}
            {i < 104} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
            {i < 120} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
        };
    };

    ////top row, bass
    //MIDIdef.noteOn(\launchpadBass, {
    //    arg val, note, channel, src;
    //    var n = notes[note];
    //    var freq = (n + 30).midicps;
    //    var attack = 2, rel = 5;
    //    ~lpsynth[note] = Synth(\fmGate,
    //        [
    //            \carfreq, freq,
    //            \modfreq, freq ,
    //            \pan, rrand(0.0, 1.0),
    //            \moddepth, 400,
    //            \out, ~bus[\master],
    //            \attack, attack,
    //            \rel, rel,
    //            \modattack, attack * 2,
    //            \modrelease, rel,
    //            \amp, -30.dbamp,
    //            \amfreq, n + 1,
    //            \amdepth, 2,
    //            \fx1, ~bus[\grdelayMedium],
    //            \fx1lvl, -12.dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberhi])       
    //    );
    //}, noteNum: (0..7), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadBass, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])
    //}, noteNum: (0..7), chan: 0, srcID: srcID);

    ////second row, fm
    //MIDIdef.noteOn(\launchpadFM, {
    //    arg val, note, channel, src;
    //    var offset = 54;
    //    var n = notes[note - 16] + offset;
    //    var freq = n.midicps;
    //    var attack = 5, rel = 0.5;
    //    ~lpsynth[note] = Synth(\fmGate,
    //        [
    //            \carfreq, freq,
    //            \modfreq, freq * rrand(0.9, 1.4),
    //            \pan, rrand(0.0, 1.0),
    //            \moddepth, 900,
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \modattack, attack,
    //            \modrelease, rel,
    //            \amp, -35.dbamp,
    //            \amfreq, 120,
    //            \amdepth, 8,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -12.dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenhi])
    //    );
    //}, noteNum: (16..23), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadFM, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])
    //}, noteNum: (16..23), chan: 0, srcID: srcID);

    ////third row, fm grains
    //MIDIdef.noteOn(\launchpadFMGrains, {
    //    arg val, note, channel, src;
    //    var offset = 54;
    //    var n = notes[note - 32] + offset;
    //    var freq = note.explin(31, 40, 100, 2000);
    //    var attack = 0.1, rel = 1;
    //    ~lpsynth[note] = Synth(\fmgrainDustGate,
    //        [
    //            \carfreq, freq,
    //            \modfreq, freq * rrand(0.5, 1.4),
    //            \density, n, 
    //            \grainsize, exprand(0.0005, 0.1),
    //            \pan, rrand(0.0, 1.0),
    //            \moddepth, 900,
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -32.dbamp,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -24.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, -12.dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\redhi])       
    //    );
    //}, noteNum: (32..39), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadFMGrains, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\redlo])
    //}, noteNum: (32..39), chan: 0, srcID: srcID);

    ////fourth row, sine grains
    //MIDIdef.noteOn(\launchpadSineGrains, {
    //    arg val, note, channel, src;
    //    var offset = 54;
    //    var n = notes[note - 48] + offset;
    //    var freq = note.explin(48, 56, 800, 2000);
    //    var attack = 0.1, rel = 0.1;
    //    ~lpsynth[note] = Synth(\sineGrainDustGate,
    //        [
    //            \freq, freq * rrand(0.9, 1.1),
    //            \density, n, 
    //            \grainsize, exprand(0.05, 0.5),
    //            \pan, rrand(0.0, 1.0),
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -20.dbamp,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -12.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, -12.dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberhi])       
    //    );
    //}, noteNum: (48..55), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadSineGrains, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])
    //}, noteNum: (48..55), chan: 0, srcID: srcID);

    ////fifth row, stoveperc
    //MIDIdef.noteOn(\launchpadStoveperc, {
    //    arg val, note, channel, src;
    //    var attack = 0, rel = 0.1;
    //    ~lpsynth[note] = Synth(\clean,
    //        [
    //            \buf, ~buffers[\stoveperc].choose,
    //            \pan, rrand(0.0, 1.0),
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -24.dbamp,
    //            \hipassfreq, 200,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -12.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, rrand(-24, 0).dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenhi])       
    //    );
    //}, noteNum: (64..71), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadStoveperc, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])
    //}, noteNum: (64..71), chan: 0, srcID: srcID);

    ////sixth row, treeperc
    //MIDIdef.noteOn(\launchpadTreeperc, {
    //    arg val, note, channel, src;
    //    var attack = 0, rel = 0.1;
    //    ~lpsynth[note] = Synth(\clean,
    //        [
    //            \buf, ~buffers[\treeperc].choose,
    //            \pan, rrand(0.0, 1.0),
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -14.dbamp,
    //            \hipassfreq, 200,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -12.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, rrand(-24, 0).dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\redhi])       
    //    );
    //}, noteNum: (80..87), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadTreeperc, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\redlo])
    //}, noteNum: (80..87), chan: 0, srcID: srcID);

    ////seventh row, broken piano
    //MIDIdef.noteOn(\launchpadBrokenPiano, {
    //    arg val, note, channel, src;
    //    var attack = 0;
    //    var buf = ~buffers[\brpiano].choose;
    //    var rel = buf.duration;
    //    ~lpsynth[note] = Synth(\clean,
    //        [
    //            \buf, buf,
    //            \pan, rrand(0.0, 1.0),
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -20.dbamp,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, 0.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, rrand(-24, 0).dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberhi])       
    //    );
    //}, noteNum: (96..103), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadBrokenPiano, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])
    //}, noteNum: (96..103), chan: 0, srcID: srcID);

    ////eight row, cello
    //MIDIdef.noteOn(\launchpadCello, {
    //    arg val, note, channel, src;
    //    var attack = 0;
    //    var buf = ~buffers[\cello].choose;
    //    var rel = buf.duration / 2;
    //    ~lpsynth[note] = Synth(\clean,
    //        [
    //            \buf, buf,
    //            \pan, rrand(0.0, 1.0),
    //            \out, ~bus[\fm],
    //            \attack, attack,
    //            \rel, rel,
    //            \amp, -16.dbamp,
    //            \hipassfreq, 200,
    //            \fx1, ~bus[\jpverb],
    //            \fx1lvl, -12.dbamp,
    //            \fx2, ~bus[\grdelayMedium],
    //            \fx2lvl, rrand(-24, 0).dbamp,
    //        ], target: ~group[\instr];
    //        ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenhi])       
    //    );
    //}, noteNum: (112..119), chan: 0, srcID: srcID);

    //MIDIdef.noteOff(\launchpadCello, {
    //    arg val, note, channel, src;
    //    ~lpsynth[note].set(\gate, 0);
    //    ~lpsynth[note] = nil;
    //    ~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])
    //}, noteNum: (112..119), chan: 0, srcID: srcID);

    MIDIdef.noteOn(\launchpad,{
        arg val, note, channel, src;
        if(channel == 0){
            if ((note % 16) < 8){
                case
                //top row, bass
                {note < 8}{
                    var n = notes[note];
                    var freq = (n + 30).midicps;
                    var attack = 2, rel = 5;
                    ~lpsynth[note] = Synth(\fmGate,
                        [
                            \carfreq, freq,
                            \modfreq, freq ,
                            \pan, rrand(0.0, 1.0),
                            \moddepth, 400,
                            \out, ~bus[\master],
                            \attack, attack,
                            \rel, rel,
                            \modattack, attack * 2,
                            \modrelease, rel,
                            \amp, -30.dbamp,
                            \amfreq, n + 1,
                            \amdepth, 2,
                            \fx1, ~bus[\grdelayMedium],
                            \fx1lvl, -12.dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //second row, fm
                {note < 24}{
                    var offset = 54;
                    var n = notes[note - 16] + offset;
                    var freq = n.midicps;
                    var attack = 5, rel = 0.5;
                    ~lpsynth[note] = Synth(\fmGate,
                        [
                            \carfreq, freq,
                            \modfreq, freq * rrand(0.9, 1.4),
                            \pan, rrand(0.0, 1.0),
                            \moddepth, 900,
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \modattack, attack,
                            \modrelease, rel,
                            \amp, -35.dbamp,
                            \amfreq, 120,
                            \amdepth, 8,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -12.dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //third row, fm grains
                {note < 40}{
                    var offset = 54;
                    var n = notes[note - 32] + offset;
                    var freq = note.explin(31, 40, 100, 2000);
                    var attack = 0.1, rel = 1;
                    ~lpsynth[note] = Synth(\fmgrainDustGate,
                        [
                            \carfreq, freq,
                            \modfreq, freq * rrand(0.5, 1.4),
                            \density, n, 
                            \grainsize, exprand(0.0005, 0.1),
                            \pan, rrand(0.0, 1.0),
                            \moddepth, 900,
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -32.dbamp,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -24.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, -12.dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //fourth row, sine grains
                {note < 56}{
                    var offset = 54;
                    var n = notes[note - 48] + offset;
                    var freq = note.explin(48, 56, 800, 2000);
                    var attack = 0.1, rel = 0.1;
                    ~lpsynth[note] = Synth(\sineGrainDustGate,
                        [
                            \freq, freq * rrand(0.9, 1.1),
                            \density, n, 
                            \grainsize, exprand(0.05, 0.5),
                            \pan, rrand(0.0, 1.0),
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -20.dbamp,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -12.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, -12.dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //fifth row, stoveperc
                {note < 72}{
                    var attack = 0, rel = 0.1;
                    ~lpsynth[note] = Synth(\clean,
                        [
                            \buf, ~buffers[\stoveperc].choose,
                            \pan, rrand(0.0, 1.0),
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -24.dbamp,
                            \hipassfreq, 200,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -12.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, rrand(-24, 0).dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //sixth row, treeperc
                {note < 88}{
                    var attack = 0, rel = 0.1;
                    ~lpsynth[note] = Synth(\clean,
                        [
                            \buf, ~buffers[\treeperc].choose,
                            \pan, rrand(0.0, 1.0),
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -14.dbamp,
                            \hipassfreq, 200,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -12.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, rrand(-24, 0).dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //seventh row, broken piano
                {note < 104}{
                    var attack = 0;
                    var buf = ~buffers[\brpiano].choose;
                    var rel = buf.duration;
                    ~lpsynth[note] = Synth(\clean,
                        [
                            \buf, buf,
                            \pan, rrand(0.0, 1.0),
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -20.dbamp,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, 0.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, rrand(-24, 0).dbamp,
                        ], target: ~group[\instr]
                    );
                }
                //eight row, cello
                {note < 120}{
                    var attack = 0;
                    var buf = ~buffers[\cello].choose;
                    var rel = buf.duration / 2;
                    ~lpsynth[note] = Synth(\clean,
                        [
                            \buf, buf,
                            \pan, rrand(0.0, 1.0),
                            \out, ~bus[\fm],
                            \attack, attack,
                            \rel, rel,
                            \amp, -16.dbamp,
                            \hipassfreq, 200,
                            \fx1, ~bus[\jpverb],
                            \fx1lvl, -12.dbamp,
                            \fx2, ~bus[\grdelayMedium],
                            \fx2lvl, rrand(-24, 0).dbamp,
                        ], target: ~group[\instr]
                    );
                };
            };
            if((note < activePads) && ((note%16)<8)){~launchpadOut.noteOn(0, note, ~launchpadColor[\redhi])};
        };
    });

     MIDIdef.noteOff(\launchpadoff, {
         arg val, note, channel, src;
         if(channel == 0){
             ~lpsynth[note].set(\gate, 0);
             ~lpsynth[note] = nil;
             if((note%16) < 8) {
                 case
                 {note < 8} {~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])}
                 {note < 24} {~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])}
                 {note < 40} {~launchpadOut.noteOn(0, note, ~launchpadColor[\redlo])}
                 {note < 56} {~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])}
                 {note < 72} {~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])}
                 {note < 88} {~launchpadOut.noteOn(0, note, ~launchpadColor[\redlo])}
                 {note < 104} {~launchpadOut.noteOn(0, note, ~launchpadColor[\amberlo])}
                 {note < 120} {~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])}
             };
         }
     });

)

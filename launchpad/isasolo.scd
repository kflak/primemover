(
        var notes = [0, 2, 3, 5, 7, 9, 10, 12];
        var activePads = 128;

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
                {i > 63} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])};
            };
        };

        MIDIdef.noteOn(\launchpad,{
            arg val, note, channel, src;
            if(channel == 0){
                if ((note % 16) < 8){
                    case
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
                                \amp, -20.dbamp,
                                \amfreq, n + 1,
                                \amdepth, 2,
                                \fx1, ~bus[\grdelayMedium],
                                \fx1lvl, -12.dbamp,
                            ], target: ~group[\instr]
                        );
                    }
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
                                \amp, -30.dbamp,
                                \amfreq, 120,
                                \amdepth, 8,
                                \fx1, ~bus[\jpverb],
                                \fx1lvl, -12.dbamp,
                            ], target: ~group[\instr]
                        );
                    }
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
                                \amp, -26.dbamp,
                                \fx1, ~bus[\jpverb],
                                \fx1lvl, -12.dbamp,
                                \fx2, ~bus[\grdelayMedium],
                                \fx2lvl, -12.dbamp,
                            ], target: ~group[\instr]
                        );
                    }
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
                    {note > 64}{
                        var attack = 0, rel = 0.1;
                        ~lpsynth[note] = Synth(\clean,
                            [
                                \buf, ~buffers[\stoveperc].choose,
                                \pan, rrand(0.0, 1.0),
                                \out, ~bus[\fm],
                                \attack, attack,
                                \rel, rel,
                                \amp, -30.dbamp,
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
                    {note > 63} {~launchpadOut.noteOn(0, note, ~launchpadColor[\greenlo])};
                };
            }
        });

)

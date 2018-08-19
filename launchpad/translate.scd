(
    var count = 0;
    //set pads to red
    128.do{|idx|
        //make sure previous synths are properly dead and buried
        ~lpsynth[idx].set(\gate, 0);
        ~launchpadOut.noteOn(0, idx, ~launchpadColor[\redlo]);
    };

    MIDIdef.noteOn(\launchpad, {
        arg val, num, ch, src;
        var synth, numFrames, sampleLength, currentBuffer, arraysize;
        arraysize = ~buffers[\translateEstonian].size;
        if(ch == 0){
            if(count < arraysize) {
                currentBuffer = ~buffers[\translateEstonian][count];
                sampleLength = currentBuffer.duration;
                synth = Synth(\cleangate,
                    [
                        \out, ~bus[\master],
                        \buf, ~buffers[\translateEstonian][count],
                        \amp, -12.dbamp,
                        \attack, 0.01,
                        \rel, 0.1,
                        \pan, 0,
                        \loop, 0,
                        \hipassfreq, 400, 
                        \lopassfreq, 800,
                        \thresh, -13.dbamp,
                        \gain, 6.dbamp,
                        \ratio, 16,
                        \da, 2
                    ], ~group[\instr]
                );
                ~launchpadOut.noteOn(0, num, ~launchpadColor[\redhi]);
                SystemClock.sched(sampleLength, {
                    ~launchpadOut.noteOn(0, num, ~launchpadColor[\redlo]);
                    synth.set(\gate, 0);
                    nil;
                });
                count = count + 1;
                // currentBuffer.postln;
            }{
                ~launchpadOut.control(176, 0, 0);
                this.executeFile((~projectfolder++"launchpad/writetext.scd").standardizePath);
                MIDIdef.noteOn(\launchpad, {});
            };
        }
    });

    MIDIdef.noteOff(\launchpadoff, {});
)

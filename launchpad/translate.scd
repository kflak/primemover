(
    ~launchpadTranslate = {
        var count = 0;
        MIDIdef.noteOn(\translate, {
            arg ...args;
            var synth, numFrames, sampleLength, currentBuffer, arraysize;
            arraysize = ~buffers[\translateEstonian].size;
            if((args[3] == 1835008) && (count < arraysize)) {
                currentBuffer = ~buffers[\translateEstonian][count];
                numFrames = currentBuffer.numFrames;
                sampleLength = numFrames / s.sampleRate;
                synth = Synth(\cleangate,
                    [
                        \out, ~bus[\master],
                        \buf, ~buffers[\translateEstonian][count],
                        \amp, -6.dbamp,
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
                SystemClock.sched(sampleLength, {
                    synth.set(\gate, 0);
                    nil;
                });
                count = count + 1;
                // currentBuffer.postln;
            }
        });
    }
)



~launchpadTranslate.value();
~ch[\mic0].set(\gate, 1, \lvlin, 0.dbamp, \pan, 1, \width, 2);
~ch[\mic1].set(\gate, 1, \lvlin, 0.dbamp, \pan, 1, \width, 2);
~ch[\mic0].set(\gate, 0, \lvlin, 0.dbamp, \pan, 1, \width, 2);
~ch[\mic1].set(\gate, 0, \lvlin, 0.dbamp, \pan, 1, \width, 2);

(
    ~looper = ();
    ~looper.put(\bufLength, 8);
    ~looper.put(\numLoops, 4);
    ~looper.put(\recLength, ~looper[\bufLength] + ~looper[\numLoops]);
    ~looper.put(\primeBuf, Buffer.alloc(s, s.sampleRate * 120, 1)); 
    ~looper.put(\recBuf, 4.collect{
        Buffer.alloc(s, s.sampleRate * ~looper[\bufLength], 1)
    });
    ~looper.put(\inbus, s.options.numInputBusChannels);
    ~looper.put(\recStart, {
        ~looper.put(\recSynth, 
            Synth(\rec_in, [
                \in, ~looper[\inbus], 
                \out, ~bus[\master], 
                \buf, ~looper[\primeBuf], 
                \fx1, ~bus[\jpverb];
                \fx1lvl, -12.dbamp,
            ]);
        );
    });
    ~looper.put(\recStop, {|idx|
        var dur, samples, t1;
        ~looper[\recSynth].free;
        ~looper[\primeBuf].copyData(
            ~looper[\recBuf][idx], 
            numSamples: ~looper[\bufLength] * s.sampleRate
        );
        ~looper[\primeBuf].zero;
    });
    ~looper.put(\metronome,
        TaskProxy.new({
            var dur = 1;
            inf.do {|idx|
                var amp;
                if((idx % 4) == 0){
                    amp = -3.dbamp
                }{
                    amp = rrand(-30.dbamp, -20.dbamp)
                };
                Synth(\clean, [
                    \buf, ~buffers[\water].choose,
                    \amp, amp,
                    \pan, rrand(-1.0, 1.0),
                    \rel, 0.5,
                    \out, ~bus[\master],
                    \fx1, ~bus[\jpverb],
                    \fx1lvl, -12.dbamp
                ], ~group[\instr]);
                dur.wait;
            }
        });
    );
    ~looper.put(\recSeq, 
        Routine({
            ~looper[\numLoops].do{|idx|
                ~looper[\recStart].value();
                "Started recording".postln;
                ~looper[\bufLength].wait;
                ~looper[\recStop].value(idx);
                postf("Recorded to buffer %\n", idx)
            }
        });
    );
)
// ~looper[\recSeq].play;
// ~looper[\metronome].play;
// ~looper[\metronome].stop;

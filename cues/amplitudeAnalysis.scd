(
    var calcDelta, delta=0, prev=0, amp=0, count=0, rate=20;

    ~ampAnalysis = Dictionary.new;
    ~ampAnalysis.put(\bus, Bus.audio(s, 1));
    ~ampAnalysis.put(\insynth, 
        Synth(\stereoToMono, 
            [
                \in, s.options.numOutputBusChannels, 
                \out, ~ampAnalysis[\bus],
            ], target: ~group[\instr]
        );
    );
    ~ampAnalysis.put(\ampTracker, 
        Synth(\amplitudeTracker, 
            [
                \in, ~ampAnalysis[\bus],
                \rate, rate
            ], 
            target: ~ampAnalysis[\insynth], 
            addAction: \addAfter
        );
    );

    // ~ampAnalysis[\insynth].free;
    // ~ampAnalysis[\ampTracker].free;

    OSCdef(\amplistener, {|msg|
        var data = msg[3..];
        amp = data[1];
    }, '/amplitude');

    calcDelta = {
        delta = amp - prev;
        prev = amp;
        delta;
    };

    Tdef(\amplitudePlayer, {
        var thresh = 0.10, free=true, numFrames, sampleLength, dt, currentBuffer, synth;
        inf.do{
            dt = calcDelta.value();
            if ((free) && (dt > thresh)){
                currentBuffer = ~buffers[\translateEstonian][count];
                numFrames = currentBuffer.numFrames;
                sampleLength = numFrames / s.sampleRate;
                free = false;
                SystemClock.sched(sampleLength, {
                    synth = Synth(\cleangate,
                        [
                            \out, ~bus[\master],
                            \buf, ~buffers[\translateEstonian][count],
                            \amp, -6.dbamp,
                            \attack, 0.01,
                            \rel, 0.1,
                            \pan, 0,
                            \loop, 0,
                            \da, 2
                        ], ~group[\instr]
                    );
                });
                SystemClock.sched(sampleLength * 3, {
                    // synth.set(\gate, 0);
                    free = true;
                });
                if(count < ~buffers[\translateEstonian].size){
                    count = count + 1
                }{
                    count = 0
                };
                currentBuffer.postln;
            };
            rate.reciprocal.wait;
        };
    }).play;
)

~buffers[\translateEstonian].do{|i, idx| ~buffers[\translateEstonian][idx].postln;};

(
    OSCdef(\amplistener).free;
    Tdef(\test).stop;
    ~ampAnalysis[\insynth].free;
    ~ampAnalysis[\ampTracker].free;
)

(
    Tdef(\test, { inf.do{
        var dur = 1;
        {Out.ar(7, SinOsc.ar(880) * XLine.kr(0.2, 0.00001, dur, doneAction: 2))}.play;
        dur.wait; }}
    ).play;
)



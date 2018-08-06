(
    var calcDelta, delta=0, prev=0, amp=0, count=0;

    ~ampAnalysis = Dictionary.new;
    ~ampAnalysis.put(\bus, Bus.audio(s, 1));
    ~ampAnalysis.put(\insynth, 
        Synth(\stereoToMono, 
            [
                // \in, s.numOutputBusChannels, 
                \in, 7,
                \out, ~ampAnalysis[\bus],
            ], target: ~group[\instr]
        );
    );
    ~ampAnalysis.put(\ampTracker, 
        Synth(\amplitudeTracker, 
            [
                \in, ~ampAnalysis[\bus],
                \rate, 20
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
        var thresh = 0.01, free=true, speedlim=1, dt;
        inf.do{
            dt = calcDelta.value();
            if ((free) && (dt > thresh)){
                Synth(\clean,
                    [
                        \out, ~bus[\master],
                        \buf, ~buffers[\brpiano][count],
                        \amp, 0.2,
                        \attack, 0.01,
                        \rel, speedlim,
                    ], ~group[\instr]
                );
                free = false;
                SystemClock.sched(speedlim, {
                    free = true;
                });
                if(count < ~buffers[\brpiano].size){
                    count = count + 1
                }{
                    count = 0
                };
                count.postln;
            };
            20.reciprocal.wait;
        };
    }).play;

)

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



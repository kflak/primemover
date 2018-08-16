(
    //remember to start qmidinet first!

    MBDeltaTrigLight.midiout = MIDIOut.newByName("QmidiNet", "port 0");
    MBDeltaTrigLight.mbData = ~mbData;
    // MBDeltaTrigLight.mbData;
    ~light = IdentityDictionary.new;
    // ~light.put(\testtrigger, TaskProxy ({
    //     var free = true;
    //     inf.do({
    //         var dt = ~mbData[11].delta;
    //         var speedlim = 1.0;
    //         var threshold = 0.1;
    //         var note = 61;
    //         var channel = 0;
    //         if(free) {
    //             if(dt > threshold){
    //                 var velocity = dt.linlin(0.0, 1.0, 0.0, 127.0);
    //                 ~light[\midiout].noteOn(channel, note, velocity);
    //                 dt.postln;
    //                 free = false;
    //                 SystemClock.sched(speedlim, {
    //                     ~light[\midiout].noteOn(channel, note, 0);
    //                     free = true;
    //                 });
    //             };
    //         };
    //         ~mbResamplingFreq.reciprocal.wait;
    //     });
    // }));
    
    ~light.put(\testtriggerclass, MBDeltaTrigLight.new(
        speedlim: 0.9, 
        threshold: 0.1,
        minibeeID: 10,
        midiChannel: 0,
        minVelocity: 0,
        maxVelocity: 127,
        note: 60
    ));
)
// ~mbData[10].delta;

// ~light[\testtriggerclass].play;
// ~light[\testtriggerclass].dump;

// ~light[\midiout].noteOn(0, rrand(60, 64), 50);
// ~light[\midiout].noteOff(0, 61, 50);

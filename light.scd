(
    //remember to start qmidinet first!

    // MBDeltaTrigLight.midiout = MIDIOut.newByName("QmidiNet", "port 0");
    // MBDeltaTrigLight.mbData = ~mbData;
    // MBDeltaTrigLight.mbData;
    ~light = IdentityDictionary.new;
    ~light[\midiout] = MIDIOut.newByName("QmidiNet", "port 0");
    ~light.put(\testtrigger, TaskProxy ({
        var free = true;
        var note = 59;
        inf.do({
            var dt = ~mbData[10].delta;
            var speedlim = 1.0;
            var threshold = 0.1;
            var channel = 10;
            if(free) {
                if(dt > threshold){
                    var velocity = dt.linlin(0.0, 1.0, 0.0, 127.0);
                    [note, velocity].postln;
                    ~light[\midiout].noteOn(channel, note, velocity);
                    note = note + 1 % 2;
                    dt.postln;
                    free = false;
                    SystemClock.sched(speedlim, {
                        free = true;
                        nil;
                    });
                };
            };
            ~mbResamplingFreq.reciprocal.wait;
        });
    }));

    // ~light.put(\testtriggerclass, MBDeltaTrigLight.new(
    //     speedlim: 0.9, 
    //     threshold: 0.1,
    //     minibeeID: 10,
    //     midiChannel: 0,
    //     minVelocity: 0,
    //     maxVelocity: 127,
    //     note: 60
    // ));
)
// ~mbData[10].delta;

// ~light[\testtrigger].();
// ~light[\testtrigger].play;


// ~light[\testtriggerclass].dump;

// m = MIDIOut.newByName("QmidiNet", "port 0");
// m.noteOn(10, 0, 127);
// MIDIdef.noteOn(\testing, {arg ...args; args.postln});
// // MIDIdef.noteOn(\testing, {});

// OSCdef(\test, {|msg, time, addr, recvPort| msg.postln}, '/test/hello', n); // def style

// OSCdef(\test).free;

// NetAddr.langPort;

// n = NetAddr("192.168.0.101");
// n = NetAddr("localhost", 57120);
// n.sendMsg("/chat", "Hello!");
// NetAddr.langPort;

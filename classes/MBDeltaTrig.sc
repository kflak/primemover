MBDeltaTrig {

    classvar <>mbData;
    classvar <>resamplingFreq = 20;
    classvar <>numSpeakers = 2;

    var <>speedlim, <>threshold;
    var <>minibeeID;
    var <>minAmp, <>maxAmp;
    var <>function;
    var <>channelParameters;

    var <bus, <task;
    var <deltaFunc, <synth;

    *new { arg speedlim=0.5, threshold=0.1, minibeeID=10, minAmp=0.0, maxAmp=1.0, function, channelParameters;
        ^super.newCopyArgs( speedlim, threshold, minibeeID, minAmp, maxAmp, function, channelParameters ).init;
    }

    init {
    }

    createTask{
        task = TaskProxy.new( {
            var free = true;
            inf.do({
                var dt = deltaFunc.delta;
                if(free) {
                    if(dt > threshold){
                        function.value(bus, dt, minAmp, maxAmp);
                        [dt, minibeeID, minAmp, maxAmp, bus].postln;
                        free = false;
                        SystemClock.sched(speedlim,{
                            free = true;
                        });
                    };
                };
                resamplingFreq.reciprocal.wait;
            });
        });
    }

    play { arg out;
    // play { arg out, target, server;
        deltaFunc = mbData[minibeeID];
        // server = server ? Server.default;
        // bus = Bus.audio(server, numSpeakers);
        if (task.isNil){
            this.createTask;
        //     // make channel strip synth
        //     synth = Synth.new(\chstrip_multi, [\in, bus, \out, out, \da, 2] ++ channelParameters, target);
            task.play;
        }{
            "Task is playing. Stop it first".postln;
        };
    }

    // gentle stop
    release{ |releaseTime=1|
        // synth.release(releaseTime);
        SystemClock.sched(releaseTime, { 
            task.stop; 
            task = nil; 
            // bus.free
        });
    }

    // emergency stop
    stop{
        // synth.free;
        task.stop;
        task = nil;
        // bus.free;
    }
}

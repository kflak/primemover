MBDeltaTrig {

    // classvar <>availableMinibees;
    classvar <>resamplingFreq = 20;
    // classvar <>clock;

    // var name;
    var <>speedlim=0.5, <>threshold=0.1;
    var <>minibeeID=10;
    var <>minAmp=0.0, <>maxAmp=0.3;
    var <>function;
    var <>channelParameters;

    var <bus, <task;
    var <deltaFunc, <synth;

    *new { arg speedlim, threshold, minibeeID, minAmp, maxAmp, function, channelParameters;
        ^super.newCopyArgs( speedlim, threshold, minibeeID, minAmp, maxAmp, function, channelParameters ).init;
    }

    init {
    }

    // prepareToPlay { arg deltaValueFunc, numSpeakers, server;
    //     deltaFunc = deltaValueFunc;
    //     server = server ? Server.default;
    //     bus = Bus.audio(server, numSpeakers);
    //     this.createTask;
    // }

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

    play { arg deltaValueFunc, numSpeakers, server, out, target;
        deltaFunc = deltaValueFunc;
        server = server ? Server.default;
        bus = Bus.audio(server, numSpeakers);
        this.createTask;
        // make channel strip synth
        synth = Synth.new(\chstrip_multi, [\in, bus, \out, out, \da, 2] ++ channelParameters, target);
        task.play;
    }

    // gentle stop
    release{ |releaseTime=1|
        synth.release(releaseTime);
        SystemClock.sched(releaseTime, { task.stop; bus.free});
    }

    // emergency stop
    stop{
        synth.free;
        task.stop;
        bus.free;
    }

}


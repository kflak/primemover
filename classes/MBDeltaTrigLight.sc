MBDeltaTrigLight {

    classvar <>mbData;
    classvar <>resamplingFreq = 20;
    classvar <>midiout;

    var <>speedlim=0.5, <>threshold=0.1;
    var <>minibeeID=10;
    var <>minVelocity=0.0;
    var <>maxVelocity=127.0;

    var <>midiChannel=0;
    var <>note=60;

    var <task;
    var <deltaFunc;

    *new { arg speedlim, threshold, minibeeID, minVelocity, maxVelocity, midiChannel, note;
        ^super.newCopyArgs( speedlim, threshold, minibeeID, minVelocity, maxVelocity, midiChannel, note).init;
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
                        var velocity = dt.linlin(0.0, 1.0, minVelocity, maxVelocity);
                        midiout.noteOn(midiChannel, note, velocity);
                        [dt, minibeeID, midiChannel, note, velocity].postln;
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

    play { 
        deltaFunc = mbData[minibeeID];
        if(task.isNil){
            this.createTask;
            task.play;
            "Task created".postln;
        }{
            "Task is running".postln;
        };
    }

    stop{
        task.stop;
        task = nil;
    }
}

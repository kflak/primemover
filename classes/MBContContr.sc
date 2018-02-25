MBContContr {
    classvar <>resamplingFreq=20;

    var <synth;
    var <>minibeeID;
    var <>bus;
    var <>task;
    var <>synthFunc, <>controlFunc, <>numSpeakers, <>server;
    
    *new { arg minibeeID, synthFunc, controlFunc, numSpeakers, server;
        ^super.newCopyArgs(minibeeID, synthFunc, controlFunc, numSpeakers, server).init;
    }

    init{
    }

    play{ 
        server = server ? Server.default;
        bus = Bus.audio(server, numSpeakers);
        synth = synthFunc.value;
        this.createTask(controlFunc);
    }

    createTask{|controlFunc|
        task = TaskProxy.new({
            inf.do {
                controlFunc.value;
                resamplingFreq.reciprocal.wait;
            }
        }).play;
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

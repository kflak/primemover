MBData {
    classvar <>resamplingFreq = 20;

    var <>minibeeID;
    var <delta, <x, <y, <z;
    var data, dataMul=15, dataOffset=7.0;
    var prevData;
    var task;
    var oscFunc;

    *new { arg minibeeID;
        ^super.newCopyArgs(minibeeID).init;
    }

    init {
        data = [0.0, 0.0, 0.0];
        prevData = [0.0, 0.0, 0.0];
        this.createOscFunc;
        this.createTask;
    }

    createOscFunc {
        oscFunc = OSCFunc({|oscdata|
            data = oscdata[2..] * dataMul - dataOffset;
            data = data.clip(0.0, 1.0);
            x = data[0];
            y = data[1];
            z = data[2];
        }, '/minibee/data', argTemplate: [minibeeID]);
    }

    createTask {
        task = TaskProxy.new({
            inf.do {
                this.calcDelta;
                resamplingFreq.reciprocal.wait;
            }
        }).play;
    }

    calcDelta {
        // if(prevData.notNil) {
            delta = (data - prevData).abs.sum/3;
            prevData = data.copy;
            ^delta;
        // }{
        //     prevData = data.copy;
        // };
    }
}

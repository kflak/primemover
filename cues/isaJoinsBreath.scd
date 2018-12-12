(
    {

        "Isa joins breath".postln;

        ~isaJoinsBreath = Routine {     
            
            if(~hasLaunchpad){
                //turn off launchpad again
                ~launchpadOut.control(176, 0, 0);
            };

            Pdef(\tibetBellRev).play;

            ~ch[\mic0].set(\gate, 0);
            ~ch[\mic1].set(\gate, 0);
            ~ch[\mic2].set(\gate, 0);
            ~ch[\mic3].set(\gate, 0);

            60.wait;

            Pdef(\celloBegin).play;

            40.wait;

            Pdef(\sineGrainTrainEnv).play;
            Pdef(\nasaBeginning).stop;

            40.wait;

            Pdef(\nasaSaturn).play;

            30.wait;

            Pdef(\pinkNoiseBreath).play;
            
            15.wait;

            Pdef(\windBegin).play;

            15.wait;

            Pdef(\aliinaCryBeginning).play;

            100.wait;

            Pdef(\school_yard_fadein).play;
            Pdef(\celloBegin).stop;

            100.wait;

            Pdef(\nasaSaturn).stop;
            Pdef(\pinkNoiseBreath).stop;

            20.wait;

            Pdef(\heartbeat).stop;
        }.play;
    };
)

// Pdef(\fastFirst).stop;
// Pdef(\fastSecond).stop;
// Pdef(\aliinaChatFaster).stop;

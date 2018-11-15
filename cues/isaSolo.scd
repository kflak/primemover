(
    {
        ~isasolocue = Routine {

            "Isa gives launchpad to Kenneth".postln;

            //Isabell sensor on
            // [12].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix]) };

            if(~hasLaunchpad){
                // this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
                //clear launchpad
                ~launchpadOut.control(176, 0, 0);

                //set all active pads
                128.do{|i|
                    if((i%16) < 8) {
                        case
                        {i < 8} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
                        {i < 24} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
                        {i < 40} {~launchpadOut.noteOn(0, i, ~launchpadColor[\redlo])}
                        {i < 56} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
                        {i < 72} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
                        {i < 88} {~launchpadOut.noteOn(0, i, ~launchpadColor[\redlo])}
                        {i < 104} {~launchpadOut.noteOn(0, i, ~launchpadColor[\amberlo])}
                        {i < 120} {~launchpadOut.noteOn(0, i, ~launchpadColor[\greenlo])}
                    };
                };
            };

            Pdef(\aliinaChat).stop;
            Pdef(\fastFirst).stop;
            Pdef(\fastSecond).stop;
            Pdef(\aliinaChatFaster).stop;
            Pdef(\school_yard_fadein).stop;
            Pdef(\fastNonRythmical).stop;
            ~ch[\mic2].set(\gate, 0);
            ~ch[\mic3].set(\gate, 0);
            ~isaJoinsBreath.stop;

        }.play;
    }
)

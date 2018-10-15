(
    {
        ~isasolocue = Routine {

            "Isa gives launchpad to Kenneth".postln;

            //Isabell sensor on
            // [12].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix]) };

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
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

(
    {
        ~isasolocue = Routine {

            "isa solo".postln;

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
            ~isaJoinsBreath.stop;

        }.play;    
    }
)

(
    {
        ~isasolocue = Routine {

            "isa solo".postln;

            //Isabell sensor on
            // [12].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix]) };

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
            };

            Pdef(\fastSecond).stop;
            Pdef(\aliinaChatFaster).stop;

        }.play;    
    }
)

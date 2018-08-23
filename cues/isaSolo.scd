(
    {
        ~isasolocue = Routine {

            "isa solo".postln;

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);
            };

            Pdef(\fastSecond).stop;
            Pdef(\aliinaChatFaster).stop;

        }.play;    
    }
)

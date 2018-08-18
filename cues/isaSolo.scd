(
    {
        ~isasolocue = Routine {

            this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath);

            30.wait;

            Pdef(\fastSecond).stop;

            5.wait;

            Pdef(\aliinaChatFaster).stop;

        }.play;    
    }
)

(
    {
        ~talkcue = Routine{

            ~ch[\mic0].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);
            ~ch[\mic1].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);
            ~ch[\mic2].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);
            ~ch[\mic3].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);

            if(~hasLaunchpad){
                this.executeFile((~projectfolder++"launchpad/translate.scd").standardizePath);
            };

            100.wait;

            ~ch[\mic0].set(\fx2lvl, -15.dbamp);
            ~ch[\mic1].set(\fx2lvl, -15.dbamp);
            ~ch[\mic2].set(\fx2lvl, -15.dbamp);
            ~ch[\mic3].set(\fx2lvl, -15.dbamp);

        }.play
    }
)

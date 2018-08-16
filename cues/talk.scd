(
    {
        ~talkcue = Routine{

            ~ch[\mic0].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);
            ~ch[\mic1].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);

            100.wait;

            ~ch[\mic0].set(\fx2lvl, -15.dbamp);
            ~ch[\mic1].set(\fx2lvl, -15.dbamp);

        }.play
    }
)

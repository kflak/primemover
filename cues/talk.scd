(
    {
        ~talkcue = Routine{

            ~ch[\mic0].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);
            ~ch[\mic1].set(\gate, 1, \fx1lvl, -30.dbamp, \fx2lvl, -40.dbamp, \f3lvl, -40.dbamp);

            30.wait;

            Pdef(\fastSecond).stop;

            5.wait;

            Pdef(\aliinaChatFaster).stop;

            60.wait;

            ~ch[\mic0].set(\fx2lvl, -15.dbamp);
            ~ch[\mic1].set(\fx2lvl, -15.dbamp);

        }.play
    }
)

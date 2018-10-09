(
    {
        ~darknesscue = Routine{

            "darkness".postln;

            //Külli
            ~ch[\mic0].set(\lvlin, -6.dbamp, \lvlout, -6.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350, \hishelfdb, -12);
            //Rakesh
            ~ch[\mic1].set(\lvlin, -6.dbamp, \lvlout, -3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350);
            //Kenneth
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350);
            //Isa
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 9.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350);
            // ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350, \hishelfdb, -12);
            // ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 6.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 350, \hishelfdb, -12);

            [12].do{|id, idx| ~deltaTriggers[\water][idx].release(1)}; //Isabell sensor off
            // if(~hasQmidiNet){ ~light[\isaSolo].stop; };
            Pdef(\heartbeatLo).play(TempoClock(0.8));
            ~ch[\heartbeat].set(\gate, 1, \attack, 30);

            10.wait;

            // if(~hasQmidiNet){ ~light[\isaSolo].reset; };

            ~whispersynth = Synth(\cleanCirclePanGate, [\out, ~bus[\master], \buf, ~buffers[\translateEstonian][0], \amp, -30.dbamp, \da, 2, \loop, 1]);

            80.wait;

            ~launchpadOut.control(176, 0, 0);
            // MIDIdef.noteOn(\launchpad, {});
            // MIDIdef.noteOff(\launchpadoff, {});
            MIDIdef.freeAll;
            MIDIdef.noteOn(\text, {
                arg val, note, channel, src;
                if(channel==0){
                    fork{
                        Tdef(\writetext).play;

                        50.wait;

                        Tdef(\darkness).play;
                        MIDIdef.noteOn(\text, {});
                        Pdef(\heartbeatLo).stop;

                        105.wait;

                        //switch off mics
                        ~ch[\mic0].set(\gate, 0);
                        ~ch[\mic1].set(\gate, 0);
                        ~ch[\mic2].set(\gate, 0);
                        ~ch[\mic3].set(\gate, 0);

                        Tdef(\writetext).stop;
                        Pdef(\tens).play(TempoClock(2.0)).quant_(0);
                        ~launchpadOut.control(176, 0, 0);

                        20.wait;

                        Pdef(\darknessVanaema).stop;
                        Tdef(\darkness).stop;
                        Tdef(\darkness).reset;
                        Pdef(\darknessBlips).stop;
                        Pdef(\darknessBlipsFaster).stop;
                        Pdef(\darknessBreathFadeIn).stop;
                        Pdef(\darknessSub).stop;
                        Pdef(\darknessTibet).stop;

                        130.wait;

                        //Külli trigger Aliina laughs
                        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\tens], target: ~group[\mix])};

                        60.wait;

                        //QUARTET
                        "Rakesh solo".postln;
                        ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};

                        60.wait;

                        //kill Külli's sensors
                        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};
                        Pdef(\tens).stop;

                        //QUARTET
                        60.wait;

                        "Kenneth starts singing".postln;

                        ~ch[\grdelayLong].set(\fb, 0.6);
                        ~ch[\mic2].set(\gate, 1, \lvlout, -10.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp);

                    }
                };
            });
        }.play;
    }
)
// ~darknesscue.stop;
// ~darknesscue.reset;

//(
//    fork{
//        Pdef(\tens).play(TempoClock(2.0)).quant_(0);
//        ~launchpadOut.control(176, 0, 0);

//        20.wait;

//        Pdef(\darknessVanaema).stop;

//        10.wait;

//        Tdef(\darkness).stop;
//        Tdef(\darkness).reset;
//        Pdef(\darknessBlips).stop;
//        Pdef(\darknessBlipsFaster).stop;
//        Pdef(\darknessBreathFadeIn).stop;
//        Pdef(\darknessSub).stop;
//        Pdef(\darknessTibet).stop;

//        120.wait;

//        //Külli trigger Aliina laughs
//        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\tens], target: ~group[\mix])};

//        60.wait;

//        //QUARTET
//        "Rakesh solo".postln;
//        ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\master], target: ~group[\mix])};

//        60.wait;

//        //kill Külli's sensors
//        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};

//        //QUARTET
//        60.wait;

//        "Kenneth starts singing".postln;

//        ~ch[\grdelayLong].set(\fb, 0.6);
//        ~ch[\mic2].set( \gate, 1, \lvlout, -6.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp);
//    }
//)
// Pdef(\tens).stop;

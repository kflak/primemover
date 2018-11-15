(
    {
        ~darknesscue = Routine{

            "darkness".postln;

            //Külli
            ~ch[\mic0].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \width, ~numSpeakers, \hishelffreq, 500, \hishelfdb, 0);
            //Rakesh
            ~ch[\mic1].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \width, ~numSpeakers, \hishelffreq, 500, \hishelfdb, 0);
            //Kenneth
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \width, ~numSpeakers, \hishelffreq, 500, \hishelfdb, 0);
            //Isa
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \width, ~numSpeakers, \hishelffreq, 500, \hishelfdb, 0);

            [12].do{|id, idx| ~deltaTriggers[\water][idx].release(1)}; //Isabell sensor off
            Pdef(\heartbeatLo).play(TempoClock(0.8));
            ~ch[\heartbeat].set(\gate, 1, \attack, 30);

            20.wait;

            ~whispersynth = Synth(\cleanCirclePanGate, [\out, ~bus[\master], \buf, ~buffers[\translateEstonian][0], \amp, 9.dbamp, \hipassfreq, 400, \da, 2, \loop, 1, \rate, 1, \rel, 150]);

            30.wait;

            40.wait;

            ~launchpadOut.control(176, 0, 0);
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

                        ~whispersynth.set(\gate, 0); 

                        //Külli trigger Aliina laughs
                        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].play(out: ~bus[\tens], target: ~group[\mix])};

                        60.wait;

                        "Rakesh solo".postln;
                        ~deltaTriggers[\emIDs].do{|id, idx| ~deltaTriggers[\em][idx].play(out: ~bus[\em], target: ~group[\mix])};
                        // Backup when no sensor
                        // Pdef(\emSolo).play;

                        60.wait;

                        //kill Külli's sensors
                        ~deltaTriggers[\aliinaLaughIDs].do{|id, idx| ~deltaTriggers[\aliinaLaugh][idx].release(1)};
                        Pdef(\tens).stop;

                        60.wait;

                        "Kenneth starts singing".postln;

                        ~ch[\grdelayLong].set(\fb, 0.6);
                        ~ch[\mic2].set(\gate, 1, \lvlin, 0.dbamp, \lvlout, 0.dbamp, \fx1lvl, -20.dbamp, \fx2lvl, -10.dbamp, \fx3lvl, 0.dbamp, \hishelffreq, 500, \hishelfdb, -3);

                    }
                };
            });
        }.play;
    }
)
// ~darknesscue.stop;
// ~darknesscue.reset;

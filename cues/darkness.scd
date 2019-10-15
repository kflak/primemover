(
    {
        ~darknesscue = Routine {

            var miclevel = -7.dbamp;

            "darkness".postln;

            ~ch[\mic0].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //külli
            ~ch[\mic1].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //rakesh
            ~ch[\mic2].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //kenneth
            ~ch[\mic3].set(\lvlout, miclevel, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 250, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //isabell

            [9, 12].do{|id, idx| ~deltaTriggers[\water][idx].release(1)}; //Isabell sensor off
            Pdef(\heartbeatLo).play(TempoClock(0.8));
            ~ch[\heartbeat].set(\gate, 1, \attack, 30);

            20.wait;

            ~whispersynth = Synth(\cleanCirclePanGate, [
                \out, ~bus[\master], 
                \buf, ~buffers[\translateEstonian][0], 
                \amp, -3.dbamp, 
                \hipassfreq, 400, 
                \da, 2, 
                \loop, 1, 
                \rate, -1, 
                \rel, 420
            ]);

            70.wait;

            if(~hasLaunchpad) {
                ~launchpadOut.control(176, 0, 0);
                MIDIdef.freeAll;
                MIDIdef.noteOn(\text, {
                    Tdef(\writetext).play; 
                    Synth(\fm, [
                        \carfreq, 52,
                        \modfreq, 50,
                        \moddepth, 4,
                        \attack, 20, 
                        \release, 200,
                        \amp, -55.dbamp,
                        \out, ~bus[\master],
                    ]); 
                    // Synth(\clean_circle_pan, [
                    //     \buf, ~buffers[\nasa][4],
                    //     \attack, 10,
                    //     \release, 80,
                    //     \amp, -26.dbamp,
                    //     \panspeed, 0.03,
                    // ]);
                    MIDIdef.noteOn(\text, {})
                }, chan: 0);
            };
        }.play;
    }
)
// ~darknesscue.stop;
// ~darknesscue.reset;


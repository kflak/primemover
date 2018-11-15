(
    {
        ~darknesscue = Routine{

            "darkness".postln;

            ~ch[\mic0].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //külli
            ~ch[\mic1].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //rakesh
            ~ch[\mic2].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //kenneth
            ~ch[\mic3].set(\lvlin, 0.dbamp, \lvlout, 3.dbamp, \gate, 1, \fx1lvl, 0, \fx2lvl, 0, \fx3lvl, 0, \locut, 150, \hishelffreq, 8000, \hishelfdb, 3, \width, ~numSpeakers); //isabell

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
                    Tdef(\writetext).play;
                };
            });
        }.play;
    }
)
// ~darknesscue.stop;
// ~darknesscue.reset;


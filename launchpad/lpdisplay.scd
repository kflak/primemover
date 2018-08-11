

~prevpad = -1;

(
    ~tackymetronome = Routine{ inf.do({ arg i;
        var col, row, activepad;

        i = i % 64;
        col = i % 8;
        row = (i / 8).floor;
        activepad = col+(row*16);
        ~launchpadOut.noteOn(0, ~prevpad);
        ~launchpadOut.noteOn(0, activepad, 15);
        ~prevpad = activepad.value;
        0.2.wait
    })}.play;
)
(
    ~tackymetronome.stop;
    ~launchpadOut.control(176,0,0); //clear launchpad
)

(
    ~randmetronome = Routine{ 
       var prevpad = -1; 
        inf.do({ arg i;
        var col, row, activepad;

        col = 8.rand;
        row = 8.rand;
        activepad = col+(row*16);
        ~launchpadOut.noteOn(0, prevpad);
        ~launchpadOut.noteOn(0, activepad, 15);
        prevpad = activepad.value;
        0.05.wait
    })}.play;
)
(
    ~randmetronome.stop;
    ~launchpadOut.control(176,0,0); //clear launchpad
)


        ~launchpadOut.noteOn(0, 4, 15);
MIDIClient.disposeClient;

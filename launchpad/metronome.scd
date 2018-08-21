// (
//     ~launchpadMetronome = Routine{ 
//         var prevpad = -1;
//         inf.do{|i| 
//             var col, row, activepad;
//             i = i % 64;
//             col = i % 8;
//             row = (i / 8).floor;
//             activepad = col+(row*16);
//             ~launchpadOut.noteOn(0, prevpad, ~launchpadColor[\off]);
//             ~launchpadOut.noteOn(0, activepad, ~launchpadColor[\redhi]);
//             prevpad = activepad;
//             0.2.wait
//         }
//     }.play;
// )
// ~launchpadMetronome.stop;
// ~launchpadOut.control(176, 0, 0);

(
    Tdef(\launchpadMetronome, { 
        var prevrow = -1;
        inf.do{|row| 
            row = row % 8.floor;
            9.do{|col|
                var pad = row * 16 + col;
                var prevrow, prevpad;
                if(row == 0){
                    prevrow = 7
                }{
                    prevrow = row - 1 
                };
                prevpad = prevrow * 16 + col;
                ~launchpadOut.noteOn(0, prevpad, ~launchpadColor[\redlo]);
                ~launchpadOut.noteOn(0, pad, ~launchpadColor[\redhi]);
            };
            0.1.wait
        }
    });
)


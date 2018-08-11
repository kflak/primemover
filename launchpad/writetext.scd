(
    var file = File.open(~projectfolder++"launchpad/launchpad.txt", "r" );
    var string = "";

    block { arg break;
        inf.do {
            // if (file.notNil){file.close};
            string = string + file.getLine();
            if(string.endsWith("nil")) {
                string = string.copyRange(0, string.size - 4);
                string = string.toLower;
                string = string.replace(" ", "  ");
                break.value
            };
        }
    };
    string.postln;

    Tdef(\writetext, {
        string.do { arg key;
            key.postln;
            ~launchpadOut.control(144, 0, 49); //set buffer 1 as display buffer
            ~launchpadFont[key.asSymbol].flatten.do{ arg item, i;
                var col, row, activepad;

                if(item == 1){
                    col = i % 8;
                    row = (i / 8).floor;
                    activepad = col+(row*16);
                    ~launchpadOut.noteOn(0, activepad, ~launchpadColor[\redhi]);
                }
            };
            ~launchpadOut.control(144, 0, 52); //set buffer 0 as display buffer 
            0.2.wait;
            ~launchpadOut.control(176,0,0); //clear launchpad
        };
    });
)

Tdef(\writetext).play;

~launchpadFont[\a];
hj
// (
    // Tdef(\writetext).stop;
    // ~launchpadOut.control(176,0,0); //clear launchpad
// )

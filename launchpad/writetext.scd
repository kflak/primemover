(
    var file = File.open(~projectfolder++"launchpad/primemover.txt", "r" );
    var string = "prime mover";

    block { |break|
        inf.do {
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
        inf.do{
            string.do { |key, idx|
                ~launchpadFont[key.asSymbol].flatten.do{ arg item, i;
                    var col, row, activepad;
                    if(item == 1){
                        col = i % 8;
                        row = (i / 8).floor;
                        activepad = col+(row*16);
                        ~launchpadOut.noteOn(0, activepad, ~launchpadColor[\redhi]);
                    }
                };
                0.2.wait;
                ~launchpadOut.control(176,0,0); //clear launchpad
            };
        }
    });
)

// Tdef(\writetext).play;
// Tdef(\writetext).stop;
// ~launchpadOut.control(176,0,0); //clear launchpad

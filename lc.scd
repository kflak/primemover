(
    ~lc = MKtl('lc', "novation-launchcontrol");
    ~lc_color = (
        \off: 12,
        \redlo: 13,
        \redhi: 15,
        \amberlo: 29,
        \amberhi: 63,
        \yellow: 62,
        \greenlo: 28,
        \greenhi: 60
    );
    ~lc_setall = {|color|
        8.do{ arg button;
            var template = 0;
            ~lc_out.sysex(Int8Array[240, 0, 32, 41, 2, 10, 120, template, button, ~lc_color[color], 247]);
        }
    };
    if(MIDIClient.sources.asString.contains("Launch Control")){
        ~lc_out = MIDIOut.newByName("Launch Control", "Launch Control");
        ~lc_setall.value(\off);
    } {
        "LauncControl not connected".postln;
    };

    // how to set actions for a bank of knobs
    // 8.do({arg i; ~lc.elAt(\pg0, \kn, \sndA, i).action_({arg el; [el.name, el.value].postln})});
    // 8.do({arg i; ~lc.elAt(\pg0, \kn, \sndB, i).action_({arg el; [el.name, el.value].postln})});

)

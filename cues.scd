(
    var cues = [
        "audienceEnters.scd", // 1
        "isaJoinsBreath.scd", // 2
        "beaverRise.scd",     // 3
        "isaSolo.scd",        // 4
        "isaSensorOn.scd",    // 5
        "darkness.scd",       // 6
        "heartdialog.scd",    // 7
        "crunchyImpro.scd",   // 8
        "swirl.scd",          // 9
    ];

    var cuelist = CuePlayer.new;

    cues.do{ |item| 
        var file = PathName.new("~/sc/primemover/cues/"++item).fullPath;
        cuelist.add(file);
        postf("% added to cuelist\n", file);
    };

    cuelist.gui(
        monitorInChannels: s.options.numInputBusChannels,
        monitorOutChannels: s.options.numOutputBusChannels,
        options:(
            shortcuts:true,
            largeDisplay: true,
            metronome: false,
        )
    );
)

(
    var cues = [
        "audienceEnters.scd",
        "isaJoinsBreath.scd",
        "beaverRise.scd",
        "isaSolo.scd",
        "isaSensorOn.scd",
        "darkness.scd",
        "crunchyImpro.scd",
        "swirl.scd",
    ];

    var titles = [
        "Audience enters",
        "Külli puts mic on table",
        "Three beavers rise",
        "Isa gives launchpad to Kenneth",
        "Isa finishes putting sensor on",
        "Talking starts",
        "Külli puts Kenneth down after singing",
        "Kenneth and Isabell stops in front of Külli and Rakesh",
        "Post-performance beer"
    ];

    var cuelist = CuePlayer.new;

    // cuelist.hook = {|c| text.string = "Next cue:\n"++titles[c.current+1]};

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
            largeDisplay: false,
            metronome: false,
        )
    );

    // cuelist.midiTriggerVelocity(note: 60, channel: 16);
)

(
    var cues = [
        "audienceEnters.scd",
        "isaSolo.scd",
        "isaSensorOn.scd",
        "darkness.scd",
        "crunchyImpro.scd",
    ];

    var titles = [
        "Audience enters.scd",
        "Isa gives launchpad to Kenneth",
        "Isa finishes putting sensor on",
        "Talking starts",
        "Külli puts Kenneth down after singing",
        "Post-performance beer"
    ];

    var cuelist = CuePlayer.new;
    var info = Window.new("Cueinfo", border:true);
    var text = StaticText(info, Rect(10, 10, 400, 60));
    var font = Font("DejaVu Sans Mono", 32);
    info.view.background = Color(0.0, 0.0, 0.0);
    text.string = titles[0];
    text.background = Color(0.0, 0.0, 0.0);
    text.stringColor = Color(1.0, 1.0, 1.0);
    text.font(font);
    info.front;


    cuelist.hook = {|c| text.string = "Next cue:\n"++titles[c.current+1]};

    cues.do{ |item| 
        var file = PathName.new("~/sc/primemover/cues/"++item).fullPath;
        cuelist.add(file);
        postf("% added to cuelist\n", file);
    };

    cuelist.gui(
        monitorInChannels: ~numMics,
        monitorOutChannels: s.options.numOutputBusChannels,
        options:(
            shortcuts:true,
            largeDisplay: false,
            metronome: false,
        )
    );

    cuelist.midiTrigger(note: 60, channel: 50);

    //uncomment this chunk if largeDisplay: true to be able to use spacebar when largeDisplay is active
    // AppClock.sched(0.2,
    //     {
    //         cue.guiInstance.cueTrigger.lrgCueWin.view.keyDownAction = { 
    //             arg view, char, modifiers, unicode, keycode; 
    //             switch(unicode)
    //             {32}  { cue.next }
    //         }; 
    //     };
    // );
)

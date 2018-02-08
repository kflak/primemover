(
    var cues = [
        ~beginning,
        ~crunchy_impro,
        ~wudan,
        ~end,
    ];

    var cue = CuePlayer.new;

    cues.do{ |item| cue.add(item) };

    cue.gui(
        monitorInChannels: 2,
        monitorOutChannels: ~numSpeakers,
        options:(
            shortcuts:true,
            largeDisplay: false,
            left: 0,
            top: 0,
            metronome: false,
        )
    );

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

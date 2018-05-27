(
    ~cuelist.gui(
        monitorInChannels: ~numMics,
        monitorOutChannels: ~numSpeakers + ~numSubs,
        options:(
            shortcuts:true,
            largeDisplay: false,
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

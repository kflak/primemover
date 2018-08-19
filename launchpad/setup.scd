(
    ~launchpadOut = MIDIOut.newByName("Launchpad", "Launchpad MIDI 1");

    //all pads on
    ~launchpadOut.control(176, 0, 127);
    ~launchpadColor = (
        \off: 12,
        \redlo: 13,
        \redhi: 15,
        \amberlo: 29,
        \amberhi: 63,
        \yellow: 62,
        \greenlo: 28,
        \greenhi: 60
    );
    this.executeFile((~projectfolder++"launchpad/fonts.scd").standardizePath);
    this.executeFile((~projectfolder++"launchpad/writetext.scd").standardizePath);
)


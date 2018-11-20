(
    {
        "Isa gives launchpad to Kenneth".postln;
        ~beaverRise.stop;
        Pdef(\fastNonRythmical).stop;
        Pdef(\aliinaChat).stop;
        Pdef(\fastFirst).stop;
        Pdef(\fastSecond).stop;
        Pdef(\aliinaChatFaster).stop;
        Pdef(\school_yard_fadein).stop;
        ~ch[\mic2].set(\gate, 0);
        ~ch[\mic3].set(\gate, 0);
        if(~hasLaunchpad){ this.executeFile((~projectfolder++"launchpad/isasolo.scd").standardizePath) };
    }
)

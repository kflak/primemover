(
    //initialize project!
    fork {

        ~projectfolder = "/home/kf/sc/primemover/";
        ~numSpeakers = 4;

        //start dsp
        this.executeFile((~projectfolder++"dsp.scd").standardizePath);
        4.wait;
        "dsp.scd done".postln;

        //load pdefs
        this.executeFile((~projectfolder++"pdefs.scd").standardizePath);			
        0.5.wait;
        "pdef.scd done".postln;

        //load tdefs
        this.executeFile((~projectfolder++"tdefs.scd").standardizePath);
        "tdefs.scd done".postln;

        // set up launchcontrol
        this.executeFile((~projectfolder++"lc.scd").standardizePath);
        "lc.scd done".postln;

        // set up mbs
        this.executeFile((~projectfolder++"mbs.scd").standardizePath);
        "mbs.scd done".postln;

        0.2.wait;
        this.executeFile((~projectfolder++"score.scd").standardizePath);
        "score.scd done".postln;

        // cues
        // this.executeFile((~projectfolder++"cues.scd").standardizePath);
        // "cues.scd done".postln;
    }
)



(
    var cues = [
        "audienceEnters.scd",
        "popcornEnds.scd",
        "micgrab.scd",
        "fbsong.scd",
        "crunchyImpro.scd",
        "swirl.scd",
    ];

    ~cuelist = CuePlayer.new;

    cues.do{ |item| 
        var file = PathName.new("~/sc/primemover/cues/"++item).fullPath;
        ~cuelist.add(file);
        postf("% added to ~cuelist\n", file);
    };

)

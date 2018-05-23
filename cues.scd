(
    var cues = [
        "audienceEnters.scd",
        "tens.scd",
        "crunchyImpro.scd",
    ];

    ~cuelist = CuePlayer.new;

    cues.do{ |item| 
        var file = PathName.new("~/sc/primemover/cues/"++item).fullPath;
        ~cuelist.add(file);
        postf("% added to ~cuelist\n", file);
    };

)

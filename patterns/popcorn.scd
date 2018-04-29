(
    ~popcorn = Routine {
        inf.do {
            Pdef(\fastFirst).play; Pdef(\fastFourth).stop;
            60.wait;
            Pdef(\fastSecond).play; Pdef(\fastFirst).stop;
            60.wait;
            Pdef(\fastThird).play; Pdef(\fastSecond).stop;
            60.wait;
            Pdef(\fastFourth).play; Pdef(\fastThird).stop;
            60.wait;
        }
    };

    ~popcornFree = {
            ~popcorn.stop;
            Pdef(\fastFirst).stop;
            Pdef(\fastSecond).stop;
            Pdef(\fastThird).stop;
            Pdef(\fastFourth).stop;
    };
)

// ~popcorn.play;
// ~popcornFree.value();


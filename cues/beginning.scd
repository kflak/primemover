(
    ~beginning = {
        "*Beginning*".postln;
        fork{
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\wind][idx].play(
                    threshold: 0.1,
                    minAmp: -30.dbamp,
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\samp][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            60.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\klang_klank][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            20.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\aliina][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            20.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\water][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            10.wait;
            ~mbIDs.do{|id, idx| ~deltaTriggers[\wind][idx].release(40)};
            ~mbIDs.do{|id, idx| ~deltaTriggers[\samp][idx].release(40)};
            ~mbIDs.do{|id, idx| ~deltaTriggers[\klang_klank][idx].release(40)};
            5.wait;
            Pdef(\tens).quant_(0).play(TempoClock(2.0));
            ~mbIDs.do{|id, idx| ~deltaTriggers[\aliina][idx].release(40)};
            30.wait;
            ~mbIDs.do{|id, idx| ~deltaTriggers[\water][idx].release(40)};
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\wind][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\samp][idx].play(
                    threshold: 0.5,
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            60.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\aliina][idx].play(
                    threshold: 0.7,
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            ~mbIDs.do{|id, idx| ~deltaTriggers[\samp][idx].release(30)};
            ~mbIDs.do{|id, idx| ~deltaTriggers[\wind][idx].release(30)};
            30.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\wind][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\samp][idx].play(
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            30.wait;
            ~mbIDs.do{|id, idx| 
                ~deltaTriggers[\aliina][idx].play(
                    threshold: 0.2,
                    out: ~bus[\master], 
                    target: ~group[\mix]
                )
            };
            Pdef(\tens).quant_(0).stop();
            ~mbIDs.do{|id, idx| ~deltaTriggers[\samp][idx].release(30)};
            ~mbIDs.do{|id, idx| ~deltaTriggers[\wind][idx].release(30)};
            40.wait;
            ~mbIDs.do{|id, idx| ~deltaTriggers[\aliina][idx].release(30)};
        }
    };
)

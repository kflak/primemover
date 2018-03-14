(
    ~mic = ();

    ~mic.put(\synth, nil ! ~numMics);
    
    ~mic.put(\open, 
        {arg inbus=0, lvlin=0.5, amp=0.5, pan=0, fx1= ~bus[\jpverb], fx1lvl=0.25;
            if(~mic[\synth][inbus].isNil && (inbus < ~mic[\synth].size)){
                ~mic[\synth][inbus] = Synth(\soundin, [
                    \in, inbus,
                    \lvlin, lvlin,
                    \out, ~bus[\master],
                    \amp, amp,
                    \fx1, fx1,
                    \fx1lvl, fx1lvl,
                    \pan, pan,
                    \width, ~numSpeakers,
                    \rel, 1,
                ], target: ~group[\instr]);
            }{
                ~mic[\synth][inbus].set(
                    \in, inbus, 
                    \lvlin, lvlin, 
                    \amp, amp, 
                    \pan, pan
                );
            };
        }
    );

    ~mic.put(\close, 
        {|inbus=0|
            if(~mic[\synth][inbus].notNil) {
                ~mic[\synth][inbus].set(\gate, 0);
                ~mic[\synth][inbus] = nil;
            }
        }
    );
)

// ~mic[\open].value(0);
// ~mic[\close].value(0);

(
    ~ch[\mic0].set(\gate, 1);
    ~launchControlOut = MIDIOut.newByName("Launch Control", "Launch Control MIDI 1");
    ~launchControlColor = (
        \off: 12,
        \redlo: 13,
        \redhi: 15,
        \amberlo: 29,
        \amberhi: 63,
        \yellow: 62,
        \greenlo: 28,
        \greenhi: 60
    );
    ~launchControlNotes = (9..12)++(25..26);
    ~recpath = nil;
    ~activeNote = nil;
    ~mbIDs.size.do{|i| ~launchControlOut.noteOn(0, ~launchControlNotes[i], ~launchControlColor[\redlo])};
    ~launchControlOut.noteOn(0, 28, ~launchControlColor[\yellow]);

    MIDIdef.noteOn(\recordBuf, { |val, note|
        ~recpath = "/home/kf/sc/mbworkshop/audio"+/+~launchControlNotes.indexOf(note).asString+/+rrand(10000, 99999).asString++".wav";
        s.record(~recpath, bus: ~inBus, numChannels: 1);
        ~activeNote = note;
        ~launchControlOut.noteOn(0, note, ~launchControlColor[\redhi]);
    }, noteNum: ~launchControlNotes);

    MIDIdef.noteOff(\stopRec, { |val, note|
        if(note == ~activeNote){
            fork{
                s.stopRecording;
                s.sync;
                ~buffers[\rec][~launchControlNotes.indexOf(note)].add(Buffer.read(s, ~recpath));
                ~launchControlOut.noteOn(0, note, ~launchControlColor[\redlo]);
            }
        }
    }, noteNum: ~launchControlNotes);

    MIDIdef.noteOn(\clearBuffers, {|val, note|
        ~buffers[\rec].do{|array|
            array.do{|buffer| buffer.free}
        };
        ~buffers.put(\rec, List.newClear(0) ! ~mbIDs.size);
    }, noteNum: 28);
)

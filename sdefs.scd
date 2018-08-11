(
    // ******************** utility synthdefs ********************
    SynthDef(\line,{
        arg from=0, to=1, time=1, bus=0;
        var k;
        k = Line.kr(from, to, time, doneAction: 2);
        Out.kr(bus, k);
    }).add;

    SynthDef(\xline,{
        arg from=0, to=1, time=1, bus=0;
        var k;
        k = XLine.kr(from, to, time, doneAction: 2);
        Out.kr(bus, k);
    }).add;

    SynthDef(\thru_mono, {
        arg in, out, gate=1, da=2, gain=1, fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate, doneAction: da);
        sig = In.ar(in, 1);
        sig = sig * env * gain;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\thru_stereo, {
        arg in, out, gate=1, da=2, gain=1, fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate, doneAction: da);
        sig = In.ar(in, 2);
        sig = sig * env * gain;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\stereoToMono, {
        arg in, out, gate=1, da=2, gain=1;
        var sig, env;
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate, doneAction: da);
        sig = In.ar(in, 2);
        sig = sig.sum;
        sig = sig * env * gain;
        Out.ar(out, sig);
    }).add;

    SynthDef(\mono_to_stereo, {
        arg in, out, gate=1, da=2, gain=1, pan=0, width=2;
        var sig, env;
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate, doneAction: da);
        sig = In.ar(in, 1);
        sig = sig * env * gain;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
    }).add;

    SynthDef(\soundin, {
        arg in=0, out=0, gate=0, da=2, lvlin=0.2, lvlout=0.2, pan=0, width=2.0,
        fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate, doneAction: da);
        sig = SoundIn.ar(in, mul: lvlin);
        sig = sig * env * lvlout;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\rec_in,{
        arg in=0, out=0, gate=1, buf, pan=0, width=2.0,
        fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig;
        sig = In.ar(in);
        RecordBuf.ar(sig, buf, doneAction: 2);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\chstrip_mono, {
        arg in, out, gate=1, da=2, amp=1, pan=0, width=2,
        ratio=1, thresh=1, attack=0.01, rel=0.1, compgain=1,
        locut=20, loshelffreq=200, loshelfdb=0, 
        hishelffreq=1500, hishelfdb=0, hicut=20000, 
        peakfreq=600, peakrq=1, peakdb=0, 
        fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1.0, rel), gate, doneAction: da);
        ratio = ratio.clip(0.0001, 20);
        sig = In.ar(in, 1);
        sig = Compander.ar(sig, sig, 
            thresh: thresh, 
            slopeAbove: ratio.reciprocal,
            clampTime: attack,
            relaxTime: rel,
            mul: compgain
        );
        sig = BLowShelf.ar(sig, loshelffreq, db: loshelfdb);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, locut);
        sig = BLowPass.ar(sig, hicut);
        sig = BPeakEQ.ar(sig, peakfreq, peakrq, peakdb);
        sig = sig * env * amp;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\chstrip_stereo, {
        arg in, out, gate=1, da=0, amp=1,
        ratio=1, thresh=1, attack=0.01, rel=0.1, compgain=1,
        locut=20, loshelffreq=200, loshelfdb=0, 
        hishelffreq=1500, hishelfdb=0, hicut=20000, 
        peakfreq=600, peakrq=1, peakdb=0, limit=0.9,
        fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1.0, rel), gate, doneAction: da);
        ratio = ratio.clip(0.0001, 20);
        sig = In.ar(in, 2);
        sig = Compander.ar(sig, sig, 
            thresh: thresh, 
            slopeAbove: ratio.reciprocal,
            clampTime: attack,
            relaxTime: rel,
            mul: compgain
        );
        sig = BLowShelf.ar(sig, loshelffreq, db: loshelfdb);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, locut);
        sig = BLowPass.ar(sig, hicut);
        sig = BPeakEQ.ar(sig, peakfreq, peakrq, peakdb);
        sig = Limiter.ar(sig, limit);
        sig = sig * env * amp;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\chstrip_multi, {
        arg in, out, gate=1, da=0, amp=1,
        ratio=1, thresh=1, attack=0.01, rel=0.1, compgain=1,
        locut=20, loshelffreq=200, loshelfdb=0, 
        hishelffreq=1500, hishelfdb=0, hicut=20000, 
        peakfreq=600, peakrq=1, peakdb=0, limit=0.9,
        fx1, fx2, fx1lvl=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1.0, rel), gate, doneAction: da);
        ratio = ratio.clip(0.0001, 20);
        sig = In.ar(in, ~numSpeakers);
        sig = Compander.ar(sig, sig, 
            thresh: thresh, 
            slopeAbove: ratio.reciprocal,
            clampTime: attack,
            relaxTime: rel,
            mul: compgain
        );
        sig = BLowShelf.ar(sig, loshelffreq, db: loshelfdb);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, locut);
        sig = BLowPass.ar(sig, hicut);
        sig = BPeakEQ.ar(sig, peakfreq, peakrq, peakdb);
        sig = Limiter.ar(sig, limit);
        sig = sig * env * amp;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\limiter, {
        arg in, attack=0.1, rel=0.1, amp=1, out=0, gate=1,
        ratio=2, gain=1, thresh=0.7, limit=0.9;
        var sig, source, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel), gate: gate, doneAction: 2);
        source = In.ar(in, 2);
        sig = Compander.ar(source, source, slopeAbove: 1/ratio, thresh: thresh, mul: gain);
        sig = Limiter.ar(sig, limit);
        sig = sig * amp * env;
        Out.ar(out, sig);
    }).add;

    SynthDef(\rec, {
        arg in, out, bufnum;
        var sig;
        sig = SoundIn.ar(in);
        RecordBuf.ar(sig, bufnum, doneAction: 2, loop: 0);
    }).add;

    SynthDef(\mixToMono, {
        arg in, attack=0.1, rel=0.1, amp=1, out=0, gate=1,
        locut=20, loshelffreq=200, loshelfdb=0, 
        hishelffreq=1500, hishelfdb=0, hicut=20000, 
        peakfreq=600, peakrq=1, peakdb=0, limit=0.9;
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel), gate: gate, doneAction: 2);
        sig = In.ar(in, ~numSpeakers);
        // sig = sig / ~numSpeakers;
        sig = Mix.ar(sig);
        sig = BLowShelf.ar(sig, loshelffreq, db: loshelfdb);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, locut);
        sig = BLowPass.ar(sig, hicut);
        sig = BPeakEQ.ar(sig, peakfreq, peakrq, peakdb);
        sig = Limiter.ar(sig, limit);
        sig = sig * amp * env;
        Out.ar(out, sig);
    }).add;

    SynthDef(\amplitudeTracker, {
        arg in, rate=20, lopass=500, thresh=0.01, slopeBelow=10, slopeAbove=1;
        var sig, amp, trig;
        sig = In.ar(in, 1);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeBelow: slopeBelow, slopeAbove: slopeAbove);
        sig = BLowPass.ar(sig, lopass);
        amp = Amplitude.kr(sig);
        trig = Impulse.kr(rate);
        SendReply.kr(trig, '/amplitude', [in, amp]);
    }).add;

    // ******************** instruments ********************

    SynthDef(\pitchFollower, { 
        arg in, out, pitchratio=0.5, da=2, pan=0, width=2, amp=0.1, gate=1;
        var input, freq, hasFreq, sig, env;
        input = SoundIn.ar(in);
        # freq, hasFreq = Pitch.kr(input);
        env = EnvGen.kr(Env.asr(0.1, amp, 0.1), gate: gate, doneAction: da);
        sig = SinOsc.ar(freq * pitchratio) * input + input;
        sig = sig * Amplitude.kr(sig);
        sig = sig * env;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
    }).add;

    SynthDef(\reso,{
        arg decay=0.2, freq=40, spread=2, attack=0.01, rel=0.4, amp=0.1, pan=0, width=2, out=0,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, numresonators, freqs, amps, decays;
        numresonators = 12;
        env = EnvGen.kr(Env.perc(attack, rel, curve: -8), doneAction: 2);
        freqs = Array.fill(numresonators, {|i| Rand(i * freq, i * freq * spread)});
        amps = Array.geom(numresonators, 1, 0.9);
        decays = Array.geom(numresonators, 1, 0.9);
        sig = DynKlank.ar(
            `[freqs, amps, decays], 
            PinkNoise.ar(0.1), 
            0.5,
            decayscale: decay
        );
        sig = sig * amp * env;
        sig = sig * AmpCompA.kr(freq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\varirate_perc,{
        arg buf=0, attack=0.0, rel=10, da=2, amp=0.3, pan=0, width=2, out=0, loop=1.0,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, gain=2, ratio=3, thresh=0.5, ratefrom=1, rateto=1, ratedur=0.5, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.perc(attack, rel, curve: -8), doneAction: da);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * Line.kr(ratefrom, rateto, ratedur), startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: 500, db: -6);
        sig = BHiPass.ar(sig, freq: 40);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\varirate,{
        arg buf=0, attack=0.0, rel=10, da=2, amp=0.3, pan=0, width=2, out=0, gate=1, loop=1.0,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, gain=2, ratio=3, thresh=0.5, ratefrom=1, rateto=1, ratedur=0.5, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel, curve: -8), gate: gate, doneAction: da);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * Line.kr(ratefrom, rateto, ratedur), startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: 500, db: -6);
        sig = BHiPass.ar(sig, freq: 40);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\scrub,{
        arg buf=0, attack=0.0, rel=10, da=2, amp=0.3, pan=0, width=2, out=0, 
        gate=1, lag=0.1, lagup=0.2, lagdown=0.2,
        gain=2, ratio=3, thresh=0.5, rate=1, pos=0, grainsize=0.2, grainrate=20,
        hipassfreq=40, hishelffreq=500, hishelfdb= -6, lowpassfreq=20000,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel, curve: -8), gate: gate, doneAction: da);
        pos = Lag3.kr(pos, lag);
        amp = Lag3UD.kr(amp, lagup, lagdown);
        hipassfreq = Lag3UD.kr(hipassfreq, lagup, lagdown);
        lowpassfreq = Lag3UD.kr(lowpassfreq, lagup, lagdown);
        sig = BufGrain.ar(Impulse.kr(grainrate), grainsize, buf, rate, pos);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = BLowPass.ar(sig, freq: lowpassfreq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\cleangate,{
        arg buf=0, attack=0.0, rel=10, da=2, amp=0.3, pan=0, width=2, out=0, gate=1, lagup=0.1, lagdown=0.1, loop=1.0,
        hishelffreq=500, hishelfdb= -6, hipassfreq=40, lowpassfreq=20000,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, gain=2, ratio=3, thresh=0.5, rate=1, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel, curve: -4), gate, doneAction: da);
        amp = Lag3UD.kr(amp, lagup, lagdown);
        rate = Lag3UD.kr(rate, lagup, lagdown);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * rate, startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: Lag3UD.kr(hipassfreq, lagup, lagdown));
        sig = BLowPass.ar(sig, freq: Lag3UD.kr(lowpassfreq, lagup, lagdown));
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * Lag3UD(fx1lvl, lagup, lagdown));
        Out.ar(fx2, sig * Lag3UD(fx2lvl, lagup, lagdown));
        Out.ar(fx3, sig * Lag3UD(fx3lvl, lagup, lagdown));
        Out.ar(fx4, sig * Lag3UD(fx4lvl, lagup, lagdown));
    }).add;

    SynthDef(\cleanCirclePanGate,{
        arg buf=0, attack=0.0, rel=10, da=2, amp=0.3, panspeed=0.1, width=2, out=0, gate=1, lagup=0.1, lagdown=0.1, loop=1.0,
        hishelffreq=500, hishelfdb= -6, hipassfreq=40, lowpassfreq=20000,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, gain=2, ratio=3, thresh=0.5, rate=1, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.asr(attack, 1, rel, curve: -4), gate, doneAction: da);
        amp = Lag3UD.kr(amp, lagup, lagdown);
        rate = Lag3UD.kr(rate, lagup, lagdown);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * rate, startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: Lag3UD.kr(hipassfreq, lagup, lagdown));
        sig = BLowPass.ar(sig, freq: Lag3UD.kr(lowpassfreq, lagup, lagdown));
        sig = PanAz.ar(~numSpeakers, sig, LFSaw.kr(panspeed), width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * Lag3UD(fx1lvl, lagup, lagdown));
        Out.ar(fx2, sig * Lag3UD(fx2lvl, lagup, lagdown));
        Out.ar(fx3, sig * Lag3UD(fx3lvl, lagup, lagdown));
        Out.ar(fx4, sig * Lag3UD(fx4lvl, lagup, lagdown));
    }).add;

    SynthDef(\clean_circle_pan,{
        arg buf=0, attack=0.0, rel=10, 
        amp=0.3, panspeed=0.1, width=2, out=0, loop=1.0,
        hishelffreq=500, hishelfdb= -6, hipassfreq=40,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0,
        gain=2, ratio=3, thresh=0.5, rate=1, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.perc(attack, rel, curve: -4), doneAction: 2);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * rate, startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = PanAz.ar(~numSpeakers, sig, LFSaw.kr(panspeed), width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\clean,{
        arg buf=0, attack=0.0, rel=10, 
        amp=0.3, pan=0, width=2, out=0, loop=1.0,
        hishelffreq=500, hishelfdb= -6, hipassfreq=40,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0,
        gain=2, ratio=3, thresh=0.5, rate=1, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.perc(attack, rel, curve: -4), doneAction: 2);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * rate, startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\clean_mono,{
        arg buf=0, attack=0.0, rel=10, 
        amp=0.3, pan=0, width=2, out=0, loop=1.0,
        hishelffreq=500, hishelfdb= -6, hipassfreq=40,
        fx1lvl=0, fx1=0, fx2lvl=0, fx2=0,
        gain=2, ratio=3, thresh=0.5, rate=1, startpos=0, fx3, fx3lvl=0, fx4, fx4lvl=0;	
        var sig, env;
        env = EnvGen.kr(Env.perc(attack, rel, curve: -4), doneAction: 2);
        sig = PlayBuf.ar(1, buf, rate: BufRateScale.kr(buf) * rate, startPos: startpos, loop: loop);
        sig = Compander.ar(sig, sig, thresh: thresh, slopeAbove: 1/ratio, mul: gain);
        sig = BHiShelf.ar(sig, freq: hishelffreq, db: hishelfdb);
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = sig * amp * env;
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\klank, { arg out=0, freq=440, spread=2, decay=0.3, ring=1, 
        attack=0.8, rel=10, pan=0, width=2, 
        amp = 0.3, fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, harm, amps, env;
        harm = Array.geom(8, freq, spread);
        amps = Array.geom(8, 1, decay);
        ring = Array.fill(8, ring);
        env = EnvGen.kr(Env.perc(attack, rel, curve: -4), doneAction: 2);
        sig = Klank.ar(`[harm, amps, ring], ClipNoise.ar(0.003));
        sig = sig * env * amp;
        sig = sig * AmpCompA.kr(freq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\klang,{
        arg freq=440, attack=0.8, rel=10, amp=0.3, pan=0, width=2, out=0,
        spread=2, decay=0.3,  fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, freqs, amps;
        env = EnvGen.kr(Env.perc(attack, rel), doneAction: 2);
        freqs = Array.geom(8, freq, spread); 
        amps = Array.geom(8, 1, decay);
        sig = Klang.ar(`[freqs, amps, nil]);
        sig = sig * amp * env;
        sig = sig * AmpCompA.kr(freq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\dyn_klang, { arg out=0, freq=440, spread=2, decay=0.3, 
        attack=0.8, rel=10, gate=1, pan=0, width=2, 
        fmfreq=0.1, fmdepth=100, amfreq=0.01, amdepth=100,
        amp = 0.3, fx1lvl=0, fx1=0, fx2lvl=0, fx2=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, harm, amps, env;
        harm = Array.geom(8, freq, spread);
        amps = Array.geom(8, 1, decay);
        env = EnvGen.kr(Env.asr(attack, 1, rel, curve: -4), gate, doneAction: 2);
        sig = DynKlang.ar(`[harm + SinOsc.kr(fmfreq, mul: fmdepth), amps, nil]);
        sig = sig * SinOsc.ar(amfreq, amdepth);
        sig = sig * env * amp;
        sig = sig * AmpCompA.kr(freq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;


    SynthDef(\click, {
        arg amp=0.3, pan=0, width=2, rel=0.0001, out=0, fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        env = EnvGen.kr(Env.perc(0, 1), doneAction: 2);
        sig = EnvGen.ar(Env([0, 1, 0], [0, rel]));
        sig = sig * amp	* env;
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\bpnoise_gate, {
        arg freq=440, amp=0.3, pan=0, width=2, gate=1, lag=0.5, amfreq=1, amdepth=0, rq=1, attack=0.5, rel=3, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        freq = freq.clip(20, 20000);
        sig = BPF.ar(
            PinkNoise.ar,
            Lag3.kr(freq, lag),
            rq: rq,
            mul: Lag3.kr(amp, lag)
        );
        env = EnvGen.kr(Env.asr(attack, 1, rel, -4), gate, doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(Lag3.kr(amfreq, lag), mul: amdepth);
        sig = PanAz.ar(~numSpeakers, sig, Lag3.kr(pan, lag), width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\bpnoise, {
        arg freq=440, amp=0.3, pan=0, width=2, gate=1, lag=0.5, amfreq=1, amdepth=0, rq=1, attack=0.5, rel=3, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        freq = freq.clip(20, 20000);
        sig = BPF.ar(
            PinkNoise.ar,
            Lag3.kr(freq, lag),
            rq: rq,
            mul: Lag3.kr(amp, lag)
        );
        env = EnvGen.kr(Env.perc(attack, rel, -4), gate, doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(Lag3.kr(amfreq, lag), mul: amdepth);
        sig = PanAz.ar(~numSpeakers, sig, Lag3.kr(pan, lag), width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;


    SynthDef(\pmEnv, {
        arg freq=440, modfreq=20, pmindex=0, amp=0.3, pan=0, width=2, amfreq=1, amdepth=0.5, attack=0.5, rel=3, out=0,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, filterenv, amenv;
        sig = PMOsc.ar(freq, modfreq, pmindex); 
        env = EnvGen.kr(Env.perc(attack, rel), doneAction: 2);
        amenv = amfreq * env;
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(amenv, amdepth);
        sig = sig * amp;
        filterenv = freq * 2 * env;
        filterenv = filterenv.clip(20.0, 20000.0);
        sig = LPF.ar(sig, filterenv);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sine, {
        arg freq=440, amp=0.3, pan=0, width=2, gate=0, amfreq=1, amdepth=0.5, attack=0.5, rel=3, out=0,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        sig = SinOsc.ar(freq); 
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(amfreq, amdepth);
        sig = sig * amp;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sineDist, {
        arg freq=440, amp=0.3, pan=0, width=2, gate=0, amfreq=1, amdepth=0.5, attack=0.5, rel=3, out=0,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        sig = SinOsc.ar(freq); 
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig.tanh.distort.fold2;
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(amfreq, amdepth);
        sig = sig * amp;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sineGrainDust, {
        arg freq=440, density=10, grainsize=0.1, amp=0.3, pan=0, width=2, attack=0.5, rel=3, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig;
        trig = Dust.ar(density);
        sig = SinGrain.ar(trig, grainsize, freq); 
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq);
        sig = sig * amp;
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sineGrainDustGate, {
        arg freq=440, density=10, grainsize=0.1, amp=0.3, pan=0,
        width=2, attack=0.5, rel=3, out=0, gate=1,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig;
        trig = Dust.ar(density);
        sig = SinGrain.ar(trig, grainsize, freq); 
        env = EnvGen.kr(Env.asr(attack, amp, rel), gate: gate, doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq);
        sig = sig * amp;
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sineGrainTrainEnv, {
        arg freq0=440, freq1=440, grainfreq0=10.0, grainfreq1=2.0, grainsize0=0.1, 
        grainsize1=0.1, amp=0.3, pan0=0, pan1=0, width=2, attack=0.5, rel=3, out=0, 
        ratio=1, thresh=1, compgain=1,
        comblvl0=0.0, comblvl1=0.0, combdelay0=0.01, combdelay1=0.01, combdecay0=1.0, combdecay1=1.0,
        hipassfreq=20, hishelffreq=1000, hishelfdb= -6,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig, freq, dur, grainsize, comb, pan, comblvl, combdelay, combdecay;
        dur = attack + rel;
        pan = Line.kr(pan0, pan1, dur);
        combdecay = Line.kr(combdecay0, combdecay1, dur);
        comblvl = Line.kr(comblvl0, comblvl1, dur);
        combdelay = Line.kr(combdelay0, combdelay1, dur);
        grainsize = Line.kr(grainsize0, grainsize1, dur);
        freq = XLine.kr(freq0, freq1, dur);
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        trig = Impulse.ar(Line.kr(grainfreq0, grainfreq1, dur));
        sig = SinGrain.ar(trig, grainsize, freq); 
        sig = sig * env * AmpCompA.kr(freq) * amp;
        sig = LeakDC.ar(sig);
        comb = CombC.ar(sig, 0.2, combdelay, combdecay);
        comb = comb * comblvl;
        sig = sig * (1-comblvl);
        sig = sig + comb;
        sig = Compander.ar(sig, sig, 
            thresh: thresh, 
            slopeAbove: ratio.reciprocal,
            clampTime: attack,
            relaxTime: rel,
            mul: compgain
        );
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sineGrainTrain, {
        arg freq=440, grainfreq=10, grainsize=0.1, amp=0.3, pan=0, width=2, attack=0.5, rel=3, out=0, 
        comblvl=0.0, combdelay=0.01, combdecay=1.0,
        hipassfreq=20, hishelffreq=1000, hishelfdb= -6,
        ratio=1, thresh=1, compgain=1,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig, comb;
        trig = Impulse.ar(grainfreq);
        sig = SinGrain.ar(trig, grainsize, freq); 
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq);
        sig = sig * amp;
        sig = LeakDC.ar(sig);
        comb = CombC.ar(sig, 0.2, combdelay, combdecay);
        comb = comb * comblvl;
        sig = sig * (1-comblvl);
        sig = sig + comb;
        sig = Compander.ar(sig, sig, 
            thresh: thresh, 
            slopeAbove: ratio.reciprocal,
            clampTime: attack,
            relaxTime: rel,
            mul: compgain
        );
        sig = BHiPass.ar(sig, freq: hipassfreq);
        sig = BHiShelf.ar(sig, hishelffreq, db: hishelfdb);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\birdie, {
        arg grainsize=0.1, out, attack=0.3, release=5, freq_low=440, freq_high=2600,
        density=10, amp=0.3, pan_l= -1.0, pan_r=1.0, 
        fx1, fx1lvl=0.0, fx2, fx2lvl=0.0, fx3, fx3lvl=0.0, fx4, fx4lvl=0.0;
        var trig, freq, pan, env, sig;
        env = EnvGen.kr(Env.perc(attack, release), doneAction: 2);
        trig = Dust.ar(density);
        freq = TExpRand.ar(freq_low, freq_high, trig);
        pan = TRand.ar(pan_l, pan_r, trig);
        sig = GrainSin.ar(2, trig, grainsize, freq, pan);
        sig = sig * env * amp * AmpCompA.ar(freq);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\fmgrainDustGate, {
        arg carfreq=440, modfreq=2, density=10, grainsize=0.1, amp=0.3,
        pan=0, width=2, attack=0.5, rel=3, ctrlin=0, out=0, gate=1,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig;
        trig = Dust.ar(density);
        sig = FMGrain.ar(trig, grainsize, carfreq, modfreq); 
        env = EnvGen.kr(Env.asr(attack, amp, rel), gate: gate, doneAction: 2);
        sig = sig * env * AmpCompA.kr(carfreq);
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\fmgrain_dust, {
        arg carfreq=440, modfreq=2, density=10, grainsize=0.1, amp=0.3,
        pan=0, width=2, attack=0.5, rel=3, ctrlin=0, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig;
        trig = Dust.ar(density);
        sig = FMGrain.ar(trig, grainsize, carfreq, modfreq); 
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig * env * AmpCompA.kr(carfreq);
        sig = sig * amp;
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\fm, {
        arg carfreq=440, modfreq=440, amp=0.3, pan=0, width=2,
        attack=0.5, rel=3, modattack=0.5, modrel=0.5, moddepth=1, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, carenv, mod, modenv;
        modenv = EnvGen.kr(Env.perc(modattack, modrel, -4));
        mod = SinOsc.ar(modfreq);
        mod = mod * modenv * moddepth;
        sig = SinOsc.ar(carfreq + mod);
        carenv = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = sig * carenv * AmpCompA.kr(carfreq);
        sig = sig * amp;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\fmGate, {
        arg carfreq=440, modfreq=440, amp=0.3, pan=0, width=2, gate=1,
        attack=0.5, rel=3, modattack=0.5, modrel=0.5, moddepth=1, out=0, 
        amfreq=1, amdepth=1,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, carenv, mod, modenv, am;
        am = SinOsc.kr(amfreq) * amdepth;
        modenv = EnvGen.kr(Env.asr(modattack, 1, modrel), gate: gate);
        mod = SinOsc.ar(modfreq);
        mod = mod * modenv * moddepth;
        sig = SinOsc.ar(carfreq + mod) * am;
        carenv = EnvGen.kr(Env.asr(attack, amp, rel), gate: gate, doneAction: 2);
        sig = sig * carenv * AmpCompA.kr(carfreq);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\click_dust, {
        arg density=10, amp=0.3, pan=0, width=2, attack=0.5, rel=3, ctrlin=0, out=0, 
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, decaytime=1, delaytime=0.1, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env, trig;
        sig = Dust.ar(density);
        env = EnvGen.kr(Env.perc(attack, rel, -4), doneAction: 2);
        sig = CombC.ar(sig, 0.2, delaytime, decaytime);
        sig = sig * env;
        sig = sig * amp * AmpCompA.kr(delaytime);
        sig = LeakDC.ar(sig);
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    SynthDef(\sinegate, {
        arg freq, amp, pan=0, width=2, gate=0, lag, amfreq, amdepth, attack=0.5, rel=3, ctrlin=0, out=0,
        fx1=0, fx1lvl=0, fx2=0, fx2lvl=0, fx3, fx3lvl=0, fx4, fx4lvl=0;
        var sig, env;
        sig = SinOsc.ar(
            Lag3.kr(freq * In.kr(ctrlin), lag),
            mul: Lag3.kr(amp, lag)
        );
        env = EnvGen.kr(Env.asr(attack, 1, rel, -4), gate, doneAction: 2);
        sig = sig * env * AmpCompA.kr(freq) * SinOsc.kr(Lag3.kr(amfreq, lag), mul: amdepth);
        sig = PanAz.ar(~numSpeakers, sig, Lag3.kr(pan, lag), width: width);
        Out.ar(out, sig);
        Out.ar(fx1, sig * fx1lvl);
        Out.ar(fx2, sig * fx2lvl);
        Out.ar(fx3, sig * fx3lvl);
        Out.ar(fx4, sig * fx4lvl);
    }).add;

    // ******************** effects ********************
    SynthDef(\jpverb, {
        arg in=16, out, amp=1, attack=0.02, rel=0.1, gate=1, da=2, 
        revtime=1, damp=0, size=1, early=0.707;
        var source, sig, env;
        env = EnvGen.kr(Env.asr(attack, amp, rel), gate: gate, doneAction: da);
        source = In.ar(in, ~numSpeakers);
        source = Mix.ar(source) * env;
        sig = JPverb.ar(source, revtime, damp, size, early);
        sig = SplayAz.ar(~numSpeakers, sig, spread: 0.5, width:~numSpeakers);
        Out.ar(out, sig);
    }).add;

    SynthDef(\fbdelay, {
        arg in, out, amp=0.3, fb=0.2, gate=1, da=2, min_delay=0.4, max_delay=1.0;
        var sigs, sig, env, src, fbNode, fbNodes, n=5, delays;
        // delays = Array.series(n, 0.3, 0.2);
        delays = Array.fill(n, {|i| i.linlin(0, n, min_delay, max_delay)});
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate: gate, doneAction: da);
        src = In.ar(in, 1);
        fbNodes = {FbNode(1, 2.0)} ! n;
        sigs = n.collect {
            arg i;
            sig = src 
            + (fbNodes[i].delay(delays[i])*fb) 
            + (fbNodes[(i+1) % n].delay(delays[i])*fb) 
            + (fbNodes[(i - 1) % n].delay(delays[i])*fb);
            sig = LeakDC.ar(sig);
            fbNodes[i].write(sig);
        };
        sigs = sigs * env * amp;
        sigs = SplayAz.ar(~numSpeakers, sigs, spread: 1, width:~numSpeakers, center: 0);
        Out.ar(out, sigs);
    }).add;

    SynthDef(\grdelay, {
        arg in, out, amp=0.3, fb=0.2, gate=1, da=2, min_delay=0.4, max_delay=1.0, 
        mod_freq=0.1, mod_depth=0.0, limit=0.8,
        lo_cut=100, density=10.0, grain_size=0.1, grain_size_rand=0;
        var sigs, env, src, trig, pan, fbNode, fbNodes, n=3, delays, delaybuffer_size=4.0, mod, grain_randomizer;
        trig = Dust.kr(density);
        delays = Array.fill(n, {|i| i.linlin(0, n - 1, min_delay, max_delay)});
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate: gate, doneAction: da);
        pan = TRand.kr(-1.0, 1.0, trig);
        grain_randomizer = TRand.kr(0.0, grain_size_rand, trig);
        src = In.ar(in, ~numSpeakers);
        src = GrainIn.ar(
            ~numSpeakers, 
            trig, 
            grain_size + grain_randomizer, 
            src.sum / ~numSpeakers, 
            pan
        );
        fbNodes = {FbNode(1, delaybuffer_size)} ! n;
        sigs = n.collect {
            arg i;
            var delay = delays[i];
            var sig;
            delay = delay.clip(0.0001, delaybuffer_size);
            sig = src[i % 1] 
            + (fbNodes[i].delay(delay) * fb * 0.85) 
            + (fbNodes[(i+1) % n].delay(delay) * fb * 0.35) 
            + (fbNodes[(i - 1) % n].delay(delay) * fb * 0.35);
            sig = LeakDC.ar(sig);
            sig = HPF.ar(sig, lo_cut);
            fbNodes[i].write(sig);
        };
        sigs = sigs * env * amp;
        sigs = Limiter.ar(sigs, limit);
        sigs = SplayAz.ar(~numSpeakers, sigs, spread: 1, width:~numSpeakers, center: 0);
        Out.ar(out, sigs);
    }).add;

    SynthDef(\pitchshift, {
        arg in=18, out=0, pitch_ratio=1, gate=1, da=2, amp=1, pan=0, width=2, pitch_dispersion=0, time_dispersion=0;
        var sig, env;
        sig = In.ar(in, 1);
        sig = PitchShift.ar(sig, pitchRatio: pitch_ratio);
        env = EnvGen.kr(Env.asr(0.01, 1.0, 0.01), gate: gate, doneAction:da);
        sig = sig * amp * env;
        sig = PanAz.ar(~numSpeakers, sig, pan, width: width);
        Out.ar(out, sig);
    }).add;
)


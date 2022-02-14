TriOsc t => dac;

fun void setOsc(Osc osc, int note, float vol) {
    if (note == -1) {
        0 => osc.gain;
        <<< "note =", "rest (zzz...)" >>>;
    }
    else {
        Std.mtof(note) => osc.freq;
        vol => osc.gain;
        <<< "note =", note, "volume =", vol >>>;
    }
}
// volume
0.6 => float VOLUME;

// tempo
0.3::second => dur BEAT;
BEAT => dur SN; // sixteenth (1/16)
BEAT * 2 => dur EN; // eighth (1/8)

// For Elise by Beethoven
[
76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
60, 64, 69, 71, -1, 64, 68, 71, 72, -1, 64,
76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
60, 64, 69, 71, -1, 64, 72, 71, 69, -1
] @=> int MELODY[];

[
SN, SN, SN, SN, SN, SN, SN, SN, EN, SN,
SN, SN, SN, EN, SN, SN, SN, SN, EN, SN, SN,
SN, SN, SN, SN, SN, SN, SN, SN, EN, SN,
SN, SN, SN, EN, SN, SN, SN, SN, EN, EN
] @=> dur DURS[];

// play
for (1 => int cnt; cnt <= 2; cnt++){
    for (0 => int i; i < MELODY.size(); i++) {
        setOsc(t, MELODY[i], VOLUME);
        DURS[i] => now;
    }
}

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
0.5 => float VOLUME;

// tempo
0.25::second => dur BEAT; // basic duration
BEAT / 5 => dur REST; // duration of no sound after each note
BEAT => dur QN; // quarter (1/4) note sound
BEAT * 2 => dur HN; // half (1/2) note sound
BEAT / 2 => dur EN; // eighth (1/8) note sound

// Harold Faltermeyer's Theme from the film Beverly Hills Cop (1984)
[
65, -1, 68, -1, 65, 65, 70, 65, 63,
65, -1, 72, -1, 65, 65, 73, 72, 68,
65, 72, 77, 65, 63, 63, 60, 67, 65] @=> int MELODY[];

[
QN, QN, QN, EN, QN, EN, QN, QN, QN,
QN, QN, QN, EN, QN, EN, QN, QN, QN,
QN, QN, QN, EN, QN, EN, QN, QN, HN] @=> dur DURS[];

// play
for (0 => int i; i < MELODY.size(); i++) {
    setOsc(t, MELODY[i], VOLUME);
    if (i < MELODY.size() - 1 && MELODY[i] == MELODY[i+1]){
        DURS[i] - REST => now;
        0 => t.gain;
        REST => now;
        <<< "same note rest (zzz...)", "" >>>;
    }
    else
        DURS[i] => now;
}

// MIDI
36 => int C2;  48 => int C3;  60 => int C4;  72 => int C5;  84 => int C6;
37 => int Cs2; 49 => int Cs3; 61 => int Cs4; 73 => int Cs5; 85 => int Cs6;
37 => int Db2; 49 => int Db3; 61 => int Db4; 73 => int Db5; 85 => int Db6;
38 => int D2;  50 => int D3;  62 => int D4;  74 => int D5;  86 => int D6;
39 => int Ds2; 51 => int Ds3; 63 => int Ds4; 75 => int Ds5; 87 => int Ds6;
39 => int Eb2; 51 => int Eb3; 63 => int Eb4; 75 => int Eb5; 87 => int Eb6;
40 => int E2;  52 => int E3;  64 => int E4;  76 => int E5;  88 => int E6;
41 => int F2;  53 => int F3;  65 => int F4;  77 => int F5;  89 => int F6;
42 => int Fs2; 54 => int Fs3; 66 => int Fs4; 78 => int Fs5; 90 => int Fs6;
42 => int Gb2; 54 => int Gb3; 66 => int Gb4; 78 => int Gb5; 90 => int Gb6;
43 => int G2;  55 => int G3;  67 => int G4;  79 => int G5;  91 => int G6;
44 => int Gs2; 56 => int Gs3; 68 => int Gs4; 80 => int Gs5; 92 => int Gs6;
44 => int Ab2; 56 => int Ab3; 68 => int Ab4; 80 => int Ab5; 92 => int Ab6;
45 => int A2;  57 => int A3;  69 => int A4;  81 => int A5;  93 => int A6;
46 => int As2; 58 => int As3; 70 => int As4; 82 => int As5; 94 => int As6;
46 => int Bb2; 58 => int Bb3; 70 => int Bb4; 82 => int Bb5; 94 => int Bb6;
47 => int B2;  59 => int B3;  71 => int B4;  83 => int B5;  95 => int B6;
-1 => int REST;


fun void playNote(StkInstrument instrument, int note, dur duration) {
    Std.mtof(note) => instrument.freq;
    if (note != -1){
        1 => instrument.noteOn;
    }
    duration => now;
    1 => instrument.noteOff;
}
    
fun void play(StkInstrument instrument, int notes[], dur durs[]) {
    for (0 => int i; i<notes.size(); i++){
        playNote(instrument, notes[i], durs[i]);
    }
}


// Tempo
0.4::second => dur BEAT;
BEAT => dur QN;
QN / 2 => dur EN;
BEAT * 2 => dur HN;
BEAT * 6 => dur WN;
[
F4,G4,A4,F4, F4,G4,A4,F4, A4,Bb4,C5, A4,Bb4,C5,
C5,D5,C5,Bb4,A4,F4, C5,D5,C5,Bb4,A4,F4, F4,C4,F4, F4,C4,F4
] @=> int MELODY[];

[
F4,G4,A4,F4, F4,G4,A4,F4, A4,Bb4,C5, A4,Bb4,C5,
C5,D5,C5,Bb4,A4,F4, C5,D5,C5,Bb4,A4,F4, A4,E4,A4, A4,E4,A4
] @=> int MELODY_HIGH[];

[
QN,QN,QN,QN, QN,QN,QN,QN, QN,QN,HN, QN,QN,HN,
EN,EN,EN,EN,QN,QN, EN,EN,EN,EN,QN,QN, QN,QN,HN, QN,QN,HN
] @=> dur DURS[];

[
F3,C4,F3, F3,C4,F3, F3,C4,F3, F3,C4,F3,
F3,C4,F3, F3,C4,F3, F3,C4,F3, F3,C4,F3
] @=> int BASS[];

[
QN,QN,HN, QN,QN,HN, QN,QN,HN, QN,QN,HN,
QN,QN,HN, QN,QN,HN, QN,QN,HN, QN,QN,HN
]
@=> dur DURS_BASS[];

// Set up instrument and play
Rhodey piano[3];
piano[0] => dac.left;
piano[1] => dac.right;
piano[2] => dac;

spork ~ play(piano[0], MELODY, DURS);
spork ~ play(piano[1], MELODY_HIGH, DURS);
spork ~ play(piano[2], BASS, DURS_BASS);
BEAT * 32 => now;
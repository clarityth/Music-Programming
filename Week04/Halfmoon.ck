SinOsc s=> dac;
TriOsc t => dac;

fun void setOsc(Osc osc, int note, float vol){
    if (note == -1){
        0 => osc.gain;
        <<< "note=", "rest (zzz...)" >>>;
    }
    else{
        Std.mtof(note) => osc.freq;
        vol => osc.gain;
        <<< "note =", note, "volume=", vol >>>;
    }
}

//MIDI
36 => int C2; 48 => int C3; 60 => int C4; 72 => int C5; 84 => int C6;
38 => int D2; 50 => int D3; 62 => int D4; 74 => int D5; 86 => int D6;
40 => int E2; 52 => int E3; 64 => int E4; 76 => int E5; 88 => int E6;
41 => int F2; 53 => int F3; 65 => int F4; 77 => int F5; 89 => int F6;
43 => int G2; 55 => int G3; 67 => int G4; 79 => int G5; 91 => int G6;
45 => int A2; 57 => int A3; 69 => int A4; 81 => int A5; 93 => int A6;
47 => int B2; 59 => int B3; 71 => int B4; 83 => int B5; 95 => int B6;

//note length
0.6::second => dur beat;
beat / 6 => dur REST;
beat => dur QN; // quarter note
beat / 2 => dur EN; // eight note
beat * (3.0/2) => dur DQN; // dotted quarter note

//melody
[
G4,A4,G4,E4, G4,E4,C4,G3,
A3,C4,D4,G4, E4,E4,-1,
G4,A4,G4,E4, G4,E4,C4,G3,
A3,C4,G3,D4, C4,C4,-1,
E4,E4,E4,D4, E4,A4,G4,
E4,D4,E4,A4, G4,G4,-1,
C5,G4,G4, E4,E4,A4,A4, 
G4,E4,C4,G3,D4, C4,C4,-1
]@=> int MELODY[];

//bass
[
G3,A3,G3,E3, G3,E3,C3,G2,
A2,C3,D3,G3, E3,E3,-1,
G3,A3,G3,E3, G3,E3,C3,G2,
A2,C3,G2,D3, C3,C3,-1,
E3,E3,E3,D3, E3,A3,G3,
E3,D3,E3,A3, G3,G3,-1,
C4,G3,G3, E3,E3,A3,A3,
G3,E3,C3,G2,D3, C3,C3,-1
]@=> int BASS[];

//tempo
[
QN,EN,QN,EN, EN,EN,EN,DQN,
QN,EN,QN,EN, DQN,QN,EN,
QN,EN,QN,EN, EN,EN,EN,DQN,
QN,EN,QN,EN, DQN,QN,EN,
QN,EN,QN,EN, QN,EN,DQN,
QN,EN,QN,EN, DQN,QN,EN,
DQN,QN,EN, QN,EN,QN,EN,
EN,EN,EN,QN,EN, DQN,QN,EN
]@=> dur DURS[];

//slur
[
0,0,0,0, 1,0,0,0, 
0,0,0,0, 1,0,0,
0,0,0,0, 1,0,0,0,
0,0,0,0, 1,0,0,
0,0,0,0, 0,0,0,
0,0,0,0, 1,0,0,
0,0,0, 0,0,0,0,
1,0,0,0,0, 1,0,0
]@=> int SLUR[];

//play
for (0 => int i; i<MELODY.size(); i++){
    setOsc(s, MELODY[i], 0.6);
    setOsc(t, BASS[i], 0.1);
    if(SLUR[i] != 1){
        DURS[i] - REST => now;
        0 => s.gain => t.gain;
        REST => now;
    }
    else 
        DURS[i] => now;
}
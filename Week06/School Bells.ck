// School Bells
// note length
0.5::second => dur BEAT;
BEAT / 4 => dur REST;
BEAT - REST => dur QN; // quarter note
BEAT * 2 - REST => dur HN; // half note
BEAT * 3 - REST => dur DHN; // dotted half note

[ // melody
67,67,69,69, 67,67,64,
67,67,64,64, 62,-1,
67,67,69,69, 67,67,64, 
67,64,62,64, 60,-1
] @=> int MELODY[];
MELODY.cap() - 1 => int numNotes;

[ // bassline
48,48,41,41, 48,48,48, 
48,48,45,45, 43,-1,
48,48,41,41, 48,48,48,  
48,48,43,47, 48,-1 
] @=> int BASSLINE[];

[ // tempo
QN,QN,QN,QN, QN,QN,HN, 
QN,QN,QN,QN, DHN,QN,
QN,QN,QN,QN, QN,QN,HN, 
QN,QN,QN,QN, DHN,QN
] @=> dur DURS[];

// play
// Musical fun with a resonant filter and three delay lines
Impulse imp => ResonZ melody => Gain input => dac;
100 => melody.Q;
100 => melody.gain;
1.0 => input.gain;

Delay del[3];
input => del[0] => dac.left;
input => del[1] => dac;
input => del[2] => dac.right;

for (0 => int i; i < 3; i++) {
    del[i] => del[i];
    0.6 => del[i].gain;
    (0.8 + i*0.3)::second => del[i].max => del[i].delay;
}

for (0 => int n; n < 2; n++)
    for (0 => int i; i < MELODY.size(); i++) {
        if (MELODY[i] == -1) {
            0 => input.gain;
        }
        else {
            Std.mtof(MELODY[i]) => melody.freq;
            1.0 => input.gain;
            1.0 => imp.next;
        }
        DURS[i] => now;
        0 => input.gain;
        REST => now;
    }
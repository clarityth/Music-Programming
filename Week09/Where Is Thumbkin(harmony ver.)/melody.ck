BPM t;
t.QN => dur QN;
t.HN => dur HN;
t.EN => dur EN;
Play p;

[
"F4","G4","A4","F4", "F4","G4","A4","F4", 
"A4","Bb4","C5", "A4","Bb4","C5",
"C5","D5","C5","Bb4","A4","F4", "C5","D5","C5","Bb4","A4","F4", 
"F4","C4","F4", "F4","C4","F4"
] @=> string MELODY[];

[
"F4","G4","A4","F4", "F4","G4","A4","F4", 
"A4","Bb4","C5", "A4","Bb4","C5",
"C5","D5","C5","Bb4","A4","F4", "C5","D5","C5","Bb4","A4","F4", 
"A4","E4","A4", "A4","E4","A4"
] @=> string MELODY_HIGH[];

[
QN,QN,QN,QN, QN,QN,QN,QN, 
QN,QN,HN, QN,QN,HN,
EN,EN,EN,EN,QN,QN, EN,EN,EN,EN,QN,QN, 
QN,QN,HN, QN,QN,HN
] @=> dur DURS[];

Rhodey piano[2];
piano[0] => dac.left;
piano[1] => dac.right;
spork ~ p.play(piano[0], MELODY, DURS);
spork ~ p.play(piano[1], MELODY_HIGH, DURS);
t.QN * 32 => now;

BPM t;
t.QN => dur QN;
t.HN => dur HN;
t.EN => dur EN;
Play p;

[
"F3","C4","F3", "F3","C4","F3", "F3","C4","F3", "F3","C4","F3",
"F3","C4","F3", "F3","C4","F3", "F3","C4","F3", "F3","C4","F3"
] @=> string BASS[];

[
QN,QN,HN, QN,QN,HN, QN,QN,HN, QN,QN,HN,
QN,QN,HN, QN,QN,HN, QN,QN,HN, QN,QN,HN
]
@=> dur DURS_BASS[];

Rhodey piano => dac;
p.play(piano, BASS, DURS_BASS);
t.QN * 32 => now;

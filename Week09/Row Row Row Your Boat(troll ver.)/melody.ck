BPM t;
Play p;
t.SN => dur SN;
t.TN => dur TN;
t.HN => dur HN;
t.WN => dur WN;

[
"C4","C4", "C4","D4","E4", "E4","D4","E4","F4", "G4",
"C5","C5","C5","G4","G4","G4", "E4","E4","E4","C4","C4","C4", "G4","F4","E4","D4", "C4"
] @=> string MELODY[];

[
HN,HN, TN,SN,HN, TN,SN,TN,SN, WN,
SN,SN,SN,SN,SN,SN, SN,SN,SN,SN,SN,SN, TN,SN,TN,SN, WN
] @=> dur DURS[];

Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac.right;
piano[2] => dac.left;
piano[3] => dac.right;
spork ~ p.play(piano[0],MELODY,DURS);
WN * 2 => now;
spork ~ p.play(piano[1],MELODY,DURS);
WN * 2 => now;
spork ~ p.play(piano[2],MELODY,DURS);
WN * 2 => now;
spork ~ p.play(piano[3],MELODY,DURS);
WN * 8 => now;
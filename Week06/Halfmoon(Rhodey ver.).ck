Rhodey epiano => dac;
Rhodey code[4];
code[0] => dac;
code[1] => dac;
code[2] => dac;
code[3] => dac;

// tempo
0.7::second => dur BEAT;
BEAT / 20 => dur REST;
BEAT - REST => dur TN; // third note
BEAT * 1.5 - REST => dur TSN; // three-sixth note
BEAT * 2.5 - REST => dur FSN; // five-sixth note
BEAT / 2 - REST => dur SN; // sixth note

// melody for half moon
[
67,69, 67,64, 67,64,60, 55, 
57,60, 62,67, 64, -1,
67,69, 67,64, 67,64,60, 55, 
57,60, 55,62, 60, -1,
64,64, 64,62, 64,69, 67,
64,62, 64,69, 67, -1,
72, 67,67, 64,64, 69,69,
67,64,60, 55,62, 60, -1
] @=> int MELODY[];

// codes for half moon
[48,52,55,60] @=> int C[];
[41,45,48,53] @=> int F[];
[43,47,50,55] @=> int G[];
[45,48,52,57] @=> int Am[];
[0] @=> int SKIP[];

[
C,SKIP, C,SKIP, C,SKIP,SKIP, C, 
F,SKIP, G,SKIP, C, SKIP,
C,SKIP, C,SKIP, C,SKIP,SKIP, C, 
F,SKIP, G,SKIP, C, SKIP,
C,SKIP, C,SKIP, Am,SKIP, G,
C,SKIP, C,SKIP, G, SKIP,
C, C,SKIP, C,SKIP, F,SKIP,
C,SKIP,SKIP, G,SKIP, C, SKIP
] @=> int CODES[][];

// tempos for half moon
[
TN,SN, TN,SN, SN,SN,SN, TSN, 
TN,SN, TN,SN, FSN, SN,
TN,SN, TN,SN, SN,SN,SN, TSN, 
TN,SN, TN,SN, FSN, SN,
TN,SN, TN,SN, TN,SN, TSN,
TN,SN, TN,SN, FSN,  SN,
TSN, TN,SN, TN,SN, TN,SN,
SN,SN,SN, TN,SN, FSN, SN
] @=> dur DURS[];


for(0 => int n; n<2; n++){
    for(0 => int i; i<MELODY.size(); i++){ 
        if (MELODY[i] == -1)
            1 => epiano.noteOff;
        else {
            Std.mtof(MELODY[i]) => epiano.freq;
            1 => epiano.noteOn;
            if (CODES[i][0] == 0){
                1 => code[0].noteOff;
                1 => code[1].noteOff;
                1 => code[2].noteOff;
                1 => code[3].noteOff;
            }
            else{
                Std.mtof(CODES[i][0]) => code[0].freq;
                Std.mtof(CODES[i][1]) => code[1].freq;
                Std.mtof(CODES[i][2]) => code[2].freq;
                Std.mtof(CODES[i][3]) => code[3].freq;
                0.3 => code[0].noteOn;
                0.3 => code[1].noteOn;
                0.3 => code[2].noteOn;
                0.3 => code[3].noteOn;
            }
        DURS[i] => now;
        1 => epiano.noteOff;
        1 => code[0].noteOff;
        1 => code[1].noteOff;
        1 => code[2].noteOff;
        1 => code[3].noteOff;
        REST => now;
        }
    }
}

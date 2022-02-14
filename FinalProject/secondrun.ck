public class secondrun {
    BPM t;
    t.tempo(160);
    t.QN => dur QN;
    t.DQN => dur DQN;
    t.DHN => dur DHN;
    t.DEN => dur DEN;
    t.HN => dur HN;
    t.WN => dur WN;
    t.SN => dur SN;
    t.EN => dur EN;
        
    ["A5", "G4", "E4", "A4", "A5", "B5"] @=> string left1[];
    ["A5", "D5", "D4", "A5", "A4"] @=> string left2[];
    ["A5", "A5", "A4", "A5", "C#5", "C#5", "D6", "C#6", "A5"] @=> string left3[];
    ["F#5", "F#5", "D5", "C#5", "D5", "F#4", "A4", "D5"] @=> string left4[];
    ["A5", "A5", "A4", "A5", "D5", "C#5", "A5", "A5", "B5"] @=> string left5[];
    ["A5", "C#4", "D4", "A4", "D4", "E4", "D4", "D4", "B4", "A4"] @=> string left6[];
    ["B4", "F#5", "F#5", "E5", "B4", "G4", "G4", "D5"] @=> string left7[];
    ["C#5", "B4", "C#5", "F#4", "E4"] @=> string left8[];
    ["D4", "A3", "D5", "C#5", "D5", "E5", "A4"] @=> string left9[];
    ["F#5", "G5", "F#5", "F#5", "E5", "D5", "D5", "E4", "E4"] @=> string left10[];
    
    
    [HN, QN, QN, QN, SN, SN] @=> dur left1_durs[];
    [HN, QN, QN, EN, EN] @=> dur left2_durs[];
    [QN, SN, SN, EN, QN, SN, SN, SN, SN] @=> dur left3_durs[];
    [QN, SN, SN, EN, DEN, SN, EN, SN] @=> dur left4_durs[];
    [QN, SN, SN, SN, SN, QN, EN, SN, SN] @=> dur left5_durs[];
    [DHN, SN, SN, DEN, DEN, DEN, SN, SN, SN, SN] @=> dur left6_durs[];
    [DEN, SN, EN, SN, SN, QN, DEN, SN] @=> dur left7_durs[];
    [DEN, SN, HN, EN, EN] @=> dur left8_durs[];
    [QN, QN, SN, SN, SN, DQN, EN] @=> dur left9_durs[];
    [EN, SN, SN, SN, EN, SN, HN, QN, HN] @=> dur left10_durs[];
    
    
    ["G2", "D3", "A3", "B3", "D3", "A3", "B3", "A2", "E3", "A3", "B3", "E3", "A3"] @=> string right1[];
    ["B2", "F#3", "B3", "F#4", "F#3", "B3", "C#4", "B2", "F#3", "A3", "B3", "F#3", "A3", "B3", "F#3"] @=> string right2[];
    ["G2", "D3", "G3", "A3", "D4", "D3", "A2", "E3", "C#4", "D4", "E4"] @=> string right3[];
    ["B2", "F#3", "B3", "C#4", "D4", "F#3", "B2", "F#3", "B3", "F#3", "B3"] @=> string right4[];
    ["G2", "D3", "A3", "B3", "A2", "E3", "A3", "C#4", "E4", "C#4"] @=> string right5[];
    ["B2", "F#3", "B3", "R", "F#3", "A3", "F#2", "F#3", "F#4"] @=> string right6[];
    ["G2", "D3", "G3", "A3", "B3", "A2", "E3", "C#4", "D4", "E4", "G4", "F#4"] @=> string right7[];
    ["B2", "F#3", "B3"] @=> string right8[];
    ["G2", "D3", "G3", "B3", "D4", "D3", "G3", "B3", "A2", "E3", "A3", "D4", "E4", "C#4", "C#4"] @=> string right9[];
    ["B2", "F#3", "B3", "E4", "F#4", "D4", "E4", "B2", "F#3", "B3", "E4", "F#4", "A2", "D3", "A3", "D4"] @=> string right10[];

    [SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN] @=> dur right1_durs[];
    [SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN] @=> dur right2_durs[];
    [SN, SN, SN, SN, DEN, SN, SN, SN, SN, SN, SN] @=> dur right3_durs[];
    [SN, SN, SN, SN, DEN, SN, SN, SN, SN, SN, DEN] @=> dur right4_durs[];
    [SN, SN, SN, SN, QN, SN, SN, SN, SN, SN, DEN] @=> dur right5_durs[];
    [SN, SN, SN, SN, SN, SN, QN, QN, DQN] @=> dur right6_durs[];
    [SN, SN, SN, SN, QN, SN, SN, SN, SN, SN, SN, EN] @=> dur right7_durs[];
    [EN, EN, HN] @=> dur right8_durs[];
    [SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, EN, SN] @=> dur right9_durs[];
    [SN, SN, SN, SN, EN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN, SN] @=> dur right10_durs[];
}
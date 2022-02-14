public class viola {    
    BPM t;
    t.tempo(140);
    t.QN => dur QN;
    t.DQN => dur DQN;
    t.DHN => dur DHN;
    t.HN => dur HN;
    t.WN => dur WN;
    t.EN => dur EN;
    
    [
    "R", "R", "R", "R", "R", "R",
    "R", "R", "R", "R",
    "B5", "A5", "D6", "B5", "F#6", "G6",
    "F#6", "D6", "B5", "A5", "G5",
    "B5", "A5", "D6", "B5", "A5", "G5",
    "F#5", "G5", "A5", "D5", "D5",
    "E5", "E5", "B5",
    "G5", "F#5", 
    "R", "R", "R", "R", "R", "R", "R", 
    "R",
    "R", "R", "R", "R", "R", "R",
    "R", "R", "R", "R", "R",
    "B4", "A4", "D5", "B4", "F#5", "G5",
    "F#5", "D5", "B4", "A4", "G4",
    "B4", "A4", "D5", "B4", "A4", "D5",
    "F#4", "G4", "F#4", "D4", "F#3",
    "E4", "B4", "G4", "F#4",
    "F#4", "D4",
    "R", "R", "R", "R", "R",
    "R", "R", "R", "R", "R", "R",
    "R", "R", "R", "R", "R",
    "R", "R", "R",
    "E4", "B4", "F#4", "D5", "C5",
    "B4", "F#5", "G5", "F#5", "D5", "B4",
    "E4", "G4", "A4", 
    "B4", "B4", "C#5", "D#5", 
    "E5", "B5", "A5", "E5", "B5", "A5",
    "F#5", "G5", "F#5", "D5", "F#4",
    "E5", "B5", "A5", "D#6", "B5", "A5",
    "A5", "G5", "A5", "B5", "F#5",
    "E5", "B5", "A5", "E5", "B5", "A5",
    "F#5", "G5", "F#5", "D5", "F#5", 
    "R", "R", "R", "R", 
    "R", "R", "R", "R",
    "E4", "B4", "G4", "A4", "B4",
    "F#4", "D4", "A3", "F#4",
    "C4", "E4", "G4", "A4",
    "B4", "E4", "D#4", "F4", "G4",
    "A3", "A3", "A3", "F#3", "A3",
    "F#3", "G#3"
    ] @=> string notes[];
    
    
    [
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, QN, HN,
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, QN, QN, QN,
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, QN, DQN, QN,
    QN, QN, QN*2,
    HN, HN, HN, 
    QN, QN, QN, QN, QN, QN, QN,
    WN,
    DQN, QN*2, DQN, QN*2, QN,
    DQN, QN*2, QN, QN, QN,
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, QN, QN, QN,
    DQN, QN*2, QN, DQN, QN*2, QN,
    DQN, QN*2, QN, QN, QN,
    QN, QN, QN, QN,
    HN, HN,
    DQN, QN*2, QN, QN, QN*2,
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, DQN, QN*2, QN,
    DHN, QN, QN,
    DQN, QN*2, DQN, QN*2, QN,
    QN, QN, QN, DQN, QN*2, QN,
    HN, QN, QN,
    QN, QN, QN, QN,
    DQN, QN*2, QN, DQN, QN*2, QN,
    DQN, QN*2, QN, QN, QN,
    DQN, QN*2, QN, QN, QN, QN,
    DQN, QN*2, QN, QN, QN,
    DQN, QN*2, QN, DQN, QN*2, QN,
    DQN, QN*2, QN, QN, QN,
    QN, QN, QN, QN,
    DQN, QN*2, QN, HN,
    QN, QN, QN, QN, QN,
    DQN, QN*2, QN, HN,
    HN+QN, QN, QN, QN,
    EN, QN, QN, QN, QN,
    DQN, QN*2, QN*2, QN, QN,
    QN, WN
    ]@=> dur durs[];
}
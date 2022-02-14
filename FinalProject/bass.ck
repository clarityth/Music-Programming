public class bass {
    BPM t;
    t.tempo(140);
    t.QN => dur QN;
    t.DQN => dur DQN;
    t.DHN => dur DHN;
    t.HN => dur HN;
    t.WN => dur WN;
    t.EN => dur EN;
    

    [
    "A4", "D4",
    "E4", "D4",
    "C4", "B3",
    "E4", "B4", "D4", "G3",
    "C4", "D4", 
    "E4", "D4",
    "C4", "B4",
    "A3", "B3", 
    "E4", "B4", "E4",   
    
    "A4", "E5", "D5", "A5",
    "E4", "B5", "D4", "D5",
    "C4", "B5", "B4", "D5",
    "E5", "B5", "D5", "B4",
    "C5", "G5", "D5", "A5",
    "E4", "B5", "D4", "D5",
    "C5", "C6", "B4",
    "E4", "B4", "F#5", "A5",

    "C4", "G4", "C5", "D4", "A4", "D5",
    "E4", "B4", "E5", "F#5", "G5", 
    "C4", "G4", "C5", "D4", "A4", "D5",
    "G4", "D5", "A5", "D5", "B5",
    "C4", "G4", "C5", "D4", "A4", "D5",
    "E4", "B4", "E5", "D4", "B4", "D5",
    "C4", "G4", "C5", "B4", "A4",
    "B3", "B3", "B3", "B3", "B3", "B3",
    "A3", "A4", "E5", "A5", "D4", "A4", "F#5",
    "E4", "B4", "G5", "D4", "B4", "D5",
    "C4", "G4", "C5", "B3", "C#4", "D#4",
    "E4", "B4", "E5", "D4", "B4", "D5",
    "C4", "G4", "E5", "D4", "A4", "F#5",
    "E4", "B4", "G5", "D4", "B4", "D5",
    "C4", "G4", "C5", "B4",
    "E4", "B4", "E5", "F#5", "G5",
    "A4", "B4",
    "E4", "B4", "E5", "B4", "E3",
    "A4", 
    
    "A4", "E5", "D5", "A5",
    "E4", "B5", "D4", "D5",
    "C4", "B5", "B4", "D5",
    "E5", "B5", "D5", "B4",
    "C5", "G5", "D5", "A5",
    "E4", "B5", "D4", "D5",
    "C5", "C6", "B4",
    "E4", "B4", "F#5", "A5",
    
    "C4", "G4", "C5", "D4", "A4", "D5",
    "E4", "B4", "E5", "F#5", "G5", 
    "C4", "G4", "C5", "D4", "A4", "D5",
    "G4", "D5", "A5", "D5", "B5",
    
    "B3",
    "E4", "B4", "E5", "E4", "B4", "E5",
    "E3"
    ] @=> string notes[];


    [
    HN, HN,
    HN, HN,
    HN, HN,
    DQN, QN*2, QN, QN,
    HN, HN,
    HN, HN,
    QN, DHN,
    HN, HN,
    QN, QN, QN*2,

    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, HN,
    QN, QN, QN, QN*2,
    
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, HN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, HN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN, 
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN, 
    QN, QN, QN, HN,
    QN, QN, QN, QN, HN,
    HN, HN,
    QN, QN, QN, QN, HN,
    WN,
    
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, QN, QN,
    QN, QN, HN,
    QN, QN, QN, QN*2,
    
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, HN,
    QN, QN, QN, QN, QN, QN,
    QN, QN, QN, QN, QN, QN,

    WN,
    QN, QN, QN, QN, QN, QN,
    WN
    ]@=> dur durs[];
}
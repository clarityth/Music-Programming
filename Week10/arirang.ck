[
"B3","E4","B3","E4","E4",       "B3","E4","B3","E4","E4",
"E4","E4","E4","F#4","F#4",     "E4","E4","B4","G4","B4",
"B3","B3","E4","E4",            "E4","E4","F#4",
"E4","G4","B4","G4","F#4","B3", "E4","E4",
"G4","G4",                      "G4","G4","B4","F#4",
"E4","G4","B4","F#4",           "E4","B3",
"E4","E4","E4","F#4",           "B4","G4","G4","F#4","E4",
"E4","G4","F#4","E4","B3",      "E4","E4"
] @=> string notes[];

[
2.0,1.0,2.0,1.0,3.0,     2.0,1.0,2.0,1.0,3.0,
1.0,2.0,1.0,2.0,3.0,     3.0,2.0,1.0,1.0,2.0,
3.0,2.0,1.0,3.0,         3.0,3.0,3.0,
2.0,1.0,2.0,0.5,0.5,3.0, 3.0,6.0,
3.0,6.0,                 3.0,2.0,1.0,3.0,
3.0,2.0,1.0,3.0,         3.0,6.0,
1.0,2.0,3.0,3.0,         1.0,2.0,1.0,2.0,3.0,
2.0,1.0,2.0,1.0,3.0,     3.0,6.0
] @=> float durs[];

StifKarp s => dac;
for (0 => int i; i < notes.size(); i++) {
    Std.mtof(midi(notes[i])) => s.freq;
    0.5 => s.noteOn;
    durs[i]::second / 5 => now;
}

fun int midi(string name) {
    [21,23,12,14,16,17,19] @=> int notes[]; // A0,B0,C0,D0,E0,F0,G0
    name.charAt(0) - 65 => int base; // A=0,B=1,C=2,D=3,E=4,F=5,G=7
    notes[base] => int note;
    if (0 <= base && base <= 6) {
        if (name.charAt(1) == '#' || name.charAt(1) == 's') // sharp
            notes[base] + 1 => note;
        if (name.charAt(1) == 'b' || name.charAt(1) == 'f') // flat
            notes[base] - 1 => note;
    }
    else {
        <<< "Illegal Note Name!" >>>;
        return 0;
    }
    name.charAt(name.length()-1) - 48 => int oct; // 0, 1, 2, ..., 9
    if (0 <= oct && oct <= 9) {
        12 * oct +=> note;
        return note;
    }
    else {
        <<< "Illegal Octave!" >>>;
        return 0;
    }
}
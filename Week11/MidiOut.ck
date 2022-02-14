// please run MidiInSifKarp, MidiInflut, MidiInbuk first
MidiOut mout;
MidiMsg msg;
1 => int port;
if (!mout.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}
["B3","B3","E4","E4"] @=> string notes1[];
["B3","E4","B3","E4","E4"] @=> string notes2[];
["B4","G4","G4","F#4","E4"] @=> string notes3[];
["G4","G4"] @=> string notes4[];
[3.0,2.0,1.0,3.0] @=> float durs1[];
[2.0,1.0,2.0,1.0,3.0] @=> float durs2[];
[1.0,2.0,1.0,2.0,3.0] @=> float durs3[];
[3.0,6.0] @=> float durs4[];

while (true) {
    Math.random2(1,4) => int dice;
    Math.random2(80,127) => int velocity;
    if (dice == 1){
        for (0 => int i; i < notes1.size(); i++){
            sendOutMIDInote(1, midi(notes1[i]), velocity);
            durs1[i]::second / 4.5 => now;
            sendOutMIDInote(0, midi(notes1[i]), velocity);
        }
    }
    else if (dice == 2){
        for (0 => int i; i < notes2.size(); i++){
            sendOutMIDInote(1, midi(notes2[i]), velocity);
            durs2[i]::second / 4.5 => now;
            sendOutMIDInote(0, midi(notes2[i]), velocity);
        }
    }
    else if (dice == 3){
        for (0 => int i; i < notes3.size(); i++){
            sendOutMIDInote(1, midi(notes3[i]), velocity);
            durs3[i]::second / 4.5 => now;
            sendOutMIDInote(0, midi(notes3[i]), velocity);
        }
    }
    else {
        for (0 => int i; i < notes4.size(); i++){
            sendOutMIDInote(1, midi(notes4[i]), velocity);
            durs4[i]::second / 4.5 => now;
            sendOutMIDInote(0, midi(notes4[i]), velocity);
        }
    }
}


fun void sendOutMIDInote(int on, int note, int velocity) {
    if (on == 0) 128 => msg.data1; // 10000000 NoteOff
    else 144 => msg.data1; // 10010000 NoteOn
    note => msg.data2;
    velocity => msg.data3;
    <<< msg.data1, msg.data2, msg.data3 >>>;
    mout.send(msg);
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
// please run MidiInStifKarp, MidiInflut, MidiInbuk first
OscOut oout;
1979 => int port;
oout.dest("localhost", port);

["B3","B3","E4","E4"] @=> string notes1[];
["B3","E4","B3","E4","E4"] @=> string notes2[];
["B4","G4","G4","F#4","E4"] @=> string notes3[];
["G4","G4"] @=> string notes4[];
[3.0,2.0,1.0,3.0] @=> float durs1[];
[2.0,1.0,2.0,1.0,3.0] @=> float durs2[];
[1.0,2.0,1.0,2.0,3.0] @=> float durs3[];
[3.0,6.0] @=> float durs4[];
[1.0,2.0,1.0,3.0,2.0] @=> float durs5[];
[3.0,2.0,1.0,1.0,2.0] @=> float durs6[];
[6.0,3.0] @=> float durs7[];

int note;
while (true) {
    Math.random2(1,6) => int dice;
    Math.random2f(0.5,1.0) => float velocity;
    if (dice == 1){
        for (0 => int i; i < notes1.size(); i++){
            oout.start("/chuckie/osctest");    
            midi(notes1[i]) => note;
            "1" => string message;
            note => oout.add;
            velocity => oout.add;
            message => oout.add;
            oout.send();
            durs1[i]::second / 4.5 => now;
        }
    }
    else if (dice == 2){
        for (0 => int i; i < notes2.size(); i++){
            oout.start("/chuckie/osctest");    
            midi(notes2[i]) => note;
            "2" => string message;
            note => oout.add;
            velocity => oout.add;
            message => oout.add;
            oout.send();
            durs2[i]::second / 4.5 => now;
        }
    }
    else if (dice == 3){
        for (0 => int i; i < notes3.size(); i++){
            oout.start("/chuckie/osctest");    
            midi(notes3[i]) => note;
            "3" => string message;
            note => oout.add;
            velocity => oout.add;
            message => oout.add;
            oout.send();
            durs3[i]::second / 4.5 => now;
        }
    }
    else {
        for (0 => int i; i < notes4.size(); i++){
            oout.start("/chuckie/osctest");    
            midi(notes4[i]) => note;
            "4" => string message;
            note => oout.add;
            velocity => oout.add;
            message => oout.add;
            oout.send();
            durs4[i]::second / 4.5 => now;
        }
    }
    if (dice <= 3){
        for (0 => int i; i < durs5.size(); i++){
            oout.start("/chuckie/osctest");    
            "5" => string message;
            note => oout.add;
            velocity => oout.add;
            message => oout.add;
            oout.send();
            durs5[i]::second / 4.5 => now;
        }
    }
    else if (dice == 6){
        for (0 => int i; i < durs6.size(); i++){
            oout.start("/chuckie/osctest");    
            "6" => string message;
            note => oout.add;
            velocity => oout.add;
            oout.send();
            durs6[i]::second / 4.5 => now;
        }
    }
    else{
        for (0 => int i; i < durs7.size(); i++){
            oout.start("/chuckie/osctest");    
            "7" => string message;
            note => oout.add;
            velocity => oout.add;
            oout.send();
            durs7[i]::second / 4.5 => now;
        }
    }
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
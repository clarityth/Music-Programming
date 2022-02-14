public class player{
    BPM t;
    
    fun int midi(string name) {
        int note;
        [21,23,12,14,16,17,19] @=> int notes[]; // A0,B0,C0,D0,E0,F0,G0
        name.charAt(0) - 65 => int base; // A=0,B=1,C=2,D=3,E=4,F=5,G=7
        notes[base] => note;
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
    
    fun void sendOutMidiNote(MidiOut mout, MidiMsg msg, string notes[], dur durs[], int velocity) {
        for (0 => int i; i < notes.size(); i++){
            if (notes[i] != "R"){
                144 => msg.data1;
                midi(notes[i]) => msg.data2;
                
            }
            else {
                128 => msg.data1;
            }
            velocity => msg.data3;
            mout.send(msg);
            durs[i] - 0.001::second => now;
            128 => msg.data1;
            mout.send(msg);
            0.001::second => now;
        }
    }
    
    fun void sendOutMidiNote(MidiOut mout, MidiMsg msg, int on, int note, int velocity) {
        if (on == 0) 128 => msg.data1;
        else 144 => msg.data1;
        note => msg.data2;
        velocity => msg.data3;
        mout.send(msg);
    }
    
}
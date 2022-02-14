SinOsc s => dac;
72 => int note;
0.5 => float volume;
0.3::second => dur beat;

while (true){
    <<< "MIDI =", note >>>;
    Std.mtof(note) => s.freq;
    volume => s.gain;
    beat * (Math.random2f(0.5,2.0)) => now;
    moveNoteRandomly(note, 67, 77, 4) => note;
}

fun int moveNoteRandomly(int note, int min, int max, int stride){
    int picked;
    Math.random2(-(stride-1),stride) => picked;
    if (picked <= 0) 
        1 -=> picked;
    picked +=> note;
    if (note > max || note < min)
        picked * 2 -=> note;
    return note;
}

fun int moveNoteRandomly(int note, int min, int max){
    int picked;
    Math.random2(-1,2) => picked;
    if (picked <= 0) 
        1 -=> picked;
    picked +=> note;
    if (note > max || note < min)
        picked * 2 -=> note;
    return note;    
}







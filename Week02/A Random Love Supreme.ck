SinOsc s => dac; // top sheet music
TriOsc s2 => dac; // bottom sheet music

// note length
0.5::second => dur beat; // note sound:note no sound = 5:1
beat *(5.0/6) => dur qn; // quarter note sound (1/4)*(5/6)
beat/6 => dur qn_rest; // quarter note no sound (1/4)*(1/6)
qn/2 => dur hqn; // quarter half note sound
qn_rest/2 => dur hqn_rest; // quarter half note no sound

// volume
0.5 => float on;
0.0 => float off;

//initialization
0 => int i;

while(true) { // infinite loop // top sheet music
    off => s2.gain;
    Std.mtof(57+i) => s.freq; 
    on => s.gain;
    hqn => now;
    off => s.gain;
    hqn_rest => now;
    Std.mtof(60+i) => s.freq; 
    on => s.gain;
    qn => now;
    off => s.gain;
    qn_rest => now;
    Std.mtof(57+i) => s.freq; 
    on => s.gain;
    hqn => now;
    off => s.gain;
    hqn_rest => now;
    Std.mtof(62+i) => s.freq; 
    on => s.gain;
    hqn => now;
    off => s.gain;
    hqn_rest => now;
    Math.random2(1,100) => int j; 
    
    if (j<=25){ // 1/4 random probability // bottom sheet music
        Std.mtof(61+i) => s2.freq;
        on => s2.gain; 
        hqn => now;
        off => s2.gain;
        hqn_rest => now;
        Std.mtof(60+i) => s2.freq;
        on => s2.gain;
        hqn => now;
        off => s2.gain;
        hqn_rest => now;
        Std.mtof(59+i) => s2.freq;
        on => s2.gain;
        hqn => now;
        off => s2.gain;
        hqn_rest => now;
    }
    else 
        beat * 1.5 => now; // One and a half beat on mute
 
    Math.random2(-12, 12) => i; // -12~+12 random MIDI 
}
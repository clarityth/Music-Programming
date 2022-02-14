//2019040519 KimTaehyung
SndBuf kick => dac;
0.7 => kick.gain;
me.dir(-1) + "/audio/kick_04.wav" => kick.read;  

BPM tempo;
while (true) { 
    tempo.QN => dur QN;
    for (0 => int beat; beat < 4; beat++) { 
        0 => kick.pos; 
        QN => now;
    }
}
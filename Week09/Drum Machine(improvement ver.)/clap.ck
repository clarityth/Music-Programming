//2019040519 KimTaehyung
SndBuf claps => Pan2 p;
p.chan(0) => dac.left;
p.chan(1) => dac.right;
0.5 => claps.gain;
me.dir(-1) + "/audio/clap_01.wav" => claps.read;

BPM tempo;
while (true) {
    tempo.SN => dur SN;
    for (0 => int beat; beat < 16; beat++) {
        if (Math.random2(0,4) > 2) {
            Math.random2f(-1.0,1.0) => p.pan;
            0 => claps.pos;
        }
        SN => now;
    }
}
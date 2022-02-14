//2019040519 KimTaehyung
SndBuf hat => Pan2 p;
p.chan(0) => dac.left;
p.chan(1) => dac.right;
0.5 => hat.gain;
me.dir(-1) + "/audio/hihat_04.wav" => hat.read;
hat.samples() => hat.pos;
[1,0,0,1, 1,0,0,1] @=> int hihat_hits[];

BPM tempo;
while (true) {
    tempo.QN => dur QN;
    for (0 => int beat; beat < 8; beat++) {
        if (hihat_hits[beat]){
            Math.random2f(-1.0,1.0) => p.pan;
            0 => hat.pos;
        }
        QN => now;
    }
}
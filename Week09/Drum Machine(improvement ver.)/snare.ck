//2019040519 KimTaehyung
SndBuf snare => dac;
0.5 => snare.gain;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
snare.samples() => snare.pos;
[1,0,1,0, 1,0,1,0] @=> int snare_hits[];

BPM tempo;

while (true) {
    tempo.QN => dur QN;
    for (0 => int beat; beat < 8; beat++) {
        if (snare_hits[beat])
            0 => snare.pos;
        QN => now;
    }
}
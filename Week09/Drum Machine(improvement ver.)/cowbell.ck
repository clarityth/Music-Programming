//2019040519 KimTaehyung
SndBuf cow => Pan2 p;
p.chan(0) => dac.left;
p.chan(1) => dac.right;
0.3 => cow.gain;
me.dir(-1) + "/audio/cowbell_01.wav" => cow.read;
cow.samples() => cow.pos;

[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cow_hits[];

BPM tempo;
while (true) {
    for (0 => int beat; beat < 16; beat++){
        tempo.EN => dur EN;
        if (cow_hits[beat]){
            Math.random2f(-1.0,1.0) => p.pan;
            0 => cow.pos;
            EN => now;
        }
    }
}
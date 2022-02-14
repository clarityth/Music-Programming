Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SinOsc s => master[1];
0.0 => s.gain;

SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf hihat => master[2];
SndBuf hihat2 => Pan2 h;
h.chan(0) => master[0];
h.chan(1) => master[2];
SndBuf claps => Pan2 p;
p.chan(0) => master[0];
p.chan(1) => master[1];

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/hihat_04.wav" => hihat2.read;
me.dir() + "/audio/clap_01.wav" => claps.read;

[1,0,0,1, 1,0,0,1, 1,0,0,1, 1,0,0,1] @=> int hihat_hits[];
[1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0] @=> int snare_hits[];
hihat_hits.size() => int MAX_BEAT;

4 => int MOD;
0.2::second => dur TEMPO;
0 => int beat;
0 => int measure;

for (0 => int i; i < 256; i++){
    if (beat % MOD == 3) 
        0 => kick.pos;
    
    if (snare_hits[beat])
        0 => snare.pos;
    
    if (measure > 0 && measure % 2 == 0) {
        if (hihat_hits[beat])
            0 => hihat.pos;
        else {
            Math.random2f(-1.0,1.0) => h.pan;
            0 => hihat2.pos;
        }
    }
    if (beat % MOD == 1) {
        Math.random2f(-1.0,1.0) => p.pan;
        0 => claps.pos;
    }
    if (measure % 2 == 1 && Math.random2(0,1) == 1){
        0.4 => s.gain;
        Std.mtof(Math.random2(60,72)) => s.freq;
    }

    TEMPO => now;
    0.0 => s.gain;
    
    (beat + 1) % MAX_BEAT => beat;
    if (beat == 0)
        measure++;
}
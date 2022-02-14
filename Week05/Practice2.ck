Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[0];
SndBuf snare => master[1];
SndBuf hihat => master[2];

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;

kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;

0.2::second => dur TEMPO;
while (true) {
    for (0 => int beat; beat < 16; beat++) {
        <<< beat >>>;
        if (beat == 0 || beat == 4 || beat == 8 || beat == 12)
            0 => kick.pos;
        if (beat == 4 || beat == 10 || beat == 13 || beat == 14) 
            0 => snare.pos;
        if (beat == 2 || beat == 5 || beat == 6)
            0 => hihat.pos;                 
        TEMPO => now;
    }
}

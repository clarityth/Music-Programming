MusicLib mlib;
Event e1, e2, e3, e4, e5, e6, e7;

NRev globalReverb => dac;
.1 => globalReverb.mix;

// instrument function to spork
fun void poly(StkInstrument instrument, Event event, string notes[], float durs[], float vol) {
    instrument => globalReverb; // connect to output
    while (true) {
        // wait
        event => now;
        // play
        for (0 => int i; i< notes.size(); i++){
            Std.mtof(mlib.midi(notes[i])) => instrument.freq;
            vol => instrument.noteOn;
            durs[i]::second / 4.5 => now;
        }
    }
}

fun void buk(string sample, Event event, float durs[]) {
    SndBuf drum => dac;
    sample => drum.read;
    drum.samples() => drum.pos;
    while (true) {
        event => now;
        for (0 => int i; i< durs.size(); i++){
                0 => drum.pos;
                durs[i]::second / 4.5 => now;
        }
    }
}

spork ~ poly(new StifKarp, e1, ["B3","E4","B3","E4","E4"], [2.0,1.0,2.0,1.0,3.0], 0.4);
spork ~ poly(new PercFlut, e2, ["B3","B3","E4","E4"], [3.0,2.0,1.0,3.0], 0.7);
spork ~ poly(new PercFlut, e3, ["E4","E4","E4","F#4"], [1.0,2.0,3.0,3.0], 0.7);
spork ~ poly(new StifKarp, e4, ["E4","G4","B4","G4","F#4","B3"], [2.0,1.0,2.0,0.5,0.5,3.0], 0.4);

spork ~ buk(me.dir()+"/audio/snare_02.wav", e5, [1.0,2.0,1.0,3.0,2.0]);
spork ~ buk(me.dir()+"/audio/hihat_02.wav", e6, [3.0,2.0,1.0,1.0,2.0]);
spork ~ buk(me.dir()+"/audio/kick_02.wav", e7, [6.0,3.0]);

int dice;
0.001::second => now;
while (true){
    Math.random2(1,6) => dice;
    if (dice == 3) e3.signal();
    else if (dice == 4) e4.signal();
    else if (dice <= 2) e1.signal();
    else e2.signal();
    if (dice == 4) e7.signal();
    else if (dice <= 3) e5.signal();
    else e6.signal();
    9::second / 4.5 => now;
}

/*
while (true) {
    Math.random2(1,6) => int dice;
    if (dice != 1) { // 5/6
        notes[Math.random2(0,notes.size()-1)] => e1.note;
        Math.random2f(.2, .9) => e1.velocity;
        e1.signal();
        0.25::second => now;
    }
    else { // 1/6
        notes[Math.random2(0,notes.size()-1)] - 24 => e2.note;
        notes[0] - 12 => e1.note;
        1.0 => e2.velocity;
        e1.broadcast();
        e2.signal();
        second => now;
    }
}*/


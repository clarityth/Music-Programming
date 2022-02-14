MidiIn min;
MidiMsg msg;     
0 => int port;
if (!min.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

int dice;
while (true) {
    min => now; 
    while (min.recv(msg)) {
        <<< msg.data1, msg.data2, msg.data3 >>>;
        if (msg.data1 == 144) { // noteOn (144)
            Math.random2(1,3) => dice;
            if (dice == 1)
                buk(me.dir()+"audio/snare_02.wav", [1.0,2.0,1.0,3.0,2.0], 1);
            else if (dice == 2)
                buk(me.dir()+"audio/hihat_02.wav", [3.0,2.0,1.0,1.0,2.0], 2);
            else
                buk(me.dir()+"audio/kick_02.wav", [6.0,3.0], 3);
        }
        
    }
}

fun void buk(string sample, float durs[], int n) {
    SndBuf drum => dac;
    sample => drum.read;
    drum.samples() => drum.pos;
    0.7 => drum.gain;
    <<< n , "" >>>;
    for (0 => int i; i < durs.size(); i++) {
            0 => drum.pos;
            durs[i]::second / 4.5 => now;
    }
}
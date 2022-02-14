OscIn oin;
1979 => oin.port;
oin.addAddress("/chuckie/osctest");
OscMsg msg;

int dice;
while (true) {
    oin => now; 
    while (oin.recv(msg) != 0) {
        msg.getString(2) => string message;
        if (message == "5")
            buk(me.dir()+"audio/snare_02.wav", [1.0,2.0,1.0,3.0,2.0], 1);
        else if (message == "6")
            buk(me.dir()+"audio/hihat_02.wav", [3.0,2.0,1.0,1.0,2.0], 2);
        else
            buk(me.dir()+"audio/kick_02.wav", [6.0,3.0], 3);
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
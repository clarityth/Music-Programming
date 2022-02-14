OscIn oin;
1979 => oin.port;
oin.addAddress("/chuckie/osctest");
OscMsg msg;


NRev global_reverb => dac;
0.1 => global_reverb.mix;
while (true) {
    oin => now;
    StifKarp flut => global_reverb;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int note;
        msg.getFloat(1) => float velocity;
        msg.getString(2) => string message;
        if (message == "3" || message == "4"){
            Std.mtof(note) => flut.freq;
            velocity => flut.gain;
            velocity => flut.noteOn;
        }
        <<< message, note, velocity >>>;
    }
}
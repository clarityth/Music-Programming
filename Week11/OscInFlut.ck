OscIn oin;
1979 => oin.port;
oin.addAddress("/chuckie/osctest");
OscMsg msg;


NRev global_reverb => dac;
0.1 => global_reverb.mix;
while (true) {
    oin => now;
    StifKarp sti => global_reverb;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int note;
        msg.getFloat(1) => float velocity;
        msg.getString(2) => string message;
        if (message == "1" || message == "2"){
            Std.mtof(note) => sti.freq;
            velocity => sti.gain;
            velocity => sti.noteOn;
        }
        <<< message, note, velocity >>>;
    }
}
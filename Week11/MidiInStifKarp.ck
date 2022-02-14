MidiIn min;
MidiMsg msg;     
0 => int port;
if (!min.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

StifKarp sti => dac;
while (true) {
    min => now; 
    while (min.recv(msg)) {
        <<< msg.data1, msg.data2, msg.data3 >>>;
        if (msg.data1 == 144) { // noteOn (144)
            Std.mtof(msg.data2) => sti.freq;
            msg.data3 / 127.0 => sti.gain;
            1 => sti.noteOn;
        }
        else { // noteOff (128)
            1 => sti.noteOff;
        }
    }
}
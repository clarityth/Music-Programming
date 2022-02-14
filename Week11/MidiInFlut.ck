MidiIn min;
MidiMsg msg;     
0 => int port;
if (!min.open(port)) {
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

PercFlut flut => dac;

while (true) {
    min => now; 
    while (min.recv(msg)) {
        <<< msg.data1, msg.data2, msg.data3 >>>;
        if (msg.data1 == 144) { // noteOn (144)
            Std.mtof(msg.data2) => flut.freq;
            msg.data3 / 127.0 => flut.gain;
            1 => flut.noteOn;
        }
        else { // noteOff (128)
            1 => flut.noteOff;
        }
    }
}
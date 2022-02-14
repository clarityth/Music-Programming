BPM t;
t.tempo(150);

Machine.add(me.dir() + "melody.ck");
Machine.add(me.dir() + "bass.ck");
t.QN * 32 => now;

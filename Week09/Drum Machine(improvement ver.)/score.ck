//2019040519 KimTaehyung
BPM tempo;
tempo.tempo(130.0);

Machine.add(me.dir()+"/kick.ck") => int kickID;
8.0 * tempo.QN => now;

Machine.add(me.dir()+"/snare.ck") => int snareID;
8.0 * tempo.QN => now;

Machine.add(me.dir()+"/hihat.ck") => int hatID;
Machine.add(me.dir()+"/cowbell.ck") => int cowID;
8.0 * tempo.QN => now;

Machine.add(me.dir()+"/clap.ck") => int clapID;
16.0 * tempo.QN => now;

<<< "Play with 100 BPM" >>>;
80.0 => float new_tempo;
tempo.tempo(new_tempo);
16.0 * tempo.QN => now;


<<< "Play with 160 BPM" >>>;
160.0 => new_tempo;
tempo.tempo(new_tempo);
8.0 * tempo.QN => now;


<<< "Gradually decrease tempo" >>>;
while (new_tempo > 100.0) {
    20 -=> new_tempo;
    tempo.tempo(new_tempo);
    <<< "tempo = ", new_tempo >>>;
    8.0 * tempo.QN => now;
}

Machine.remove(kickID);

8.0 * tempo.QN => now;
Machine.remove(snareID);
Machine.remove(hatID);

4.0 * tempo.QN => now;
Machine.remove(cowID);

4.0 * tempo.QN => now;
Machine.remove(clapID);
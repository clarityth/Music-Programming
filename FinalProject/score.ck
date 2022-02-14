MidiOut mout_p, mout_p2, mout_b, mout_v, mout_v2, mout_c, mout_k;
MidiMsg msg_p[4]; 
MidiMsg msg_p2, msg_b, msg_v, msg_v2, msg_c, msg_k;

1 => int port_p; //piano
2 => int port_v; // violin
3 => int port_v2; // viola
4 => int port_b; // bass
5 => int port_c; // contrabass

if (! mout_p.open(port_p)) me.exit();
if (! mout_b.open(port_b)) me.exit();
if (! mout_v.open(port_v)) me.exit();
if (! mout_v2.open(port_v2)) me.exit();
if (! mout_c.open(port_c)) me.exit();

BPM t;
secondrun secondrun;
player p;
remini remini;
bass bass;
violin violin;
viola viola;
contra contra;

t.tempo(160);
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right1, secondrun.right1_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left1, secondrun.left1_durs, 80);
13 * t.SN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right2, secondrun.right2_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left2, secondrun.left2_durs, 80);
15 * t.SN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right3, secondrun.right3_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left3, secondrun.left3_durs, 80);
10 * t.SN + t.DEN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right4, secondrun.right4_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left4, secondrun.left4_durs, 80);
9 * t.SN + 2* t.EN + t.DEN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right5, secondrun.right5_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left5, secondrun.left5_durs, 80);
9 * t.SN + t.QN + t.DEN  => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right6, secondrun.right6_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left6, secondrun.left6_durs, 80);
3 * t.DEN + t.QN + 5*t.SN + t.DHN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right7, secondrun.right7_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left7, secondrun.left7_durs, 80);
4 * t.SN + 3*t.QN + 2*t.EN + 2*t.DEN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right8, secondrun.right8_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left8, secondrun.left8_durs, 80);
t.DEN + t.SN + t.HN + 2*t.EN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right9, secondrun.right9_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left9, secondrun.left9_durs, 80);
15 * t.SN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], secondrun.right10, secondrun.right10_durs, 80);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], secondrun.left10, secondrun.left10_durs, 80);
16 * t.SN + t.EN => now;


t.tempo(140);
spork ~ p.sendOutMidiNote(mout_p, msg_p[0], remini.notes_high, remini.durs, 70);
spork ~ p.sendOutMidiNote(mout_p, msg_p[1], remini.notes_low, remini.durs, 70);
spork ~ p.sendOutMidiNote(mout_p, msg_p[2], remini.notes_middle, remini.durs, 70);
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony1, remini.harmony1_durs, 50);
spork ~ p.sendOutMidiNote(mout_v, msg_v, violin.notes, violin.durs, 30);
spork ~ p.sendOutMidiNote(mout_v2, msg_v2, viola.notes, viola.durs, 40);
spork ~ p.sendOutMidiNote(mout_c, msg_c, contra.notes, contra.durs, 40);
spork ~ p.sendOutMidiNote(mout_b, msg_b, bass.notes, bass.durs, 30);
t.DQN + t.QN*6 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony2, remini.harmony2_durs, 50);
t.DQN + t.QN*3 + t.HN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony3, remini.harmony3_durs, 50);
t.DQN + t.QN*6 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony4, remini.harmony4_durs, 50);
t.DQN + t.QN*5 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony5, remini.harmony5_durs, 50);
t.DQN + t.QN*6 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony6, remini.harmony6_durs, 50);
t.DQN*2 + t.QN*4 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony7, remini.harmony7_durs, 50);
t.QN + t.DHN => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony8, remini.harmony8_durs, 50);
t.QN*4 => now;
spork ~ p.sendOutMidiNote(mout_p, msg_p[3], remini.harmony9, remini.harmony9_durs, 50);
t.HN*3 => now;
86::second => now;
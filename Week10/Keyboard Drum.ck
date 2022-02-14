// Q : kick, W : snare, E : hihat, R : clap, T: cow 

SndBuf kick => dac;
SndBuf snare => dac;
SndBuf hihat => dac;
SndBuf clap => dac;
SndBuf cow => dac;
me.dir() + "/audio/kick_04.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_04.wav" => hihat.read;
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/audio/cowbell_01.wav" => cow.read;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
clap.samples() => clap.pos;
cow.samples() => cow.pos;
0.7 => kick.gain;
0.7 => snare.gain;
0.7 => hihat.gain;
0.7 => clap.gain;
0.7 => cow.gain;

Hid hid;
HidMsg msg;

0 => int device;
if (!hid.openKeyboard(device)) {
    <<< "Can't open this device!" >>>;
    me.exit();
}
<<<  "keyboard '" + hid.name() + "' ready", ""  >>>;

while(true){
    hid => now;
    while(hid.recv(msg)){
        if(msg.isButtonDown()){
            <<< "key down: ", msg.ascii >>>;
            
            if(msg.ascii == 81){
                0 => kick.pos;
            }
            else if(msg.ascii == 87){
                0 => snare.pos;
            }
           else if(msg.ascii == 69){
                0 => hihat.pos;
           }
           
           else if(msg.ascii == 82){
                0 => clap.pos;
           }
           
           else if(msg.ascii == 84){
                0 => cow.pos;
           }
           else 
               continue;
           80::ms => now;
       }
       else{
            <<< "key up: ", msg.ascii>>>;
            kick.samples() => kick.pos;
            snare.samples() => snare.pos;
            hihat.samples() => hihat.pos;
            clap.samples() => clap.pos;
            cow.samples() => cow.pos;
            
       }
   }
}

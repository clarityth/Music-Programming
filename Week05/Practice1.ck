SndBuf sample => dac;

// audio_samples array
string audio_samples[24];
me.dir()+ "/audio/clap_01.wav" => audio_samples[0];
me.dir()+ "/audio/click_01.wav" => audio_samples[1];
me.dir()+ "/audio/click_02.wav" => audio_samples[2];
me.dir()+ "/audio/click_03.wav" => audio_samples[3];
me.dir()+ "/audio/click_04.wav" => audio_samples[4];
me.dir()+ "/audio/click_05.wav" => audio_samples[5];
me.dir()+ "/audio/cowbell_01.wav" => audio_samples[6];
me.dir()+ "/audio/hihat_01.wav" => audio_samples[7];
me.dir()+ "/audio/hihat_02.wav" => audio_samples[8];
me.dir()+ "/audio/hihat_03.wav" => audio_samples[9];
me.dir()+ "/audio/hihat_04.wav" => audio_samples[10];
me.dir()+ "/audio/kick_01.wav" => audio_samples[11];
me.dir()+ "/audio/kick_02.wav" => audio_samples[12];
me.dir()+ "/audio/kick_03.wav" => audio_samples[13];
me.dir()+ "/audio/kick_04.wav" => audio_samples[14];
me.dir()+ "/audio/kick_05.wav" => audio_samples[15];
me.dir()+ "/audio/snare_01.wav" => audio_samples[16];
me.dir()+ "/audio/snare_02.wav" => audio_samples[17];
me.dir()+ "/audio/snare_03.wav" => audio_samples[18];
me.dir()+ "/audio/stereo_fx_01.wav" => audio_samples[19];
me.dir()+ "/audio/stereo_fx_02.wav" => audio_samples[20];
me.dir()+ "/audio/stereo_fx_03.wav" => audio_samples[21];
me.dir()+ "/audio/stereo_fx_04.wav" => audio_samples[22];
me.dir()+ "/audio/stereo_fx_05.wav" => audio_samples[23];

for (0 => int i; i < audio_samples.size(); i++){
    // correction need
    <<< "file :", audio_samples[i], "\nlength :", sample.length()>>>;
    audio_samples[i] => sample.read;
    0.5 => sample.gain;
    0 => sample.pos;
    sample.samples() :: samp => now;
    
    0 => sample.gain; // REST
    1.0 :: second => now;
}

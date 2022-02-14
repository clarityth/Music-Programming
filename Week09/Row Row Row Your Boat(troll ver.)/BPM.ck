public class BPM { // Beats Per Minute
    // globally accessible variables 
    static dur SN, TN, HN, WN;
    
    fun void tempo(float beat) { // beat in BPM
        60.0 / beat => float SPB; // Seconds Per Beat  
        SPB::second => SN;
        SN * 2.0 => TN;
        SN * 3.0 => HN;
        SN * 6.0 => WN;
    }
}
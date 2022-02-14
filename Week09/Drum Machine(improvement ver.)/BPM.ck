//2019040519 KimTaehyung
public class BPM { // Beats Per Minute
    // globally accessible variables 
    static dur QN, EN, SN, TN, HN;
    
    fun void tempo(float beat) { // beat in BPM
        60.0 / beat => float SPB; // Seconds Per Beat  
        SPB::second => QN;
        QN / 2.0 => EN;
        QN / 4.0 => SN;
        QN / 8.0 => TN;
        QN * 2 => HN;
    }
}
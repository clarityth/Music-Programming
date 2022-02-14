public class BPM { 
    static dur QN, DQN, HN, WN, SN, EN, DHN, DEN;
    
    fun void tempo(float beat) { 
        60.0 / beat => float SPB;  
        SPB::second => QN;
        QN * 2.0 => HN;
        QN / 2.0 => EN;
        QN * 4.0 => WN;
        WN / 6.0 => SN; 
        QN + EN => DQN;
        QN + HN => DHN;
        EN + EN/2.0 => DEN;
    }
}
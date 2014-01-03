import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * 
 */

/**
 * @author Doug Blase
 * 
 */
public class BaseballPlayer {
  private String name;
  private int number;
  private int gamesPlayed;
  private int atBats;
  private int iHits;
  private int hr;
  private int rbi;
  private int bso;
  private int bBB;
  private String avg;
  private String era;
  private int wins;
  private int losses;
  private int app;
  private int starts;
  private int saves;
  private double ip;
  private int pOutsSeason;
  private int hitsAllowed;
  private int runsAllowed;
  private int er;
  private int bb;
  private int so;
  private ArrayList<String> today;
  private int pitchCount;
  private int strikesThrown;
  private int ballsThrown;
  private int kToday;
  private double ipToday;
  private int pOutsToday;
  private int bbToday;
  private int rToday;
  private boolean wasInGame;
  private boolean pitchedToday;
  private DecimalFormat eraForm;
  private DecimalFormat ipForm;
  private DecimalFormat avgForm;

  public BaseballPlayer(Scanner input) {
    this.name = input.next() + " " + input.next();
    this.number = input.nextInt();
    this.gamesPlayed = input.nextInt();
    this.atBats = input.nextInt();
    this.iHits = input.nextInt();
    this.hr = input.nextInt();
    this.rbi = input.nextInt();
    this.bso = input.nextInt();
    this.bBB = input.nextInt();
    this.wins = input.nextInt();
    this.losses = input.nextInt();
    this.app = input.nextInt();
    this.starts = input.nextInt();
    this.saves = input.nextInt();
    this.ip = input.nextDouble();
    this.hitsAllowed = input.nextInt();
    this.runsAllowed = input.nextInt();
    this.er = input.nextInt();
    this.bb = input.nextInt();
    this.so = input.nextInt();
    this.wasInGame = false;
    this.pitchedToday = false;
    this.pitchCount = 0;
    this.strikesThrown = 0;
    this.ballsThrown = 0;
    this.kToday = 0;
    this.ipToday = 0.0;
    this.bbToday = 0;
    this.rToday = 0;
    this.pOutsToday = 0;
    this.eraForm = new DecimalFormat("0.00");
    this.ipForm = new DecimalFormat("#.0");
    this.avgForm = new DecimalFormat("#.000");
    this.eraForm.setRoundingMode(RoundingMode.HALF_UP);
    this.ipForm.setRoundingMode(RoundingMode.HALF_UP);
    this.avgForm.setRoundingMode(RoundingMode.HALF_UP);
    this.calculateAvg();
    this.calculateEra();
    this.convertIp();
    this.today = new ArrayList<String>();
  }

  /**
   * @return the name
   */
  public String getName() {
    return name;
  }

  /**
   * @return the number
   */
  public int getNumber() {
    return number;
  }

  /**
   * @return the gamesPlayed
   */
  public int getGamesPlayed() {
    return gamesPlayed;
  }

  /**
   * @param gamesPlayed
   *            the gamesPlayed to set
   */
  public void setGamesPlayed(int gamesPlayed) {
    this.gamesPlayed = gamesPlayed;
  }

  /**
   * @return the atBats
   */
  public int getAtBats() {
    return atBats;
  }

  /**
   * @param atBats
   *            the atBats to set
   */
  public void setAtBats(int atBats) {
    this.atBats = atBats;
  }

  /**
   * @return the iHits
   */
  public int getiHits() {
    return iHits;
  }

  /**
   * @param iHits
   *            the iHits to set
   */
  public void setiHits(int iHits) {
    this.iHits = iHits;
  }

  /**
   * @return the hr
   */
  public int getHr() {
    return hr;
  }

  /**
   * @param hr
   *            the hr to set
   */
  public void setHr(int hr) {
    this.hr = hr;
  }

  /**
   * @return the rbi
   */
  public int getRbi() {
    return rbi;
  }

  /**
   * @return the bso
   */
  public int getBso() {
    return bso;
  }

  /**
   * @param bso
   *            the bso to set
   */
  public void setBso(int bso) {
    this.bso = bso;
  }

  /**
   * @return the bBB
   */
  public int getbBB() {
    return bBB;
  }

  /**
   * @param bBB
   *            the bBB to set
   */
  public void setbBB(int bBB) {
    this.bBB = bBB;
  }

  /**
   * @param rbi
   *            the rbi to set
   */
  public void setRbi(int rbi) {
    this.rbi = rbi;
  }

  /**
   * @return the avg
   */
  public String getAvg() {
    return avg;
  }

  /**
   * @param avg
   *            the avg to set
   */
  public void calculateAvg() {
    double avgN = +((double) iHits / (double) atBats);
    if (Double.isNaN(avgN))
      avgN = 0.0;

    this.avg = avgForm.format(avgN);
  }

  /**
   * @return the era
   */
  public String getEra() {
    return era;
  }

  /**
   * @param era
   *            the era to set
   */
  public void calculateEra() {
    double eraN = ((double) er / (double) ip) * 9;
    if (Double.isNaN(eraN))
      eraN = 0.0;
    this.era = (eraForm.format(eraN));
  }
  /**
   * @return the wins
   */
  public int getWins() {
    return wins;
  }

  /**
   * @param wins
   *            the wins to set
   */
  public void setWins(int wins) {
    this.wins = wins;
  }

  /**
   * @return the losses
   */
  public int getLosses() {
    return losses;
  }

  /**
   * @param losses
   *            the losses to set
   */
  public void setLosses(int losses) {
    this.losses = losses;
  }

  /**
   * @return the app
   */
  public int getApp() {
    return app;
  }

  /**
   * @param app
   *            the app to set
   */
  public void setApp(int app) {
    this.app = app;
  }

  /**
   * @return the starts
   */
  public int getStarts() {
    return starts;
  }

  /**
   * @param starts
   *            the starts to set
   */
  public void setStarts(int starts) {
    this.starts = starts;
  }

  /**
   * @return the saves
   */
  public int getSaves() {
    return saves;
  }

  /**
   * @param saves
   *            the saves to set
   */
  public void setSaves(int saves) {
    this.saves = saves;
  }

  /**
   * @return the ip
   */
  public double getIp() {
    return ip;
  }

  /**
   * @param ip
   *            the ip to set
   */
  public void setIp(int pOuts) {
    this.pOutsSeason += pOuts;
    String temp = (pOutsSeason/3) +"."+(pOutsSeason%3);
    ip = Double.valueOf(temp);
  }

  /**
   * @return the hitsAllowed
   */
  public int getHitsAllowed() {
    return hitsAllowed;
  }

  /**
   * @param hitsAllowed
   *            the hitsAllowed to set
   */
  public void setHitsAllowed(int hitsAllowed) {
    this.hitsAllowed = hitsAllowed;
  }

  /**
   * @return the runsAllowed
   */
  public int getRunsAllowed() {
    return runsAllowed;
  }

  /**
   * @param runsAllowed
   *            the runsAllowed to set
   */
  public void setRunsAllowed(int runsAllowed) {
    this.runsAllowed = runsAllowed;
  }

  /**
   * @return the er
   */
  public int getEr() {
    return er;
  }

  /**
   * @param er
   *            the er to set
   */
  public void setEr(int er) {
    this.er = er;
  }

  /**
   * @return the bb
   */
  public int getBb() {
    return bb;
  }

  /**
   * @param bb
   *            the bb to set
   */
  public void setBb(int bb) {
    this.bb = bb;
  }

  /**
   * @return the so
   */
  public int getSo() {
    return so;
  }

  /**
   * @param so
   *            the so to set
   */
  public void setSo(int so) {
    this.so = so;
  }

  /**
   * @return the today
   */
  public ArrayList<String> getToday() {
    return today;
  }

  /**
   * @param today
   *            the today to set
   */
  public void setToday(ArrayList<String> today) {
    this.today = today;
  }

  /**
   * @return the pitchCount
   */
  public int getPitchCount() {
    return pitchCount;
  }

  /**
   * @param pitchCount
   *            the pitchCount to set
   */
  public void setPitchCount(int pitchCount) {
    this.pitchCount = pitchCount;
  }

  /**
   * @return the strikesThrown
   */
  public int getStrikesThrown() {
    return strikesThrown;
  }

  /**
   * @param strikesThrown
   *            the strikesThrown to set
   */
  public void setStrikesThrown(int strikesThrown) {
    this.strikesThrown = strikesThrown;
  }

  /**
   * @return the ballsThrown
   */
  public int getBallsThrown() {
    return ballsThrown;
  }

  /**
   * @param ballsThrown
   *            the ballsThrown to set
   */
  public void setBallsThrown(int ballsThrown) {
    this.ballsThrown = ballsThrown;
  }

  /**
   * @return the kToday
   */
  public int getkToday() {
    return kToday;
  }

  /**
   * @param kToday
   *            the kToday to set
   */
  public void setkToday(int kToday) {
    this.kToday = kToday;
  }

  /**
   * @return the ipToday
   */
  public double getIpToday() {
    return ipToday;
  }

  /**
   * @param ipToday
   *            the ipToday to set
   */
  public void setIpToday(int pOuts) {
    this.pOutsToday += pOuts;
    String temp = (pOutsToday/3) +"."+(pOutsToday%3);
    ipToday = Double.valueOf(temp);
  }

  /**
   * @return the bbToday
   */
  public int getBbToday() {
    return bbToday;
  }

  /**
   * @param bbToday
   *            the bbToday to set
   */
  public void setBbToday(int bbToday) {
    this.bbToday = bbToday;
  }

  /**
   * @return the rToday
   */
  public int getrToday() {
    return rToday;
  }

  /**
   * @param rToday
   *            the rToday to set
   */
  public void setrToday(int rToday) {
    this.rToday = rToday;
  }

  /**
   * @return the wasInGame
   */
  public boolean wasInGameToday() {
    return wasInGame;
  }

  /**
   * @param wasInGame
   *            the wasInGame to set
   */
  public void setWasInGame(boolean wasInGame) {
    this.wasInGame = wasInGame;
  }

  /**
   * @return the eraForm
   */
  public DecimalFormat getEraForm() {
    return eraForm;
  }

  /**
   * @param eraForm
   *            the eraForm to set
   */
  public void setEraForm(DecimalFormat eraForm) {
    this.eraForm = eraForm;
  }

  /**
   * @return the ipForm
   */
  public DecimalFormat getIpForm() {
    return ipForm;
  }

  /**
   * @param ipForm
   *            the ipForm to set
   */
  public void setIpForm(DecimalFormat ipForm) {
    this.ipForm = ipForm;
  }

  /**
   * @return the avgForm
   */
  public DecimalFormat getAvgForm() {
    return avgForm;
  }

  /**
   * @param avgForm
   *            the avgForm to set
   */
  public void setAvgForm(DecimalFormat avgForm) {
    this.avgForm = avgForm;
  }

  public void setPitchedToday(boolean pitched) {
    this.pitchedToday = pitched;
  }
  
  private void convertIp(){
    String temp = ""+ip;
    pOutsSeason = 3* Integer.parseInt(temp.substring(0,temp.indexOf(".")));
    pOutsSeason +=Integer.parseInt(temp.substring(temp.indexOf(".") + 1, temp.length()));
  }
  
  

  public String toString() {
    if (wasInGame)
      gamesPlayed ++;

    if (pitchedToday)
      app++;

    return gamesPlayed +" " + atBats+" " +iHits +" " +hr +" " + rbi +" " +
      bso+" " +bBB+" " +wins+" " +losses+" " +app+" " +starts
      +" " +saves+" " +ip+" " +hitsAllowed+" " +runsAllowed+" " +er+" " +bb+" " +
      so;
  }
}


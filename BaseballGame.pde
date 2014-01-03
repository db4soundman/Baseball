import javax.swing.JOptionPane;

/**
 * 
 */

/**
 * @author Doug Blase
 *
 */
public class BaseballGame {
  private String awayTeamName;
  private String homeTeamName;
  private int awayTeamScore;
  private int homeTeamScore;
  private int period;
  private String inningMod;
  private BaseballScoreboard scoreboard;
  private int homeBatter;
  private int awayBatter;
  private int strikes, balls, outs;

  public BaseballGame() {
    this.awayTeamName = JOptionPane.showInputDialog(null, 
    "Visitors: ");
    this.awayTeamName = awayTeamName.toUpperCase();
    this.homeTeamName = JOptionPane.showInputDialog(null, 
    "Home: ");
    this.homeTeamName = homeTeamName.toUpperCase();
    this.awayTeamScore = 0;
    this.homeTeamScore = 0;
    this.period = 1;
    this.inningMod = "Top";
    this.scoreboard = new BaseballScoreboard(awayTeamName, homeTeamName);
    this.homeBatter = 0;
    this.awayBatter = 0;
    this.strikes = 0;
    this.balls = 0;
    this.outs = 0;
  }

  /**
   * @return the homeBatter
   */
  public int getHomeBatter() {
    return homeBatter;
  }

  /**
   * @param homeBatter the homeBatter to set
   */
  public void setHomeBatter(int homeBatter) {
    this.homeBatter = homeBatter;
    if (homeBatter>8)
      homeBatter=0;
  }

  /**
   * @return the awayBatter
   */
  public int getAwayBatter() {
    return awayBatter;
  }

  /**
   * @param awayBatter the awayBatter to set
   */
  public void setAwayBatter(int awayBatter) {
    this.awayBatter = awayBatter;
    if (awayBatter>8)
      awayBatter=0;
  }

  /**
   * @return the awayTeamScore
   */
  public int getAwayTeamScore() {
    return awayTeamScore;
  }

  /**
   * @param awayTeamScore the awayTeamScore to set
   */
  public void setAwayTeamScore(int awayTeamScore) {
    this.awayTeamScore = awayTeamScore;
  }

  /**
   * @return the homeTeamScore
   */
  public int getHomeTeamScore() {
    return homeTeamScore;
  }

  /**
   * @param homeTeamScore the homeTeamScore to set
   */
  public void setHomeTeamScore(int homeTeamScore) {
    this.homeTeamScore = homeTeamScore;
  }

  /**
   * @return the period
   */
  public int getPeriod() {
    return period;
  }



  /**
   * @return the inningMod
   */
  public String getInningMod() {
    return inningMod;
  }

  /**
   * @param inningMod the inningMod to set
   */
  public void nextInning() {
    if (inningMod.equals("Top")) {
      inningMod = "Bot";
    }
    else {
      inningMod = "Top";
      period++;
    }
    balls = 0;
    strikes = 0;
    outs = 0;
  }

  public void prevInning() {
    if (inningMod.equals("Top")) {
      inningMod = "Bot";
      period --;
    }
    else {
      inningMod = "Top";
    }
  }

  /**
   * @return the awayTeamName
   */
  public String getAwayTeamName() {
    return awayTeamName;
  }

  /**
   * @return the homeTeamName
   */
  public String getHomeTeamName() {
    return homeTeamName;
  }

  /**
   * @return the scoreboard
   */
  public BaseballScoreboard getScoreboard() {
    return scoreboard;
  }

  public void displayScoreboard(String special) {

    if (special.equals("INT"))
      this.scoreboard.displayScoreboard(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);
    if (special.equals("FINAL"))
      this.scoreboard.displayScoreboard(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);

    if (special.equals("CLOCK"))
      this.scoreboard.displayScoreboard(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);
  }

  public void commercial(String special) {
    if (special.equals("INT"))
      this.scoreboard.displayCommercial(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);
    if (special.equals("FINAL"))
      this.scoreboard.displayCommercial(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);

    if (special.equals("CLOCK"))
      this.scoreboard.displayCommercial(awayTeamName, 
      awayTeamScore, homeTeamName, homeTeamScore, 
      period);
  }

  public int getStrikes() {
    return strikes;
  }

  public int getBalls() {
    return balls;
  }

  public int getOuts() {
    return outs;
  }

  public void setStrikes(int newStrikes) {
    strikes = newStrikes;
  }

  public void setBalls(int newBalls) {
    balls = newBalls;
  }

  public void setOuts(int newOuts) {
    outs = newOuts;
  }
}


import java.awt.Color;
import javax.swing.JColorChooser;

/**
 * 
 */

/**
 * @author Doug Blase
 * 
 */
public class BaseballScoreboard {
  private Color homeTeamColor;
  private Color awayTeamColor;
  private color black;
  private int x;
  private int y;
  private int cX;
  private int cY;
  private int ltX;
  private int pX;
  private int pY;
  private int dX, dY;
  private color awayColor;
  private color homeColor;

  public BaseballScoreboard(String awayTeam, String homeTeam) {
    this.x = width / 2 - (785);
    this.y = 76;
    this.cX = width / 2 - 480;
    this.cY = height - 200;
    this.ltX = width / 2 - 400;
    this.pX = width - 820;
    this.pY = height / 2 - 400;
    this.dX = width / 2 - 440;
    this.dY = height / 2 - (336);
    black = color(0, 0, 0);

    awayTeamColor = JColorChooser.showDialog(null, awayTeam, 
    Color.white);
    awayColor = color(awayTeamColor.getRed(), 
    awayTeamColor.getGreen(), awayTeamColor.getBlue());
    homeTeamColor = JColorChooser.showDialog(null, homeTeam, 
    Color.red);
    homeColor = color(homeTeamColor.getRed(), 
    homeTeamColor.getGreen(), homeTeamColor.getBlue());
  }

  public void displayScoreboard(String awayTeamName, 
  int awayTeamScore, String homeTeamName, 
  int homeTeamScore, int period) {
    String periodStr = game.getInningMod() + " " + period;
    if (periodStr.endsWith("11"))
      periodStr += "th";
    else if (periodStr.endsWith("1"))
      periodStr += "st";
    if (periodStr.endsWith("12"))
      periodStr += "th";
    else if (periodStr.endsWith("2"))
      periodStr += "nd";
    if (periodStr.endsWith("13"))
      periodStr += "th";
    else if (periodStr.endsWith("3"))
      periodStr += "rd";
    if (periodStr.endsWith("0") || periodStr.endsWith("4")
      || periodStr.endsWith("5") || periodStr.endsWith("6")
      || periodStr.endsWith("7") || periodStr.endsWith("8")
      || periodStr.endsWith("9"))
      periodStr += "th";

    image(sb, x, y, 1570, 62);
    textFont(font24);
    // --I was getting a random undrawn line due to the math, so
    // that's
    // why the for loop is odd. Just accept it.
    for (float i = 0; i<254; i +=5.1) {
      stroke(lerpColor(awayColor, black, i/255));
      line(x+136, round(y+8+(i/5.1)), x+444, round(y+8+(i/5.1))); 
      stroke(lerpColor(homeColor, black, i/255));
      line(x+556, round(y+8+(i/5.1)), x+864, round(y+8+(i/5.1)));
    }
    noStroke();
    fill(255);
    textAlign(LEFT);
    text(awayTeamName, x+140, y+48);
    text(homeTeamName, x+562, y+48);
    textAlign(CENTER);
    textFont(myFont);
    text(awayTeamScore, x+492, y+48);
    text(homeTeamScore, x+912, y+48);
    fill(0);
    textFont(font18);
    if (showFinal)
      text("FINAL", x+1188, y+48);
    else {
      text(periodStr, x + 1068, y + 48);
      text(game.getBalls() + "-" + game.getStrikes(), x+1188, y + 48);
      text(game.getOuts() + " OUT", x+1300, y + 48);
    }

    if (thirdBase)
      image(yellowBase, x+1420, y+20, 40, 40);
    else image(grayBase, x+1420, y+20, 40, 40);

    if (secondBase)
      image(yellowBase, x+1444, y, 40, 40);
    else image(grayBase, x+1444, y, 40, 40);

    if (firstBase)
      image(yellowBase, x+1468, y+20, 40, 40);
    else image(grayBase, x+1468, y+20, 40, 40);
  }

  void displayCommercial(String awayTeamName, int awayTeamScore, 
  String homeTeamName, int homeTeamScore, int period) {
    String periodStr = game.getInningMod() + " " + period;
    if (showFinal)
      periodStr = "FINAL";
    else {
      if (periodStr.endsWith("11"))
        periodStr += "th";
      else if (periodStr.endsWith("1"))
        periodStr += "st";
      if (periodStr.endsWith("12"))
        periodStr += "th";
      else if (periodStr.endsWith("2"))
        periodStr += "nd";
      if (periodStr.endsWith("13"))
        periodStr += "th";
      else if (periodStr.endsWith("3"))
        periodStr += "rd";
      if (periodStr.endsWith("0") || periodStr.endsWith("4")
        || periodStr.endsWith("5") || periodStr.endsWith("6")
        || periodStr.endsWith("7") || periodStr.endsWith("8")
        || periodStr.endsWith("9"))
        periodStr += "th";
    }

    // --I was getting a random undrawn line due to the math, so
    // that's
    // why the for loop is odd. Just accept it.
    textFont(myFont);
    image(statBar, cX + 160, cY - 48, 800, 56);
    text("Miami All-Access", cX + 480, cY - 6);
    text("R", cX+700, cY - 6);
    text("H", cX+800, cY - 6);
    text("E", cX+900, cY - 6);
    //image(maa, cX + 160, cY - 24);
    for (float i = 0; i<254; i +=3.82) {

      stroke(lerpColor(awayColor, black, i/255));
      line(cX+160, round(cY+9+(i/3.82)), cX+959, round(cY+9+(i/3.82)));//tweak 
      stroke(lerpColor(homeColor, black, i/255));
      line(cX+160, round(cY+76+(i/3.82)), cX+959, round(cY+76+(i/3.82)));//tweak
    }
    textFont(font24);
    noStroke();
    fill(255);
    textAlign(LEFT);
    text(awayTeamName, cX + 164, cY + 60);
    text(homeTeamName, cX + 164, cY + 120);
    textAlign(CENTER);
    text(awayTeamScore, cX + 700, cY + 60);
    text(homeTeamScore, cX + 700, cY + 120);
    text(homeTEAM.getHits(), cX+800, cY+60);
    text(awayTEAM.getHits(), cX+800, cY+120);
    text(awayTEAM.getErrors(), cX+900, cY+60);
    text(homeTEAM.getErrors(), cX+900, cY+120);
    fill(255);
    textFont(myFont);
    image(ppBar, cX + 698, cY + 138, 262, 48);//tweak
    text(periodStr, cX + 830, cY + 176);
  }

  public void showPenalty() {
    image(ppBar, x + 988, y + 62, 364, 48);
    noStroke();
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(font18);
    text("PITCHING CHANGE", x + 1024 + 148, y + 90);
  }

  public void showPPBarHome(String ppType) {
    image(ppBar, x+550, y+62, 412, 48);
    textFont(font18);
    fill(255);
    textAlign(CENTER, CENTER);
    text(ppType, x + 564, y +86);
    // text(c.toStringPP(), x + 440, y + 31 + 12);
  }

  public void showPPBarAway(String ppType) {
    image(ppBar, x + 130, y + 62, 412, 48);
    textFont(font18);
    fill(255);
    textAlign(CENTER, CENTER);
    text(ppType, x + 144, y + 86);
    // text(c.toStringPP(), x + 225, y + 31 + 12);
  }



  public void showSponsorInfo(String sponsorInfo) {
    image(statBar, x, y-58, 838, 58);
    textAlign(LEFT, CENTER);
    fill(255);
    textFont(font18);
    if (textWidth(sponsorInfo)>=838)
      textFont(font16);
    if (textWidth(sponsorInfo)>=838)
      textFont(font14);
    if (textWidth(sponsorInfo)>=838)
      textFont(font12);

    text(sponsorInfo, x+15, y-28);
  }

  public void showStatsBar(String stat) {
    image(statBar, x+132, y-58, 858, 58);
    fill(255);
    textFont(font18);
    if (textWidth(stat)>=858)
      textFont(font16);
    if (textWidth(stat)>=858)
      textFont(font14);
    if (textWidth(stat)>=858)
      textFont(font12);

    textAlign(CENTER, CENTER);
    text(stat, x+136+428, y-28);
  }

  public void showLowerThird(BaseballPlayer player, String team, 
  String type, String position, String today) {
    image(sg, ltX, cY+58, 800, 124);
    for (float i = 0; i<=255; i +=3.82) {
      if (team.equals("HOME"))
        stroke(lerpColor(homeColor, black, i/255));
      else stroke(lerpColor(awayColor, black, i/255));
      line(ltX, cY+(i/3.82), ltX+800, cY+(i/3.82));
    }
    //image(maa, ltX, cY);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(font24);

    text(player.getNumber(), ltX + 140, cY + 34);
    text(player.getName(), ltX + 400, cY + 34);

    text(position, ltX + 760, cY + 34);

    fill(0);
    textFont(font16);
    if (!today.equals("False")) {
      textAlign(LEFT, CENTER);
      image(todayBar, ltX, cY+182);
      text(today, ltX+5, cY+194);
    }
    textFont(font18);
    textAlign(CENTER, CENTER);
    if (type.equals("BATTER")) {

      text("GP", ltX + 120, cY + 90);
      text("AVG", ltX + 240, cY + 90);
      text("RBI", ltX + 360, cY + 90);
      text("HR", ltX + 480, cY + 90);
      text("BB", ltX + 600, cY + 90);
      text("SO", ltX + 720, cY + 90);


      fill(255);
      textFont(myFont);
      text(player.getGamesPlayed(), ltX + 120, cY + 146);
      text(""+player.getAvg(), ltX + 240, cY + 146);
      text(player.getRbi(), ltX + 360, cY + 146);
      text(player.getHr(), ltX + 480, cY + 146);
      text(player.getbBB(), ltX + 600, cY + 146);
      text(player.getBso(), ltX + 720, cY + 146);
    }

    else {
      text("IP", ltX + 60, cY + 90);
      text("PC", ltX + 180, cY + 90);
      text("B", ltX + 320, cY + 90);
      text("K", ltX + 470, cY + 90);
      text("BB", ltX + 620, cY + 90);
      text("SO", ltX + 740, cY + 90);

      fill(255);
      textFont(myFont);
      text(""+player.getIpToday(), ltX + 60, cY + 146);
      text(player.getPitchCount(), ltX + 180, cY + 146);
      text(player.getBallsThrown(), ltX + 320, cY + 146);
      text(player.getStrikesThrown(), ltX + 470, cY + 146);
      text(player.getBbToday(), ltX + 620, cY + 146);
      text(player.getkToday(), ltX + 740, cY + 146);
    }
  }

  public void showBattingOrder(BaseballPlayer[] batters, String[]position) {

    for (int i = 0; i <= 800; i++) {
      if (game.getInningMod().equals("Bot"))
        stroke(lerpColor(homeColor, black, ((float) i) / 800));
      else stroke(lerpColor(awayColor, black, 
      ((float) i) / 800));
      line(pX + i, pY, pX + i, pY + 760);
    }

    for (float i = 0; i < 254; i += 5.1) {
      if (game.getInningMod().equals("Bot"))
        stroke(lerpColor(homeColor, black, i / 255));
      else stroke(lerpColor(awayColor, black, i / 255));
      line(pX, round(pY - 12 + (i / 5.1)), pX + 800, round(pY
        - 12 + (i / 5.1)));
    }
    fill(255);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    if (game.getInningMod().equals("Bot"))
      text(game.getHomeTeamName() + " BATTING ORDER", pX+ 400, pY - 24);
    else text(game.getAwayTeamName() + " BATTING ORDER", pX+ 400, pY - 24);


    textFont(font18);

    for (int i=0;i<9;i++) {
      image(statBar, pX+1, pY+46 +(66* i), 800, 40);
      textAlign(LEFT, CENTER); 
      text(pos[i], pX + 30, pY + 66 * (i+1));
      textAlign(CENTER, CENTER);
      text(batters[i].getName(), pX+400, pY+66*(i+1));
      textAlign(LEFT, CENTER);
      text(batters[i].getAvg(), pX+720, pY+66*(i+1));
    }
  }

  public void showDefense(String[] name, String[] position) {
    image(defense, dX, dY, 882,672);
    textFont(font14);
    fill(255);
    textAlign(CENTER);
    for (int i = 0;i<name.length;i++) {
      if (position[i].equals("P"))
        text(name[i], dX + 446, dY + 420);
      if (position[i].equals("C"))
        text(name[i], dX + 446, dY + 606);
      textAlign(RIGHT);
      if (position[i].equals("1B"))
        text(name[i], dX + 636, dY + 380);
      textAlign(LEFT);
      if (position[i].equals("2B"))
        text(name[i], dX + 500, dY + 270);
      textAlign(CENTER);
      if (position[i].equals("SS"))
        text(name[i], dX + 340, dY + 270);
      textAlign(LEFT);
      if (position[i].equals("3B"))
        text(name[i], dX + 262, dY + 380);
      if (position[i].equals("LF"))
        text(name[i], dX + 144, dY + 218);
      textAlign(CENTER);
      if (position[i].equals("CF"))
        text(name[i], dX + 442, dY + 150);
      textAlign(RIGHT);
      if (position[i].equals("RF"))
        text(name[i], dX + 764, dY + 218);
      textAlign(CENTER);
      if (position[i].equals("DH"))
        text("DH: " + name[i], dX + 110, dY + 570);
    }
    textFont(myFont);
    textAlign(CENTER);
    if (game.getInningMod().equals("Top"))
      text(game.getHomeTeamName() + " Defense", dX + 440, 
      dY + 66);
    else text(game.getAwayTeamName() + " Defense", dX + 440, 
    dY + 66);
  }

  public void showPitcher(BaseballPlayer pitcher, String team) {
    for (int i = 0; i <= 255; i++) {
      if (team.equals("HOME"))
        stroke(lerpColor(homeColor, black, ((float) i) / 255));
      else stroke(lerpColor(awayColor, black, 
      ((float) i) / 255));
      line(pX + i, pY, pX + i, pY + 760);
    }

    for (float i = 0; i < 254; i += 5.1) {
      if (team.equals("HOME"))
        stroke(lerpColor(homeColor, black, i / 255));
      else stroke(lerpColor(awayColor, black, i / 255));
      line(pX, round(pY - 50 + (i / 5.1)), pX + 510, round(pY
        - 50 + (i / 5.1)));
    }
    fill(255);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text(pitcher.getName(), pX+ 255, pY - 24);

    textAlign(LEFT, CENTER);
    textFont(font18);

    for (int i=0;i<10;i++) {
      image(statBar, pX+1, pY+46 +(66* i), 506, 40);
    }

    text("APP", pX + 30, pY + 66 * 1);
    text("GS/SV", pX + 30, pY + 66 * 2);
    text("W-L", pX + 30, pY + 66 * 3);
    text("ERA", pX + 30, pY + 66 * 4);
    text("IP", pX + 30, pY + 66 * 5);
    text("H", pX + 30, pY + 66 * 6);
    text("R", pX + 30, pY + 66 * 7);
    text("ER", pX + 30, pY + 66 * 8);
    text("BB", pX + 30, pY + 66 * 9);
    text("SO", pX + 30, pY + 66 * 10);

    textAlign(RIGHT, CENTER);
    text(pitcher.getApp(), pX + 480, pY + 66 * 1);
    text(pitcher.getStarts() + "/" + pitcher.getSaves(), 
    pX + 480, pY + 66 * 2);
    text(pitcher.getWins() + "-" + pitcher.getLosses(), pX + 480, 
    pY + 66 * 3);
    text(""+pitcher.getEra(), pX + 480, pY + 66 * 4);
    text(""+pitcher.getIp(), pX + 480, pY + 66 * 5);
    text(pitcher.getHitsAllowed(), pX + 480, pY + 66 * 6);
    text(pitcher.getRunsAllowed(), pX + 480, pY + 66 * 7);
    text(pitcher.getEr(), pX + 480, pY + 66 * 8);
    text(pitcher.getBb(), pX + 480, pY + 66 * 9);
    text(pitcher.getSo(), pX + 480, pY + 66 * 10);
  }
}


import java.awt.Color;
import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;
import javax.swing.*;
import javax.swing.JColorChooser;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.JWindow;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


PFont defFont;
PFont myFont;
PFont font24;
PFont font18;
PFont font16;
PFont font14;
PFont font12;
PImage defense;
PImage sb;
PImage sg;
PImage maa;
PImage ppBar;
PImage statBar;
PImage grayBase;
PImage yellowBase;
PImage todayBar;
boolean showDefenseChart;
boolean showNewPitcherGraphic = false;
boolean showScoreboard = false;
boolean showPP = false;
boolean firstBase = false;
boolean secondBase = false;
boolean thirdBase = false;
boolean showFinal = false;
boolean showLowerThird = false;
boolean showStatsBar = false;
boolean showSponsor = false;
boolean previousSponsor = false;
boolean penaltyFlag = false;
boolean showCommercial = false;
boolean showBattingOrderGraphic = false;
Color background;
color bg;
BaseballGame game;
JLabel clockCommands, awayName, homeName, awayScore, homeScore, 
clock, awayShotsOnGoal, homeShotsOnGoal;
JFrame controlPanel;
JPanel clockControl, displayControls, clockLabel, status1, 
status2, status3, scoreControl;
JButton  subPlayers, hideGraphics, second, countButton, nextBatter, 
third, first, clearBases, commercial, showBoard, nextPeriod, 
prevPeriod, finalButton, showDef, showBatterSB, showPitchCount, 
showPitcherRecap, showBO, showBatter, sm1, sm2, sm3, hp1, hp3, 
hp2, sm4, hp4, penaltyFlagButton, single, doubleButton, triple, homeRun, walk, 
strikeOut, error, fielderChoice, doublePlay, groundOut, flyOut, sacBunt, sacFly, 
rbiButton, save, showNewPitcher, showPitcherUpdate, sponsorButton, kThrown, hbp, 
ballThrown, kMistake, ballMistake, outUp, foulBall, outDown, foulBallMistake, 
hitInc, hitDec, eInc, eDec;

BaseballTeam homeTEAM, awayTEAM;

JTextField textField;


String statsBarText, ltTeam, ltType, pgType, sponsorText, batterPos, todayText;
BaseballPlayer playerForGraphic, pitcherForGraphic;
String[]positions;
String[]players;
String[]pos;
BaseballPlayer [] bPlayers;
JWindow graphicsFrame;
JComboBox[] awayLineup, homeLineup, awayPosition, homePosition;

void setup() {
  positions = loadStrings("positions.txt");
  // -----------FONTS AND IMAGES--------------//
  defFont = loadFont("Arial-Bold.vlw");
  myFont = loadFont("ArialMT-20.vlw");
  font24 = loadFont("ArialMT-24.vlw");
  font18 = loadFont("ArialMT-18.vlw");
  font16 = loadFont("ArialMT-16.vlw");
  font14 = loadFont("ArialMT-14.vlw");
  font12 = loadFont("ArialMT-12.vlw");
  sb = loadImage("Scoreboard.png");
  sg = loadImage("StatsGraphic.png");
  maa = loadImage("MAA.PNG");
  ppBar = loadImage("PPBar.png");
  statBar = loadImage("StatBar.png");
  defense = loadImage("Defensive arrangement.png");
  grayBase = loadImage("GrayBase.png");
  yellowBase = loadImage("YellowBase.png");
  todayBar = loadImage("TodayBar.png");

  size(1920, 1080);
  smooth();

  game = new BaseballGame();
  background = JColorChooser.showDialog(null, "Background", 
  Color.green);
  bg = color(background.getRed(), background.getGreen(), 
  background.getBlue());
  awayTEAM = new BaseballTeam();
  homeTEAM = new BaseballTeam();
  controlPanel = new JFrame("Scoreboard Control");
  controlPanel.setBounds(100, 50, 800, 700);
  controlPanel.setResizable(false);
  controlPanel.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  controlPanel.setLayout(null);

  awayLineup = new JComboBox[10];
  homeLineup = new JComboBox[10];
  awayPosition = new JComboBox[10];
  homePosition = new JComboBox[10];
  makeClockControl();
  displayControls();
  makeStatusPanel();
  makeScoreControl();
  makeLineup();
  makeRunControl();


  players = new String[10];
  pos = new String[10];
  bPlayers = new BaseballPlayer[9];
  controlPanel.setVisible(true);
  repaint();

  graphicsFrame = new JWindow();
  graphicsFrame.setLayout(null);
  graphicsFrame.setVisible(true);
  graphicsFrame.setBounds(1280, 0, 1920, 1080);
  graphicsFrame.add(this);
  this.frame.setExtendedState(JFrame.ICONIFIED);
  this.frame.setVisible(false);
  todayText = "False";
}

void draw() {
  background(bg);
  if (showDefenseChart)     
    game.getScoreboard().showDefense(players, pos);

  if (showBattingOrderGraphic)
    game.getScoreboard().showBattingOrder(bPlayers, pos);

  if (showLowerThird)
    game.getScoreboard().showLowerThird(playerForGraphic, 
    ltTeam, ltType, batterPos, todayText);

  if (showNewPitcherGraphic) {
    game.getScoreboard().showPitcher(pitcherForGraphic, pgType);
  }


  if (showScoreboard) {
    if (penaltyFlag)
      game.getScoreboard().showPenalty();

    if (showFinal)
      game.displayScoreboard("FINAL");
    if (!showFinal)
      game.displayScoreboard("CLOCK");

    if (showSponsor)
      game.getScoreboard().showSponsorInfo(sponsorText);

    if (showStatsBar)
      game.getScoreboard().showStatsBar(statsBarText);
  }

  if (showCommercial) {

    if (showFinal)
      game.commercial("FINAL");

    //CHECK THIS-----------------------------------------------
    if (!showFinal)
      game.commercial("CLOCK");
  }

  awayScore.setText("" + game.getAwayTeamScore());
  homeScore.setText("" + game.getHomeTeamScore());
  clock.setText(game.getInningMod() +" "+ game.getPeriod() + "    "
    +game.getBalls() + "-"+game.getStrikes());

  if (firstBase)
    first.setText("1B: ON");
  else first.setText("1B: OFF");
  if (secondBase)
    second.setText("2B: ON");
  else second.setText("2B: OFF");
  if (thirdBase)
    third.setText("3B: ON");
  else third.setText("3B: OFF");

  //repaint();
}

void statsBarSetup(String trigger) {
  if (trigger.equals("BATTER")) {
    if (game.getInningMod().equals("Top")) {
      String name1 = (String) awayLineup[game.getAwayBatter()].getSelectedItem();
      BaseballPlayer player = awayTEAM.getPlayers().get(awayLineup[
        game.getAwayBatter()].getSelectedIndex());
      statsBarText = name1 + " ("
        + game.getAwayTeamName() + "):  "
        + player.getAvg() + " AVG, "
        + player.getRbi() + " RBI, "
        + player.getGamesPlayed() + " GP";
    }
    else {
      String name1 = (String) homeLineup[game.getHomeBatter()].getSelectedItem();
      BaseballPlayer player = homeTEAM.getPlayers().get(homeLineup[
        game.getHomeBatter()].getSelectedIndex());
      statsBarText = name1 + " ("
        + game.getHomeTeamName() + "):  "
        + player.getAvg() + " AVG, "
        + player.getRbi() + " RBI, "
        + player.getGamesPlayed() + " GP";
    }
  }

  else {
    if (game.getInningMod().equals("Bot")) {
      String name1 = (String) awayLineup[9].getSelectedItem();
      BaseballPlayer player = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      statsBarText = name1 + " ("
        + game.getAwayTeamName() + "):  "
        + player.getPitchCount() + " PITCHES, "
        + player.getBallsThrown() + " BALLS, "
        + player.getStrikesThrown() + " STRIKES";
    }
    else {
      String name1 = (String) homeLineup[9].getSelectedItem();
      BaseballPlayer player = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      statsBarText = name1 + " ("
        + game.getHomeTeamName() + "):  "
        + player.getPitchCount() + " PITCHES, "
        + player.getBallsThrown() + " BALLS, "
        + player.getStrikesThrown() + " STRIKES";
    }
  }
}


void bLowerThirdSetup() {
  if (game.getInningMod().equals("Top")) {
    playerForGraphic = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
    batterPos =(String) awayPosition[game.getAwayBatter()].getSelectedItem();
  }
  else {
    playerForGraphic = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
    batterPos =(String) homePosition[game.getHomeBatter()].getSelectedItem();
  }
  if (game.getInningMod().equals("Top"))
    ltTeam = "AWAY";

  else ltTeam = "HOME";

  ltType = "BATTER";

  if (playerForGraphic.getToday().size()>0) {
    StringBuilder today = new StringBuilder();
    today.append("TODAY: ");
    for (int i = 0; i<playerForGraphic.getToday().size(); i++) {
      today.append(playerForGraphic.getToday().get(i));
      if (i < playerForGraphic.getToday().size() -1)
        today.append(", ");
    }
    todayText = today.toString();
  }
  else todayText = "False";
}

void pitcherRecapSetup() {
  if (game.getInningMod().equals("Bot"))
    playerForGraphic = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());

  else playerForGraphic = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());

  if (game.getInningMod().equals("Top"))
    ltTeam = "HOME";

  else ltTeam = "AWAY";

  ltType = "PITCHER RECAP";
  batterPos = "P";
}


void checkSponsor() {
  if (showSponsor)
    previousSponsor = true;
  else previousSponsor = false;
}

void defensePrep() {
  if (game.getInningMod().equals("Top")) {
    for (int i = 0; i<homeLineup.length; i++) {
      String person =(String)homeLineup[i].getSelectedItem(); 
      players[i] = person.substring(person.indexOf(" ")+1);
      pos[i] = (String)homePosition[i].getSelectedItem();
    }
  }
  else {
    for (int i = 0; i<awayLineup.length;i++) {
      String person =(String)awayLineup[i].getSelectedItem(); 
      players[i] = person.substring(person.indexOf(" ")+1);
      pos[i] = (String)awayPosition[i].getSelectedItem();
    }
  }
}

void newPitcherSetup() {
  if (game.getInningMod().equals("Top")) {
    pitcherForGraphic = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
    pgType = "HOME";
  }
  else {
    pitcherForGraphic =awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
    pgType = "AWAY";
  }
}

void BOPrep() {
  if (game.getInningMod().equals("Bot")) {
    for (int i = 0; i<9; i++) {
      bPlayers[i] = homeTEAM.getPlayers().get(homeLineup[i].getSelectedIndex());
      pos[i] = (String)homePosition[i].getSelectedItem();
    }
  }
  else {
    for (int i = 0; i< 9; i++) {
      bPlayers[i] = awayTEAM.getPlayers().get(awayLineup[i].getSelectedIndex());
      pos[i] = (String)awayPosition[i].getSelectedItem();
    }
  }
}

void hitUpdater(String base) {
  BaseballPlayer batter;
  BaseballPlayer pitcher;
  if (game.getInningMod().equals("Top")) {
    batter = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
    pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
  }

  else {
    batter = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
    pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
  }

  batter.getToday().add(base);
  batter.setiHits(batter.getiHits()+1);
  batter.setAtBats(batter.getAtBats()+1);
  batter.calculateAvg();

  pitcher.setHitsAllowed(pitcher.getHitsAllowed()+1);
  pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
  pitcher.setPitchCount(pitcher.getPitchCount()+1);
  hitInc.doClick();
}

void walk(String walkType) {
  BaseballPlayer batter;
  BaseballPlayer pitcher;
  if (game.getInningMod().equals("Top")) {
    batter = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
    pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
  }

  else {
    batter = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
    pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
  }

  batter.getToday().add(walkType);


  ballThrown.doClick();

  if (walkType.equals("Walk")) {
    pitcher.setBb(pitcher.getBb()+1);
    batter.setbBB(batter.getbBB()+1);
    pitcher.setBbToday(pitcher.getBbToday()+1);
  }

  firstBase = true;
}

void sacrifice(String sacType) {
  BaseballPlayer batter;
  BaseballPlayer pitcher;
  if (game.getInningMod().equals("Top")) {
    batter = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
    pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
  }

  else {
    batter = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
    pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
  }

  batter.getToday().add("Sac " + sacType);
  pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
  pitcher.setPitchCount(pitcher.getPitchCount()+1);
  outUp.doClick();
}

void checkEarnedRun(int runsScored) {
  BaseballPlayer pitcher;
  if (game.getInningMod().equals("Top")) 
    pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());

  else pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());

  int choice = JOptionPane.showConfirmDialog(null, 
  "All runs earned?", 
  "Message", 
  JOptionPane.YES_NO_OPTION);

  if (choice==0) {
    pitcher.setrToday(pitcher.getrToday()+runsScored);
    pitcher.setRunsAllowed(pitcher.getRunsAllowed()+runsScored);
    pitcher.setEr(pitcher.getEr()+runsScored);
  }

  else {
    int ErunsToCurrentPitcher;
    int UErunsToCurrentPitcher;

    ErunsToCurrentPitcher = Integer.parseInt(JOptionPane.showInputDialog(null, "ER on the play:"));
    UErunsToCurrentPitcher = Integer.parseInt(JOptionPane.showInputDialog(null, "Unearned on the play:"));
    pitcher.setEr(pitcher.getEr() + ErunsToCurrentPitcher);
    pitcher.setRunsAllowed(pitcher.getRunsAllowed()+UErunsToCurrentPitcher);
    pitcher.setrToday(pitcher.getrToday()+UErunsToCurrentPitcher);
  }
}

void rbiChecker() {
  BaseballPlayer batter;

  if (game.getInningMod().equals("Top")) {
    batter = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
  }

  else {
    batter = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
  }

  int RBItoAdd = Integer.parseInt(JOptionPane.showInputDialog(null, "RBI on the play:"));

  batter.setRbi(batter.getRbi()+RBItoAdd);
}

void genericOut(String typeOfOut) {
  BaseballPlayer batter;
  BaseballPlayer pitcher;
  outUp.doClick();
  if (game.getInningMod().equals("Top")) {
    batter = awayTEAM.getPlayers().get(awayLineup[game.getAwayBatter()].getSelectedIndex());
    pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
  }

  else {
    batter = homeTEAM.getPlayers().get(homeLineup[game.getHomeBatter()].getSelectedIndex());
    pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
  }

  batter.getToday().add(typeOfOut);

  batter.setAtBats(batter.getAtBats()+1);
  batter.calculateAvg();

  pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
  pitcher.setPitchCount(pitcher.getPitchCount()+1);
}


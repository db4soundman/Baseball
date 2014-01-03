void makeClockControl() {
  clockControl = new JPanel();
  clockControl.setLayout(new BoxLayout(clockControl, 1));
  clockControl.setBounds(700, 200, 100, 320);
  clockControl.setAlignmentX(Component.RIGHT_ALIGNMENT);

  nextPeriod = new JButton("Next period");
  nextPeriod.setEnabled(true); 
  nextPeriod.addActionListener(new ButtonResponder());
  prevPeriod = new JButton("Prev period");
  prevPeriod.setEnabled(true);
  prevPeriod.addActionListener(new ButtonResponder());

  clockControl.add(nextPeriod);
  clockControl.add(prevPeriod);
  clockControl.setVisible(true);

  countButton = new JButton("Count");
  countButton.setEnabled(true); 
  countButton.addActionListener(new ButtonResponder());
  clockControl.add(countButton);

  finalButton = new JButton("FINAL");
  finalButton.setEnabled(true); 
  finalButton.addActionListener(new ButtonResponder());
  clockControl.add(finalButton);

  penaltyFlagButton = new JButton("P.C.");
  penaltyFlagButton.addActionListener(new ButtonResponder());
  clockControl.add(penaltyFlagButton);

  nextBatter = new JButton("Next Batter");
  quickButton(clockControl, nextBatter);

subPlayers = new JButton("Subs");
quickButton(clockControl, subPlayers);

  controlPanel.add(clockControl);
  clockLabel = new JPanel();
  clockCommands = new JLabel("Master Commands");
  clockLabel.setBounds(675, 180, 125, 20);
  clockLabel.add(clockCommands);
  clockLabel.setVisible(true);
  controlPanel.add(clockLabel);
}

void displayControls() {
  displayControls = new JPanel();
  displayControls.setLayout(new BoxLayout(displayControls, 0));
  displayControls.setBounds(100, 40, 380, 50);
  commercial = new JButton("Show comm.");
  commercial.setEnabled(true);
  commercial.addActionListener(new ButtonResponder()); 
  showBoard = new JButton("Show scoreboard");
  showBoard.setEnabled(true);
  showBoard.addActionListener(new ButtonResponder());
  hideGraphics = new JButton("Hide All");
  hideGraphics.setEnabled(true);
  hideGraphics.addActionListener(new ButtonResponder());
  displayControls.add(commercial);
  displayControls.add(showBoard);
  displayControls.add(hideGraphics);
  displayControls.setVisible(true);
  controlPanel.add(displayControls);

  JPanel sponsorPanel = new JPanel();
  sponsorPanel.setBounds(0, 10, 550, 30);
  sponsorPanel.setLayout(new BoxLayout(sponsorPanel, 0));
  textField = new JTextField("McCullough Hyde Memorial Hospital - IMG Sports Network");
  textField.setEditable(true);
  sponsorPanel.add(textField);
  sponsorButton = new JButton("Show Sponsor");
  sponsorButton.addActionListener(new ButtonResponder());
  sponsorPanel.add(sponsorButton);

  controlPanel.add(sponsorPanel);
}

void makeStatusPanel() {
  status1 = new JPanel();
  status2 = new JPanel();
  status3 = new JPanel();
  status1.setBounds(500, 10, 300, 50);
  status2.setBounds(500, 60, 300, 50);
  status3.setBounds(700, 30, 100, 50);
  awayName = new JLabel(game.getAwayTeamName());
  homeName = new JLabel(game.getHomeTeamName());
  awayScore = new JLabel(""+game.getAwayTeamScore());
  homeScore = new JLabel(""+game.getHomeTeamScore());
  clock = new JLabel();
  status1.add(awayName);
  status2.add(homeName);
  status1.add(awayScore);
  status2.add(homeScore);
  status3.add(clock);
  controlPanel.add(status1);
  controlPanel.add(status2);
  controlPanel.add(status3);
}

void makeScoreControl() {
  JLabel title = new JLabel("Base Controls");
  JPanel scoreTitle = new JPanel();
  scoreTitle.setBounds(554, 180, 100, 20);
  scoreTitle.add(title);
  controlPanel.add(scoreTitle);
  scoreControl = new JPanel();
  scoreControl.setBounds(520, 200, 150, 60);

  scoreControl.setLayout(new GridLayout(2, 2));
  third = new JButton("3B: OFF");
  third.setEnabled(true);
  clearBases = new JButton("Clear");
  clearBases.setEnabled(true);
  second = new JButton("2B: OFF");
  second.setEnabled(true);
  first = new JButton("1B: OFF");
  first.setEnabled(true);
  third.addActionListener(new ButtonResponder());
  clearBases.addActionListener(new ButtonResponder());
  first.addActionListener(new ButtonResponder());
  second.addActionListener(new ButtonResponder());

  scoreControl.add(third);
  scoreControl.add(second);
  scoreControl.add(clearBases);
  scoreControl.add(first);
  controlPanel.add(scoreControl);


  JPanel sogControl = new JPanel();
  sogControl.setBounds(500, 400, 200, 50);
  sogControl.setLayout(new GridLayout(2, 4));
  foulBall = new JButton("F");
  outUp = new JButton("O");
  foulBallMistake = new JButton("F-1");
  outDown = new JButton("O-1");
  ballThrown = new JButton("B");
  ballThrown.addActionListener(new ButtonResponder());
  sogControl.add(ballThrown);
  kThrown = new JButton("K");
  kThrown.addActionListener(new ButtonResponder());
  sogControl.add(kThrown);
  sogControl.add(foulBall);
  sogControl.add(outUp);
  ballMistake = new JButton("B-1");
  ballMistake.addActionListener(new ButtonResponder());
  sogControl.add(ballMistake);
  kMistake = new JButton("K-1");
  kMistake.addActionListener(new ButtonResponder());
  sogControl.add(kMistake);


  foulBall.addActionListener(new ButtonResponder());
  outUp.addActionListener(new ButtonResponder());
  foulBallMistake.addActionListener(new ButtonResponder());
  outDown.addActionListener(new ButtonResponder());


  sogControl.add(foulBallMistake);
  sogControl.add(outDown);
  controlPanel.add(sogControl);
}


void makeLineup() {
  JPanel graphicsSector = new JPanel();
  graphicsSector.setLayout(new GridLayout(10, 4));
  graphicsSector.setBounds(5, 250, 400, 400);





  makeJCombo(graphicsSector);




  JPanel graphicsButtons = new JPanel();
  graphicsButtons.setBounds(420, 600, 290, 80);
  graphicsButtons.setLayout(new GridLayout(3, 2));
  showBO = new JButton("Show BO");
  showBatter = new JButton("Batter");
  showNewPitcher = new JButton("New Pitcher");
  showPitcherUpdate = new JButton("P. Update");
  showDef = new JButton("Defense");
  showPitcherRecap = new JButton("P. Rcp");
  showBatterSB = new JButton("Bat SB");


  save = new JButton("Save");
  graphicsButtons.add(showBO);
  graphicsButtons.add(showDef);
  graphicsButtons.add(showNewPitcher);
  graphicsButtons.add(showBatter);
  graphicsButtons.add(showPitcherRecap);
  graphicsButtons.add(showPitcherUpdate);
  graphicsButtons.add(showBatterSB);

  graphicsButtons.add(save);

  showBO.addActionListener(new ButtonResponder());
  showBatter.addActionListener(new ButtonResponder());
  showDef.addActionListener(new ButtonResponder());
  showPitcherRecap.addActionListener(new ButtonResponder());
  showNewPitcher.addActionListener(new ButtonResponder());
  showPitcherUpdate.addActionListener(new ButtonResponder());
  showBatterSB.addActionListener(new ButtonResponder());

  save.addActionListener(new ButtonResponder());

  controlPanel.add(graphicsButtons);

  controlPanel.add(graphicsSector);
}

void makeRunControl() {
  JPanel penalties = new JPanel();
  penalties.setBounds(550, 300, 100, 95);
  penalties.setLayout(new GridLayout(7, 2));
  sm1 = new JButton("-1");
  sm2 = new JButton("-2");
  sm3 = new JButton("-3");
  hp1 = new JButton("+1");
  hp2 = new JButton("+2");
  hp3 = new JButton("+3");
  hp4 = new JButton("+4");
  sm4 = new JButton("-4");
  hitInc = new JButton ("Hit+");
  hitDec = new JButton("Hit -");
  eInc = new JButton("E+");
  eDec = new JButton("E -");



  sm1.addActionListener(new ButtonResponder());
  sm2.addActionListener(new ButtonResponder());
  sm3.addActionListener(new ButtonResponder());
  sm4.addActionListener(new ButtonResponder());
  hp1.addActionListener(new ButtonResponder());
  hp2.addActionListener(new ButtonResponder());
  hp3.addActionListener(new ButtonResponder());
  hp4.addActionListener(new ButtonResponder());

  penalties.add(sm1);
  penalties.add(hp1);
  penalties.add(sm2);
  penalties.add(hp2);
  penalties.add(sm3);
  penalties.add(hp3);
  penalties.add(sm4);
  penalties.add(hp4);
  quickButton(penalties, hitDec);
  quickButton(penalties, hitInc);
  quickButton(penalties, eDec);
  quickButton(penalties, eInc);
  controlPanel.add(penalties);

  JPanel resultTracker = new JPanel();
  resultTracker.setBounds(500, 460, 200, 100);
  resultTracker.setLayout(new GridLayout(5, 5));
  single = new JButton("1B");
  doubleButton = new JButton("2B");
  triple = new JButton("3B");
  homeRun = new JButton("HR");
  walk = new JButton("BB");
  strikeOut  = new JButton("K");
  error = new JButton("E");
  fielderChoice = new JButton("FC");
  doublePlay = new JButton("DP");
  groundOut = new JButton("GO");
  flyOut = new JButton("FO");
  sacBunt  = new JButton("Sac B");
  sacFly = new JButton("Sac F");
  rbiButton = new JButton("RBI");
  hbp = new JButton("HBP");

  quickButton(resultTracker, single);
  quickButton(resultTracker, doubleButton);
  quickButton(resultTracker, triple);
  quickButton(resultTracker, homeRun);
  quickButton(resultTracker, walk);
  quickButton(resultTracker, hbp);
  quickButton(resultTracker, strikeOut);
  quickButton(resultTracker, error);
  quickButton(resultTracker, fielderChoice);
  quickButton(resultTracker, doublePlay);
  quickButton(resultTracker, groundOut);
  quickButton(resultTracker, flyOut);
  quickButton(resultTracker, sacBunt);
  quickButton(resultTracker, sacFly);
  quickButton(resultTracker, rbiButton);

  controlPanel.add(resultTracker);
}

void makeJCombo(JPanel graphicsSector) {
  //--------NAME SELECTORS-------//
  ArrayList<String> homeNames = new ArrayList<String>();
  ArrayList<String> awayNames = new ArrayList<String>();
  for (BaseballPlayer p:homeTEAM.getPlayers()) {
    homeNames.add(p.getName());
  }
  for (BaseballPlayer p:awayTEAM.getPlayers()) {
    awayNames.add(p.getName());
  }
  for (int i = 0; i<10; i++) {
    JComboBox v = new JComboBox(awayNames.toArray());
    awayLineup[i] = v;
    graphicsSector.add(v);
    JComboBox p = new JComboBox(positions);
    awayPosition[i] = p;
    graphicsSector.add(p);
    JComboBox h = new JComboBox(homeNames.toArray());
    homeLineup[i] = h;
    graphicsSector.add(h);
    JComboBox pos= new JComboBox(positions);
    homePosition[i] = pos;
    graphicsSector.add(pos);
  }
}

void quickButton(JPanel panel, JButton button) {
  panel.add(button);
  button.addActionListener(new ButtonResponder());
}


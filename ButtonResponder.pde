private class ButtonResponder implements ActionListener {

  public void actionPerformed(ActionEvent e) {

    if (e.getSource()==subPlayers) {
      for (int i = 0; i<9; i++) {
        awayTEAM.getPlayers().get(awayLineup[i].getSelectedIndex()).setWasInGame(true);
        homeTEAM.getPlayers().get(homeLineup[i].getSelectedIndex()).setWasInGame(true);
      }
      awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex()).setPitchedToday(true);
      homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex()).setPitchedToday(true);
    }

    if (e.getSource()==nextPeriod)
      game.nextInning();

    if (e.getSource()==prevPeriod) {
      game.prevInning();
    }

    if (e.getSource()==countButton) {
      showFinal = false;
    }

    if (e.getSource()==finalButton) {
      showFinal = true;
    }

    if (e.getSource()==penaltyFlagButton) {
      penaltyFlag = !penaltyFlag;
    }

    if (e.getSource()==nextBatter) {
      game.setBalls(0);
      game.setStrikes(0);
      if (game.getInningMod().equals("Top"))
        game.setAwayBatter(game.getAwayBatter()+1);
      else game.setHomeBatter(game.getHomeBatter()+1);
    }

    if (e.getSource()==commercial) {
      showLowerThird = false;
      showCommercial= true;

      showScoreboard = false;
    }

    if (e.getSource()==showBoard) {
      showScoreboard = true;
      showCommercial = false;
    }

    if (e.getSource()==hideGraphics) {
      showScoreboard = false;
      showCommercial = false;
      showLowerThird = false;
    }

    if (e.getSource()==sponsorButton) {
      showSponsor = !showSponsor;
      if (showSponsor) {
        sponsorButton.setText("Hide Sponsor");
        sponsorText = textField.getText();
      }
      else sponsorButton.setText("Show Sponsor");
    }

    if (e.getSource()==eInc) {
      if (game.getInningMod().equals("Top"))
        homeTEAM.setErrors(homeTEAM.getErrors()+1);
      else awayTEAM.setErrors(awayTEAM.getErrors()+1);
    }

    if (e.getSource()==eDec) {
      if (game.getInningMod().equals("Top"))
        homeTEAM.setErrors(homeTEAM.getErrors()-1);
      else awayTEAM.setErrors(awayTEAM.getErrors()-1);
    }

    if (e.getSource()==hitInc) {
      if (game.getInningMod().equals("Bot"))
        homeTEAM.setHits(homeTEAM.getHits()+1);
      else awayTEAM.setHits(awayTEAM.getHits()+1);
    }

    if (e.getSource()==hitDec) {
      if (game.getInningMod().equals("Bot"))
        homeTEAM.setHits(homeTEAM.getHits()-1);
      else awayTEAM.setHits(awayTEAM.getHits()-1);
    }

    if (e.getSource()==third) {
      thirdBase = !thirdBase;
    }

    if (e.getSource()==clearBases) {
      firstBase = false;
      secondBase = false;
      thirdBase = false;
    }

    if (e.getSource()==second) {
      secondBase = !secondBase;
    }

    if (e.getSource()==first) {
      firstBase = !firstBase;
    }


    if (e.getSource()==showNewPitcher) {
      showNewPitcherGraphic = !showNewPitcherGraphic;
      newPitcherSetup();
    }

    if (e.getSource()==showPitcherUpdate) {
      statsBarSetup("PITCHER");
      showStatsBar = !showStatsBar;
    }

    if (e.getSource()==showBatterSB) {
      statsBarSetup("BATTER");
      showStatsBar = !showStatsBar;
    }


    if (e.getSource()==showBO) {
      showBattingOrderGraphic = !showBattingOrderGraphic;
      showDefenseChart = false;
      BOPrep();
    }

    if (e.getSource()==showBatter) {
      showLowerThird = !showLowerThird;

      bLowerThirdSetup();
    }

    if (e.getSource()==showDef) {
      showDefenseChart = !showDefenseChart;
      showBattingOrderGraphic = false;
      defensePrep();
    }

    if (e.getSource()==showPitcherRecap) {
      showLowerThird = !showLowerThird;
      pitcherRecapSetup();
    }

    if (e.getSource()==sm1) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()-1);
      else game.setHomeTeamScore(game.getHomeTeamScore()-1);
    }

    if (e.getSource()==sm2) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()-2);
      else game.setHomeTeamScore(game.getHomeTeamScore()-2);
    }
    if (e.getSource()==sm3) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()-3);
      else game.setHomeTeamScore(game.getHomeTeamScore()-3);
    }
    if (e.getSource()==hp1) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()+1);
      else game.setHomeTeamScore(game.getHomeTeamScore()+1);
      checkEarnedRun(1);
      rbiChecker();
    }
    if (e.getSource()==hp2) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()+1);
      else game.setHomeTeamScore(game.getHomeTeamScore()+1);
      checkEarnedRun(2);
      rbiChecker();
    }
    if (e.getSource()==hp3) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()+1);
      else game.setHomeTeamScore(game.getHomeTeamScore()+1);
      checkEarnedRun(3);
      rbiChecker();
    }

    if (e.getSource()==kThrown) {
      game.setStrikes(game.getStrikes()+1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
      pitcher.setPitchCount(pitcher.getPitchCount()+1);
    }

    if (e.getSource()==ballThrown) {
      game.setBalls(game.getBalls()+1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setBallsThrown(pitcher.getBallsThrown()+1);
      pitcher.setPitchCount(pitcher.getPitchCount()+1);
    }

    if (e.getSource()==kMistake) {
      game.setStrikes(game.getStrikes()-1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setStrikesThrown(pitcher.getStrikesThrown()-1);
      pitcher.setPitchCount(pitcher.getPitchCount()-1);
    }

    if (e.getSource()==ballMistake) {
      game.setBalls(game.getBalls()-1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setBallsThrown(pitcher.getBallsThrown()-1);
      pitcher.setPitchCount(pitcher.getPitchCount()-1);
    }

    if (e.getSource()==outUp) {
      game.setOuts(game.getOuts()+1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setIp(1);
      pitcher.setIpToday(1);
    }

    if (e.getSource()==foulBall) {
      if (game.getStrikes()<2)
        kThrown.doClick();
      else {
        BaseballPlayer pitcher;
        if (game.getInningMod().equals("Top")) 
          pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
        else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
        pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
        pitcher.setPitchCount(pitcher.getPitchCount()+1);
      }
    }

    if (e.getSource()==outDown) {
      game.setOuts(game.getOuts()-1);
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setIp(-1);
      pitcher.setIpToday(-1);
    }

    if (e.getSource()==foulBallMistake) {
      BaseballPlayer pitcher;
      if (game.getInningMod().equals("Top")) 
        pitcher = homeTEAM.getPlayers().get(homeLineup[9].getSelectedIndex());
      else  pitcher = awayTEAM.getPlayers().get(awayLineup[9].getSelectedIndex());
      pitcher.setStrikesThrown(pitcher.getStrikesThrown()-1);
      pitcher.setPitchCount(pitcher.getPitchCount()-1);
    }

    if (e.getSource()==save) {
      awayTEAM.save();
      homeTEAM.save();
    }



    if (e.getSource()==sm4) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()-4);
      else game.setHomeTeamScore(game.getHomeTeamScore()-4);
    }

    if (e.getSource()==hp4) {
      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()+4);
      else game.setHomeTeamScore(game.getHomeTeamScore()+4);
      checkEarnedRun(4);
      rbiChecker();
    }

    if (e.getSource()==single) {
      hitUpdater("1B");
      firstBase = true;
    }

    if (e.getSource()==doubleButton) {
      hitUpdater("2B");
      secondBase = true;
    }

    if (e.getSource()==triple) {
      hitUpdater("3B");
      thirdBase = true;
    }

    if (e.getSource() ==homeRun) {
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

      batter.getToday().add("HR");
      batter.setiHits(batter.getiHits()+1);
      batter.setAtBats(batter.getAtBats()+1);
      batter.setHr(batter.getHr()+1);
      batter.calculateAvg();

      int count = 1;
      if (firstBase)
        count++;
      if (secondBase)
        count++;
      if (thirdBase)
        count++;

      batter.setRbi(batter.getRbi()+count);

      if (game.getInningMod().equals("Top"))
        game.setAwayTeamScore(game.getAwayTeamScore()+count);
      else game.setHomeTeamScore(game.getHomeTeamScore()+count);

      pitcher.setHitsAllowed(pitcher.getHitsAllowed()+1);
      pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
      pitcher.setPitchCount(pitcher.getPitchCount()+1);
      hitInc.doClick();
      checkEarnedRun(count);
      clearBases.doClick();
    }

    if (e.getSource()==walk) {
      walk("Walk");
    }

    if (e.getSource()==hbp) {
      walk("HBP");
    }

    if (e.getSource()==sacBunt) {
      sacrifice("Bunt");
    }

    if (e.getSource()==sacFly) {
      sacrifice("Fly");
    }

    if (e.getSource()==rbiButton) {
      rbiChecker();
    }

    if (e.getSource()==fielderChoice) {
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

      batter.getToday().add("FC");

      batter.setAtBats(batter.getAtBats()+1);
      batter.calculateAvg();

      pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
      pitcher.setPitchCount(pitcher.getPitchCount()+1);
    }

    if (e.getSource()==error) {
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

      batter.getToday().add("Reached on Error");

      batter.setAtBats(batter.getAtBats()+1);
      batter.calculateAvg();

      pitcher.setStrikesThrown(pitcher.getStrikesThrown()+1);
      pitcher.setPitchCount(pitcher.getPitchCount()+1);
      eInc.doClick();
    }

    if (e.getSource()==strikeOut) {
      kThrown.doClick();
      outUp.doClick();
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

      batter.getToday().add("K");

      batter.setAtBats(batter.getAtBats()+1);
      batter.setBso(batter.getBso()+1);
      batter.calculateAvg();


      pitcher.setSo(pitcher.getSo()+1);
      pitcher.setkToday(pitcher.getkToday()+1);
    }

    if (e.getSource()==groundOut) {
      genericOut("GO");
    }

    if (e.getSource()==flyOut) {
      genericOut("FO");
    }

    if (e.getSource()==doublePlay) {
      genericOut("DP");
      outUp.doClick();
    }
  }
}


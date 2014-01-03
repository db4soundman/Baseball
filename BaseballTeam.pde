import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;
import javax.swing.JFileChooser;
import java.io.FileNotFoundException;

/**
 * 
 */

/**
 * @author Doug Blase
 * 
 */
public class BaseballTeam {

  private int hits;
  private int errors;
  private ArrayList<BaseballPlayer> players;

  public BaseballTeam() {
    this.hits = 0;
    this.errors = 0;
    Scanner input;
    File playerData;
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.showOpenDialog(null);
    playerData = fileChooser.getSelectedFile();
    try {
      input = new Scanner(playerData);

      players = new ArrayList<BaseballPlayer>();
      while (input.hasNext()) {
        players.add(new BaseballPlayer(input));
      }
      input.close();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

  }

  /**
   * @return the hits
   */
  public int getHits() {
    return hits;
  }

  /**
   * @param hits
   *            the hits to set
   */
  public void setHits(int hits) {
    this.hits = hits;
  }

  /**
   * @return the errors
   */
  public int getErrors() {
    return errors;
  }

  /**
   * @param errors
   *            the errors to set
   */
  public void setErrors(int errors) {
    this.errors = errors;
  }

  /**
   * @return the players
   */
  public ArrayList<BaseballPlayer> getPlayers() {
    return players;
  }
  
   public void save() {
    File playerData;
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.showSaveDialog(null);
    playerData = fileChooser.getSelectedFile();
    PrintWriter output;
    try {
      output = new PrintWriter(playerData);
      for (BaseballPlayer p : players) {
        output.println(p.getName() + " " +p.getNumber());
        output.println(p.toString());
      }
      output.close();
    }
    catch (FileNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }


}


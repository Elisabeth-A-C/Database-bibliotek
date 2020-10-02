import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;
boolean displayStartScreen = true;
boolean overBox = false;
boolean locked = false;
String username = "";
String password = "";
int screenNumber = 0;

SQLite bibliotek_db;

void setup() {
  size(1500, 900);

  bibliotek_db = new SQLite( this, "data/bibliotek.db" );

  if (bibliotek_db.connect()) {
    bibliotek_db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    while (bibliotek_db.next()) {
      println( bibliotek_db.getString("Name"));
      if (bibliotek_db.connect()) {
        bibliotek_db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
        while (bibliotek_db.next()) {
          println( bibliotek_db.getString("Name"));
        }  
        bibliotek_db.query("SELECT Password FROM Brugere WHERE Brugernavn='Ceci'" );
        while (bibliotek_db.next()) {
          println( bibliotek_db.getString("Password"));
        }
      }
    }
  }
}

void draw() {

  if (screenNumber == 0) {
    background(255);
    fill(0);
    textSize(65);
    text("LOG IN", 630, 300);
    textSize(50);
    text("BRUGERNAVN:  " + username, 450, 380);
    text("PASSWORD:     " + password, 450, 440);
    fill(125);
    rect(623, 510, 250, 40, 8);
    fill(255);
    textSize(30);
    text("LOG IN", 696, 540);
    fill(205, 50);
    rect(10, 10, 1480, 880, 8);
    rect(840, 345, 250, 40, 8);
    rect(840, 405, 250, 40, 8);
  }
  
  if (screenNumber == 1) {
  background(0);
  
  }


if (screenNumber == 0 &&
  mouseX > 623 && mouseX < 873 && 
  mouseY > 510 && mouseY < 540) {
  overBox = true;  
  if (!locked) { 
    stroke(255); 
    fill(153);
  }
} else {
  stroke(153);
  fill(153);
  overBox = false;
}

}

void mousePressed() {
  if (overBox) { 
    locked = true; 
    screenNumber = min(screenNumber +1, 1);
  }
}
  //void mouseClicked() {
  //  if (mouseX >= 840 && 1190 <= mouseX && mouseY >= 405 && 445 <= mouseY) {
  //    screenNumber = min(screenNumber + 1,1);
  //  }
  //if (displayStartScreen == true) {
  //  if (username.length() < 4 && (key >= 'A' && key <= 'Z')) {
  //    username = username + key;
  //  }
  //  if (password.length() < 4 && (key >= 'A' && key <= 'Z')) {
  //    password = password + key;
  //  }
  //}

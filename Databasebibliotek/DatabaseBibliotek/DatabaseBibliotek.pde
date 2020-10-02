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
        bibliotek_db.query("SELECT Navn FROM Brugere WHERE Brugernavn='Ceci'" );
        while (bibliotek_db.next()) {
          username = new String (bibliotek_db.getString("Navn"));
          println(username);
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
  background(255);
   fill(205, 50);
   rect(10, 10, 1480, 880, 8);
   fill(0);
   line(width/2, 100, width/2, height); 
   line(10, 100, width-10, 100);
   line(10, 180, width-10, 180);
   line(10, 260, width-10, 260);
   line(10, 340, width-10, 340);
   line(10, 420, width-10, 420);
   line(10, 500, width-10, 500);
   line(10, 580, width-10, 580);
   line(10, 660, width-10, 660);
   line(10, 740, width-10, 740);
   line(10, 820, width-10, 820);
   line(10, 900, width-10, 900);
   textSize(30);
   text("NAVN ", 20, 60);
   textSize(30);
   text("ID ", 1440, 60);
   text("Titel ", 350, 160);
   text("Forfatter ", 1070, 160);
  }
  
  if (screenNumber == 2) {
   background(255);
   fill(205, 50);
   rect(10, 10, 1480, 880, 8);
   fill(0);
   line(width/2, 100, width/2, height); 
   line(10, 100, width-10, 100);
   line(10, 180, width-10, 180);
   line(10, 260, width-10, 260);
   line(10, 340, width-10, 340);
   line(10, 420, width-10, 420);
   line(10, 500, width-10, 500);
   line(10, 580, width-10, 580);
   line(10, 660, width-10, 660);
   line(10, 740, width-10, 740);
   line(10, 820, width-10, 820);
   line(10, 900, width-10, 900);
   textSize(30);
   text("NAVN ", 20, 60);
   textSize(30);
   text("ID ", 1440, 60);
   text("Elev ", 350, 160);
   text("Hold ", 1070, 160);
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

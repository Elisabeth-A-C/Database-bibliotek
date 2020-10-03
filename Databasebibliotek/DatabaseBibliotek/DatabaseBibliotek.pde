import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;
import controlP5.*;
ControlP5 cp5;
boolean displayStartScreen = true;
boolean overBox = false;
boolean locked = false;
String username = "";
String password = "";
int screenNumber = 0;
int i = 0;

SQLite bibliotek_db;

void setup() {
  size(1500, 900);

  PFont font = createFont("arial", 30);

  cp5 = new ControlP5(this); 

  cp5.addTextfield("usernameFelt")
    .setPosition(840, 345)
    .setSize(250, 40)
    .setFocus(true)
    .setColor(color(0))
    .setColorBackground(color(255, 255, 255))
    .setFont(font);

  cp5.addTextfield("passwordFelt")
    .setPosition(840, 405)
    .setSize(250, 40)
    .setFocus(true)
    .setColor(color(0))
    .setColorBackground(color(255, 255, 255))
    .setFont(font); 

  bibliotek_db = new SQLite( this, "data/bibliotek.db" );

  if (!bibliotek_db.connect()) {
    //  bibliotek_db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    //  while (bibliotek_db.next()) {
    //    println( bibliotek_db.getString("Name"));
    //    if (bibliotek_db.connect()) {
    //      bibliotek_db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
    //      while (bibliotek_db.next()) {
    //        println( bibliotek_db.getString("Name"));
    //      }  
    //      bibliotek_db.query("SELECT Navn FROM Brugere WHERE Brugernavn='Ceci'" );
    //      while (bibliotek_db.next()) {
    //        username = new String (bibliotek_db.getString("Navn"));
    //        println(username);
    //      }
    //    }
    //  }
    exit();
  }
}

void draw() {

  if (screenNumber == 0) {

    // Login screen
    background(255);
    fill(0);
    textSize(65);
    text("LOG IN", 630, 300);
    textSize(50);
    text("BRUGERNAVN:  ", 450, 380);
    text("PASSWORD:     ", 450, 440);
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
    // Elevers side
    hide();
    background(255);
    textSize(17);
    fill(205, 50);
    rect(10, 10, 1480, 880, 8);
    fill(0);
    line(width/2, 100, width/2, height); 
    bibliotek_db.query("SELECT Brugere.Navn, Boeger.Titel, Boeger.Forfatter from Boeger join ElevBog join Brugere on Boeger.BogID = ElevBog.BogID and Brugere.ID = ElevBog.ElevID order by Brugere.Navn");
    i = 0;

    line(10, 100, width-10, 100);
    line(10, 180, width-10, 180);

    while (bibliotek_db.next()) {
      username = (bibliotek_db.getString("Titel"));
      text(username, 50, 80 * i + 240);

      username = (bibliotek_db.getString("Forfatter"));
      text(username, width/2 + 50, 80 * i + 240);

      line(10, 260 + 80*i, width-10, 260 + 80*i);
      i++;
    }

    textSize(40);
    text("NAVN ", 20, 60);
    text("ID ", 1390, 60);
    text("Titel ", 310, 160);
    text("Forfatter ", 1030, 160);
  }

  if (screenNumber == 2) {
    // Admins side
    hide();
    background(255);
    textSize(17);
    fill(205, 50);
    rect(10, 10, 1480, 880, 8);
    fill(0);
    line(width/3, 100, width/3, height); 
    line(2*width/3, 100, 2*width/3, height); 
    bibliotek_db.query("SELECT Brugere.Navn, Boeger.Titel, Boeger.Forfatter from Boeger join ElevBog join Brugere on Boeger.BogID = ElevBog.BogID and Brugere.ID = ElevBog.ElevID order by Brugere.Navn");
    i = 0;

    line(10, 100, width-10, 100);
    line(10, 180, width-10, 180);

    while (bibliotek_db.next()) {
      username = (bibliotek_db.getString("Navn"));
      text(username, 50, 80 * i + 240);

      username = (bibliotek_db.getString("Titel"));
      text(username, width/3 + 50, 80 * i + 240);

      username = (bibliotek_db.getString("Forfatter"));
      text(username, 2*width/3 + 50, 80 * i + 240);

      line(10, 260 + 80*i, width-10, 260 + 80*i);
      i++;
    }

    textSize(40);
    text("NAVN ", 20, 60);
    text("ID ", 1390, 60);
    text("Elev ", 60, 160);
    text("Titel ", width/3+50, 160);
    text("Forfatter ", 2*width/3+50, 160);
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

void hide() {
  cp5.get(Textfield.class, "usernameFelt").hide();
  cp5.get(Textfield.class, "passwordFelt").hide();
}

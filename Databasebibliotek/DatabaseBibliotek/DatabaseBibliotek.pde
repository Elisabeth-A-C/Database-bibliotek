import de.bezier.data.sql.*;

void setup() {
  background(255);
  size(1500, 900);
  fill(0);
  textSize(65);
  text("LOG IN", 630, 300);
  textSize(50);
  text("BRUGERNAVN", 450, 380);
  text("PASSWORD", 450, 440);
  fill(200);
  rect(623, 520, 250, 40, 8);
  fill(205, 50);
  rect(10, 10, 1480, 880, 8);

  db = new SQLite( this, "bibliotek_database.db" );  // open database file

  //if (db.connect()) {

  //}
}

void draw() {
}



SQLite db;

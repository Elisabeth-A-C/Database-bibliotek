import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;

SQLite bibliotek_db;

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
  
 bibliotek_db = new SQLite( this, "data/bibliotek.db" );  // open database file

    if (bibliotek_db.connect()) {
      bibliotek_db.query("SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"");
  while (bibliotek_db.next()) {
  println( bibliotek_db.getString("Name"));
  }  
  bibliotek_db.query("SELECT * FROM Elever");
  while (bibliotek_db.next()){
  println( bibliotek_db.getString("ElevID"));
 println( bibliotek_db.getString("Brugernavn"));
 println( bibliotek_db.getString("Password"));
 println( bibliotek_db.getString("Navn"));
  }
  }
 }

  

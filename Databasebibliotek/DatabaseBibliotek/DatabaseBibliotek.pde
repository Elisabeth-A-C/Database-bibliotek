import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;

SQLite bibliotek_db;

void setup() {
    background(255);
    size(1500,900);
    fill(0);
    textSize(65);
    text("LOG IN", 630,300);
    text("fd", 45,54);

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

void draw() {
  
}

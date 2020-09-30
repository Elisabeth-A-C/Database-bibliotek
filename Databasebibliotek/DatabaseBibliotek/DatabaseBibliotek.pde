import de.bezier.data.sql.*;

void setup() {
    background(255);
    size(1500,900);
    fill(0);
    textSize(65);
    text("LOG IN", 630,300);
    text("fd", 45,54);

    db = new SQLite( this, "bibliotek_database.db" );  // open database file

    //if (db.connect()) {
      
    //}
}

void draw() {
  
}



SQLite db;

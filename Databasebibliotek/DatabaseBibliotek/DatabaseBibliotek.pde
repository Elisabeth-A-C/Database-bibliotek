import de.bezier.data.sql.*;

SQLite db;

void setup() {
    background(255);
    size(1500,900);

    db = new SQLite( this, "bibliotek_database.db" );  // open database file

    //if (db.connect()) {
      
    //}
}

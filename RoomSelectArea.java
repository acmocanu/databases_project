package project;

import java.sql.*;

public class RoomSelectArea {
	
	public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/project";
        String username = "root";
        String password = "????????";

        try{
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            Statement statement = connection.createStatement();
            
            // Reading values from Table
            String query = "SELECT r.* " +
            			   "FROM Room r " +
            			   "JOIN hotel h ON r.Hotel_ID = h.Hotel_ID " +
            			   "WHERE h.City = ?";
            // Select rooms by area using the hotel table, we first need to join the Room table with the Hotel table based on the Hotel_ID. 
            // We then filter the results based on the city of the hotel.
            // This query selects all the fields from the Room table for all rooms that belong to hotels in the specified area.
            
            SelectByArea(statement, query);
   
            statement.close();
            connection.close();
        }catch (SQLException e){
            System.out.println("Error in connecting to MySQL server");
            e.printStackTrace();
        }
    }
    
    
    private static void SelectByArea(Statement statement, String query) throws SQLException {
        ResultSet rs = statement.executeQuery(query);

        while (rs.next())
        {
            System.out.println(rs.getString("Room_ID"));
            System.out.println(rs.getInt("Price"));
            System.out.println(rs.getString("Amenity"));
            System.out.println(rs.getInt("Capacity"));
            System.out.println(rs.getString("Room_View"));
            System.out.println(rs.getBoolean("Extra_Bed"));
            System.out.println(rs.getString("Damage"));
            System.out.println(rs.getString("Hotel_ID"));
            
        }

        // TO get the number of columns returned by the Query
        ResultSetMetaData rsMetaData = rs.getMetaData();
        int numberOfColumns = rsMetaData.getColumnCount();
        System.out.println("Number of Columns:"+numberOfColumns);
        rs.close();
    }

}

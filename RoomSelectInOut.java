package project;

import java.sql.*;

public class RoomSelectInOut {
	
	public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/project";
        String username = "root";
        String password = "???????";

        try{
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            Statement statement = connection.createStatement();
            
            // Reading values from Table
            String query = "SELECT * FROM Room WHERE Room_ID NOT IN " +
            			   "(SELECT Room_ID FROM Booking WHERE Check_In < ? AND Check_Out > ?)";
            // The SQL query uses a subquery to find all the rooms that are already booked during the given date range, and then selects the rooms that are not in that list. 
            
            SelectByInOut(statement, query);
   
            statement.close();
            connection.close();
        }catch (SQLException e){
            System.out.println("Error in connecting to MySQL server");
            e.printStackTrace();
        }
    }
    
    
    private static void SelectByInOut(Statement statement, String query) throws SQLException {
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

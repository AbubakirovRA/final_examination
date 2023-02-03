package mainModel;

import java.sql.*;
import mainContract.IMainContract;

public class MainModel implements IMainContract.IModel{
	
	@Override
	public String loadData(String requestNumber) {
		String result = "";
		String sqlCommand = "";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();

            try (Connection conn = Connector.getConnection()){
            	Statement statement = conn.createStatement();
            	
				switch (requestNumber) {
      		  		case "Add new Animal":
      		  		sqlCommand = Commands.addNewAnimal();
      		  			statement.executeUpdate(sqlCommand);
      		  			System.out.println("Adding new Animal successful!");
      		  		case "Get animals command list":
          		  		sqlCommand = Commands.getCommandsList();
      		  			ResultSet resultSet = statement.executeQuery("select "
      		  					+ "AnimalTotal.`id`, AnimalTotal.`name`, AnimalTotal.`MaxBurden`, AnimalTotal.`MaxDistance`, "
      		  					+ "AnimalTotal.`MaxSpeed`, AnimalTotal.`favoriteGame`, AnimalTotal.`color`, AnimalTotal.`teethCondition`, "
      		  					+ "AnimalTotal.`obstinacy`, AnimalTotal.`humps`, AnimalTotal.`cheekVolume`, AnimalTotal.`huntingInstinct`, "
      		  					+ "AnimalTotal.`purrVolume`,  Commands.`title`, Commands.`action`, Commands.`method` "
      		  					+ "from AnimalTotal join `Match` on `id` = `id_mansfriend` "
      		  					+ "join Commands on `id_command` = Commands.`id`");
      		  			while(resultSet.next()){
      		  				String id = " " + resultSet.getInt(1) + " ";
      		  				String name = " " + resultSet.getString(2) + " ";
      		  				String maxBurden = " " + resultSet.getInt(3) + " ";
      		  				String maxDistance = " " + resultSet.getInt(4) + " ";
      		  				String maxSpeed = " " + resultSet.getInt(5) + " ";
      		  				String favoriteGame = " " + resultSet.getString(6) + " ";
      		  				String color = " " + resultSet.getString(7) + " ";
      		  				String teeth = " " + resultSet.getString(8) + " ";
      		  				String obstinacy = " " + resultSet.getString(9) + " ";
      		  				String humps = " " + resultSet.getInt(10) + " ";
      		  				String cheek = " " + resultSet.getString(11) + " ";
      		  				String hunting = " " + resultSet.getString(12) + " ";
      		  				String purr = " " + resultSet.getString(13) + " ";
      		  				String title = " " + resultSet.getString(14) + " ";
      		  				String action = " " + resultSet.getString(15) + " ";
      		  				String method = " " + resultSet.getString(16) + " ";
      		  				String message = (id + name + maxBurden + maxDistance + maxSpeed + favoriteGame + color + teeth + obstinacy + humps + cheek + 
      	                		hunting + purr + title + action + method + "\n");
      		  				result += message;
//      		                System.out.printf("%s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s |\n", id, name, maxBurden, maxDistance, maxSpeed, favoriteGame, color, teeth, obstinacy, humps, cheek, hunting,purr, title, action, method);
      		  			}
      		  			return result;
      		  		case "Add new command":
      		  			return "";
      		  		default:
      		  			return "";
					}
				
            }
	           	
        }
        catch(Exception ex){
            System.out.println("Connection failed...");
             
            System.out.println(ex);
        }
		return result;

	}
    
}

package mainModel;

import java.util.Scanner;

public class Commands {
	public static String addNewAnimal() {
		System.out.println("Выберите животное:" + "\n"
		            + "1. Лошадь" + "\n"
		            + "2. Ослик" + "\n"
		            + "3. Верблюд" + "\n"
		            + "4. Хомячок" + "\n"
		            + "5. Песик" + "\n"
		            + "6. Котейка");
		String sqlCommand;
		switch (request()) {
	  		case 1:
	            Scanner scanner = new Scanner(System.in);
	  			System.out.println("Введите имя животного:");
	  			
	  			StringBuilder builder = new StringBuilder("");
	  			return sqlCommand = Commands.addNewAnimal();
	  		case 2:
	  			return sqlCommand = Commands.addNewAnimal();
	  		case 3:
	  			return sqlCommand = Commands.addNewAnimal();
	  		case 4:
	  			return sqlCommand = Commands.addNewAnimal();
	  		case 5:
	  			return sqlCommand = Commands.addNewAnimal();
	  		case 6:
	  			return sqlCommand = Commands.addNewAnimal();
	  		default:
	  			return "";
		}
		
	}
	
	public static String getCommandsList() {
		String sqlCommand = "";
		
		return sqlCommand;
		
	}
	
    public static int request(){
        while(true){
            Scanner scanner = new Scanner(System.in);
            System.out.println("Enter Integer digit");
            
            try{
                int ch = scanner.nextInt();
                if (ch > 0 && ch < 7) {
                	scanner.close();
                	return ch;
                }
            }
    
            catch (Exception e){
                    System.out.println("Wrong input!" + e);
            }
        }
    }
}

package presenter;

import java.util.Scanner;

public class GetInt {
	public static int getUserAnswer() {
        while(true){
            Scanner scanner = new Scanner(System.in);
            System.out.println("Enter Integer digit");
    		
            try{
                int ch = scanner.nextInt();         
                // scanner.close();
                return ch;
            }
    
            catch (Exception e){
                    System.err.println("Wrong input!" + e);
            }
        }		
	}
}

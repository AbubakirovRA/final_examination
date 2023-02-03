import mainContract.IMainContract;
import presenter.Presenter;
import view.View;


public class Programm {

	public static void main(String[] args) {		
		IMainContract.IPresenter presenter = new Presenter(new View());

		while(true){
			presenter.run();
			
			// presenter.setMessage(presenter.getUserChoice());
			String choice = presenter.getUserChoice();
			if (choice.equals("Four")) {
				System.out.println("Bye-bye!");
				break;
				
			}else {
				if (choice.equals("One") || choice.equals("Two") || choice.equals("Three")) {
					presenter.getSqlCommand(choice);
				}
			}
		}
	}
}
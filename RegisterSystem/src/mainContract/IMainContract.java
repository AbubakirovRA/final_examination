package mainContract;

public interface IMainContract {
	interface IView{
		void show(String message);
	}
	
	interface IPresenter{
		void run();
		void buttonWasClicked();
		void setMessage(String message);
		String getMessage();
		String getUserChoice();
        String getSqlCommand(String choice);

	}
	
	interface IModel{
		String loadData(String сommand);
	}

}


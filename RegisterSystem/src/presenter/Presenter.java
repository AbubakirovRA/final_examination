package presenter;

import mainContract.IMainContract;
import mainModel.MainModel;

public class Presenter implements IMainContract.IPresenter{

    //Компоненты MVP приложения
    private IMainContract.IView View;
    private IMainContract.IModel Model;

    //Сообщение
    private String message = "Start screen";

    public Presenter(IMainContract.IView View) {
        this.View = View;
        this.Model = new MainModel();
    }

    
    public void run() {
    	
    	View.show(Messages.messageSelector(message));
    }
    
    //View сообщает, что кнопка была нажата
    @Override
    public void buttonWasClicked() {
        message = Model.loadData(message);
        View.show(message);
        message = "Start screen";
    }
	
	public void setMessage(String value)
	{
	     //include more logic
	     this.message = value;
	}
	
	public String getMessage() {
		return message;
		
	}


    @Override
    public String getUserChoice() {
        switch(GetInt.getUserAnswer()){
            case 1:
                return "One";
            case 2:
				return "Two";
			case 3:
				return "Three";
			case 4:
				return "Four";
			case 5:
				return "Five";
			case 6:
				return "Six";
			case 7:
				return "Seven";
			case 8:
				return "Eight";
			case 9:
				return "Nine";
			case 10:
				return "Ten";
			case 11:
				return "Eleven";
            default:
                return "";
        }
    } 

    public String getSqlCommand(String value){
        String request = "";
        switch(value){
            case "One":
                Messages.messageSelector("One");
                    switch(getUserChoice()){
                        case "One":
                            Messages.messageSelector("Two");
                    }
                return "One";
            case "Two":
                Messages.messageSelector("One");
				return "Two";
			case "Three":
                Messages.messageSelector("One");
				return "Three";
            default:
                return "";
        }
    }

}

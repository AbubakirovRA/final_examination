package view;

import mainContract.IMainContract;

public class View implements IMainContract.IView{

	@Override
	public void show(String message) {	 
		System.out.println(message);
	
	}

}

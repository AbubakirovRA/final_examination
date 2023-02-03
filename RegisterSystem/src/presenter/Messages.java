package presenter;

public class Messages {
	public static String messageSelector(String userChoice) {
		switch(userChoice) {
			case "Start screen":
				return "Welcome to the Pets and Beasts Cattery" + "\n" +
			            "Выберите действие:" + "\n"
			            + "1. Завести новое животное" + "\n"
			            + "2. Увидеть список команд, которое выполняет животное" + "\n"
			            + "3. Обучить животное новым командам" + "\n"
			            + "4. Выйти";
			case "One":
				return "Выберите животное:" + "\n"
	            		+ "1. Лошадь" + "\n"
	            		+ "2. Ослик" + "\n"
	            		+ "3. Верблюд" + "\n"
	            		+ "4. Хомячок" + "\n"
	            		+ "5. Песик" + "\n"
	            		+ "6. Котейка";
			case "Two":
				return "Как насчет имени?";
			case "Three":
				return "День рождения? (формат: год-месяц-число)";
			case "Four":
				return "Введите грузоподъемность, расстояние и скорость животного";
			case "Five":
				return "Введите любимую игру и цвет питомца";
			case "Six":
				return "А зубы хорошие?";
			case "Seven":
				return "А характер не подкачал?";
			case "Eight":
				return "Сколько у нас горбов?";
			case "Nine":
				return "Солько влезет в хомяка?";
			case "Ten":
				return "Охотничий инстинкт";
			case "Eleven":
				return "Громкость мурчания";
	  		default:
	  			return "";
		}

	}
}

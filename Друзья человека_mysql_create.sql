CREATE TABLE `MansFriends` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`birthdate` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Pet` (
	`id_mansfriend` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`favoriteGame` varchar(255) NOT NULL,
	`color` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `BurdenAnimal` (
	`id_mansfriend` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`MaxBurden` int NOT NULL,
	`MaxDistance` int NOT NULL,
	`MaxSpeed` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Horse` (
	`id_burdenAnimal` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`teethCondition` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Donkey` (
	`id_burdenAnimal` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`obstinacy` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Camel` (
	`id_burdenAnimal` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`humps` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Hamster` (
	`id_pet` int NOT NULL,
	`id` int NOT NULL AUTO_INCREMENT,
	`cheekVolume` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Dog` (
	`id` int NOT NULL AUTO_INCREMENT,
	`huntingInstinct` varchar(255) NOT NULL,
	`id_pet` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cat` (
	`id` int NOT NULL AUTO_INCREMENT,
	`purrVolume` varchar(255) NOT NULL,
	`id_pet` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Match` (
	`id_mansfriend` int NOT NULL,
	`id_command` int NOT NULL
);

CREATE TABLE `Commands` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`action` varchar(255) NOT NULL,
	`method` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Pet` ADD CONSTRAINT `Pet_fk0` FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`);

ALTER TABLE `BurdenAnimal` ADD CONSTRAINT `BurdenAnimal_fk0` FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`);

ALTER TABLE `Horse` ADD CONSTRAINT `Horse_fk0` FOREIGN KEY (`id_burdenAnimal`) REFERENCES `BurdenAnimal`(`id`);

ALTER TABLE `Donkey` ADD CONSTRAINT `Donkey_fk0` FOREIGN KEY (`id_burdenAnimal`) REFERENCES `BurdenAnimal`(`id`);

ALTER TABLE `Camel` ADD CONSTRAINT `Camel_fk0` FOREIGN KEY (`id_burdenAnimal`) REFERENCES `BurdenAnimal`(`id`);

ALTER TABLE `Hamster` ADD CONSTRAINT `Hamster_fk0` FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`);

ALTER TABLE `Dog` ADD CONSTRAINT `Dog_fk0` FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`);

ALTER TABLE `Cat` ADD CONSTRAINT `Cat_fk0` FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`);

ALTER TABLE `Match` ADD CONSTRAINT `Match_fk0` FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`);

ALTER TABLE `Match` ADD CONSTRAINT `Match_fk1` FOREIGN KEY (`id_command`) REFERENCES `Commands`(`id`);













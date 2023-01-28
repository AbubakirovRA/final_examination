-- Task 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”

CREATE DATABASE `Друзья человека`;
use `Друзья человека`;

-- Task 8. Создать таблицы с иерархией из диаграммы в БД

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
PRIMARY KEY (`id`),
FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`) ON DELETE CASCADE
);

CREATE TABLE `BurdenAnimal` (
`id_mansfriend` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`MaxBurden` int NOT NULL,
`MaxDistance` int NOT NULL,
`MaxSpeed` int NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Horse` (
`id_burdenanimal` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`teethCondition` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_burdenanimal`) REFERENCES `BurdenAnimal`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Donkey` (
`id_burdenanimal` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`obstinacy` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_burdenanimal`) REFERENCES `BurdenAnimal`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Camel` (
`id_burdenanimal` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`humps` int NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_burdenanimal`) REFERENCES `BurdenAnimal`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Hamster` (
`id_pet` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`cheekVolume` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Dog` (
`id_pet` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`huntingInstinct` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Cat` (
`id_pet` int NOT NULL,
`id` int NOT NULL AUTO_INCREMENT,
`purrVolume` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_pet`) REFERENCES `Pet`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Commands` (
`id` int NOT NULL AUTO_INCREMENT,
`title` varchar(255) NOT NULL,
`action` varchar(255) NOT NULL,
`method` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `Match` (
`id_mansfriend` int NOT NULL,
`id_command` int NOT NULL,
FOREIGN KEY (`id_mansfriend`) REFERENCES `MansFriends`(`id`) ON DELETE CASCADE,
FOREIGN KEY (`id_command`) REFERENCES `Commands`(`id`) ON DELETE CASCADE
);

-- Task 9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения:

INSERT INTO MansFriends (`id`, `name`, `birthdate`) VALUES
('1001', 'Horse1', '2019-08-08'),
('1002', 'Horse2', '2015-10-06'),
('1003', 'Horse3', '2022-12-10'),
('1004', 'Donkey1', '2019-08-08'),
('1005', 'Donkey2', '2015-10-06'),
('1006', 'Donkey3', '2022-12-10'),
('1007', 'Camel1', '2019-08-08'),
('1008', 'Camel2', '2015-10-06'),
('1009', 'Camel3', '2022-12-10'),
('1010', 'Hamster1', '2019-08-08'),
('1011', 'Hamster2', '2015-10-06'),
('1012', 'Hamster3', '2022-12-10'),
('1013', 'Dog1', '2019-08-08'),
('1014', 'Dog2', '2015-10-06'),
('1015', 'Dog3', '2022-12-10'),
('1016', 'Cat1', '2019-08-08'),
('1017', 'Cat2', '2015-10-06'),
('1018', 'Cat3', '2022-12-10');

INSERT INTO BurdenAnimal (`id_mansfriend`,`id`,`MaxBurden`,`MaxDistance`,`MaxSpeed`) VALUES
('1001','2001','70','30','20'),
('1002','2002','80','40','15'),
('1003','2003','90','50','10'),
('1004','2004','70','25','4'),
('1005','2005','60','15','3'),
('1006','2006','70','20','5'),
('1007','2007','350','40','10'),
('1008','2008','400','30','10'),
('1009','2009','100','100','12');

INSERT INTO Pet (`id_mansfriend`,`id`,`favoriteGame`,`color`) VALUES
('1010','2010','бег в колесе','белый'),
('1011','2011','бег в колесе','черный'),
('1012','2012','бег в колесе','коричневый'),
('1013','2013','принеси палку','черный'),
('1014','2014','принеси палку','белый'),
('1015','2015','принеси палку','рыжий'),
('1016','2016','клубок','рыжий'),
('1017','2017','клубок','белый'),
('1018','2018','кошки-мышки','черный');

INSERT INTO Horse (`id_burdenanimal`, `id`, `teethCondition`) VALUES
('2001', '3001', 'good'),
('2002', '3002', 'not bad'),
('2003', '3003', 'excelent');

INSERT INTO Donkey (`id_burdenanimal`, `id`, `obstinacy`) VALUES
('2004', '3004', 'покладистый'),
('2005', '3005', 'упрямый'),
('2006', '3006', 'среднего упрямства');

INSERT INTO Camel (`id_burdenanimal`, `id`, `humps`) VALUES
('2007', '3007', '1'),
('2008', '3008', '2'),
('2009', '3009', '1');

INSERT INTO Hamster (`id_pet`, `id`, `cheekVolume`) VALUES
('2010', '3010', 'большой'),
('2011', '3011', 'средний'),
('2012', '3012', 'маленький');

INSERT INTO Dog (`id_pet`, `id`, `huntinginstinct`) VALUES
('2013', '3013', 'высокий'),
('2014', '3014', 'высокий'),
('2015', '3015', 'средний');

INSERT INTO Cat (`id_pet`, `id`, `purrVolume`) VALUES
('2016', '3016', 'громкий'),
('2017', '3017', 'тихий'),
('2018', '3018', 'средний');

INSERT INTO Commands (`id`, `title`, `action`, `method`) VALUES
('1101','нно','начать движение','громко произнести вслух'),
('1102','тпру','стоп движение','громко произнести вслух'),
('1103','позвать по имени','привлечь внимание','громко произнести вслух'),
('1104','влево','движение налево','натянуть вожжи слева'),
('1105','вправо','движение направо','натянуть вожжи справа'),
('1106','быстрей','ускорить движение','ударить вожжами по бокам'),
('1107','гит','начать движение','громко произнести вслух'),
('1108','дур','стоп движение','громко произнести вслух'),
('1109','каш','лечь','громко произнести вслух'),
('1110','хан-хан-хан','вперед','громко произнести вслух'),
('1111','цок','быстрее','громко произнести вслух'),
('1112','кис-кис-кис','подойди','негромко произнести вслух'),
('1113','колесо','начать бег в колесе','негромко произнести вслух'),
('1114','играть','приглашение к игре','негромко посвистеть'),
('1115','сидеть','занять позу сидя','громко произнести вслух'),
('1116','лежать','занять позу лежа','громко произнести вслух'),
('1117','аппорт','принести брошенный предмет','громко произнести вслух'),
('1118','ко мне','подбежать к зовущему','громко произнести вслух'),
('1119','фу','завершить текущее действие','громко произнести вслух'),
('1120','фас','напасть на кого указал','громко произнести вслух');

INSERT INTO `Match` (`id_mansfriend`, `id_command`) VALUES
(1001,1101),
(1002,1101),
(1003,1101),
(1004,1101),
(1005,1101),
(1006,1101),
(1001,1102),
(1002,1102),
(1003,1102),
(1004,1102),
(1005,1102),
(1006,1102),
(1001,1103),
(1002,1103),
(1003,1103),
(1004,1103),
(1005,1103),
(1006,1103),
(1007,1103),
(1008,1103),
(1009,1103),
(1010,1103),
(1011,1103),
(1012,1103),
(1013,1103),
(1014,1103),
(1015,1103),
(1016,1103),
(1017,1103),
(1018,1103),
(1001,1104),
(1002,1104),
(1003,1104),
(1004,1104),
(1005,1104),
(1006,1104),
(1001,1105),
(1002,1105),
(1003,1105),
(1004,1105),
(1005,1105),
(1006,1105),
(1001,1106),
(1002,1106),
(1003,1106),
(1004,1106),
(1005,1106),
(1006,1106),
(1007,1107),
(1008,1107),
(1009,1107),
(1007,1108),
(1008,1108),
(1009,1108),
(1007,1109),
(1008,1109),
(1009,1109),
(1007,1110),
(1008,1110),
(1009,1110),
(1007,1111),
(1008,1111),
(1009,1111),
(1016,1112),
(1017,1112),
(1018,1112),
(1010,1113),
(1011,1113),
(1012,1113),
(1010,1114),
(1011,1114),
(1012,1114),
(1016,1114),
(1017,1114),
(1018,1114),
(1013,1115),
(1014,1115),
(1015,1115),
(1013,1116),
(1014,1116),
(1015,1116),
(1013,1117),
(1014,1117),
(1015,1117),
(1013,1118),
(1014,1118),
(1015,1118),
(1013,1119),
(1014,1119),
(1015,1119),
(1013,1120),
(1014,1120),
(1015,1120);

-- Task 10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.

-- Удаление верблюдов из таблицы Camel:

-- TRUNCATE TABLE Camel;

-- Объединение всех вьючных в одном запросе (нет в задании):

select
MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`

union

select
MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`;

-- Создадим таблицу, объединяющую характеристики лошадей и ослов:

create table DonkeyHorse as
select
MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Horse.`teethCondition`, Donkey.`obstinacy`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`

union

select
MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Horse.`teethCondition`, Donkey.`obstinacy`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`;

-- Task 11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице:

CREATE TABLE Yang AS
select *,
TIMESTAMPDIFF (MONTH, birthdate, CURDATE()) as `Age in Month`
from MansFriends
where
((TIMESTAMPDIFF (YEAR, birthdate, CURDATE())) < 3 and (TIMESTAMPDIFF (YEAR, birthdate, CURDATE())) > 1);

-- Task 12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

-- Объединим все характеристики имеющие отношение ко вьючным и домашним животным в одну таблицу из разных таблиц:

create table AnimalTotal as
select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
left join Pet on Pet.`id_mansfriend` = MansFriends.`id`
left join Hamster on Hamster.`id_pet` = Pet.`id`
left join Dog on Dog.`id_pet` = Pet.`id`
left join Cat on Cat.`id_pet` = Pet.`id`

union

select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
left join Pet on Pet.`id_mansfriend` = MansFriends.`id`
left join Hamster on Hamster.`id_pet` = Pet.`id`
left join Dog on Dog.`id_pet` = Pet.`id`
left join Cat on Cat.`id_pet` = Pet.`id`

union

select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Pet on Pet.`id_mansfriend` = MansFriends.`id`
left join Hamster on Hamster.`id_pet` = Pet.`id`
left join Dog on Dog.`id_pet` = Pet.`id`
left join Cat on Cat.`id_pet` = Pet.`id`

union

select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
left join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
join Pet on Pet.`id_mansfriend` = MansFriends.`id`
join Hamster on Hamster.`id_pet` = Pet.`id`
left join Dog on Dog.`id_pet` = Pet.`id`
left join Cat on Cat.`id_pet` = Pet.`id`

union

select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
left join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
join Pet on Pet.`id_mansfriend` = MansFriends.`id`
left join Hamster on Hamster.`id_pet` = Pet.`id`
join Dog on Dog.`id_pet` = Pet.`id`
left join Cat on Cat.`id_pet` = Pet.`id`

union

select
MansFriends.`id`, MansFriends.`name`, BurdenAnimal.`MaxBurden`, BurdenAnimal.`MaxDistance`, BurdenAnimal.`MaxSpeed`, Pet.`favoriteGame`, Pet.`color`, Horse.`teethCondition`, Donkey.`obstinacy`, Camel.`humps`, Hamster.`cheekVolume`, Dog.`huntingInstinct`, Cat.`purrVolume`
from MansFriends
left join BurdenAnimal on BurdenAnimal.`id_mansfriend` = MansFriends.`id`
left join Horse on Horse.`id_burdenanimal` = BurdenAnimal.`id`
left join Donkey on Donkey.`id_burdenanimal` = BurdenAnimal.`id`
left join Camel on Camel.`id_burdenanimal` = BurdenAnimal.`id`
join Pet on Pet.`id_mansfriend` = MansFriends.`id`
left join Hamster on Hamster.`id_pet` = Pet.`id`
left join Dog on Dog.`id_pet` = Pet.`id`
join Cat on Cat.`id_pet` = Pet.`id`;

-- Объединим данные из таблиц MainsFriends, Match, Commands в одну таблицу сопоставления животных и команд (нет в задании):

create table AnimalsCommands as
select
MansFriends.`id`, MansFriends.`name`, Commands.`title`, Commands.`action`, Commands.`method`
from MansFriends
join `Match` on `id` = `id_mansfriend`
join Commands on `id_command` = Commands.`id`;

-- Объединим столбцы таблицы AnimalTotal с командами, сопоставленными животным в таблицах Match и Commands в итоговую таблицу Total:

create table Total as
select
AnimalTotal.`id`, AnimalTotal.`name`, AnimalTotal.`MaxBurden`, AnimalTotal.`MaxDistance`, AnimalTotal.`MaxSpeed`, AnimalTotal.`favoriteGame`, AnimalTotal.`color`, AnimalTotal.`teethCondition`, AnimalTotal.`obstinacy`, AnimalTotal.`humps`, AnimalTotal.`cheekVolume`, AnimalTotal.`huntingInstinct`, AnimalTotal.`purrVolume`,  Commands.`title`, Commands.`action`, Commands.`method`
from AnimalTotal
join `Match` on `id` = `id_mansfriend`
join Commands on `id_command` = Commands.`id`;

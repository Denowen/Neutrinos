use train_company_database;

/*Represents all users*/
CREATE TABLE Users(
userSsn VARCHAR(12) PRIMARY KEY,
userName VARCHAR(100),
userSurname VARCHAR(100),
userEmail VARCHAR(100) UNIQUE,
userPassword VARCHAR(10) UNIQUE);

/*Registered User Table(Possible customer)*/
CREATE TABLE RegisteredUsers(
regUserName VARCHAR(100) REFERENCES Users(userName),
regUserSurname VARCHAR(100) REFERENCES Users(userSurname),
regUserSsn VARCHAR(12) PRIMARY KEY REFERENCES Users(userSsn) ,
regUserEmail VARCHAR(100) UNIQUE REFERENCES Users(userEmail),
regUserPassword VARCHAR(10) UNIQUE REFERENCES Users(userPassword),
regUserBirthdate DATE,
regUserTelephoneNumber VARCHAR(20));

/*Administrators Table*/
CREATE TABLE Administrators(
adminSsn VARCHAR(12) PRIMARY KEY REFERENCES Users(userSsn),
adminName VARCHAR(100) REFERENCES Users(userName) ,
adminSurname VARCHAR(100) REFERENCES Users(userSurname),
adminEmail VARCHAR(100) UNIQUE,
adminPassword VARCHAR(10) UNIQUE);

/*Payment Table*/
CREATE TABLE Payment(
creditCardNumber INT(30) PRIMARY KEY,
CVV INT(5),
expirationDate DATE,
cardOwnerNameAndSurname VARCHAR(100));

/*Seat And Class Information Table*/
CREATE TABLE SeatAndClass(
seatAndClassId INT(20) PRIMARY KEY,
trainNo VARCHAR(50),
seatNumber VARCHAR(20),
classType VARCHAR(20));


/*Reservation Table*/
CREATE TABLE Reserve(
reservationId VARCHAR(40) AUTO_INCREMENT PRIMARY KEY,
regUserSsn VARCHAR(12) REFERENCES RegisteredUsers(regUserSsn),
routeId INT(20) REFERENCES Route(routeId),
classType VARCHAR(20) REFERENCES SeatAndClass(classType));


/*Buy Table*/
CREATE TABLE Buy(
PNR VARCHAR(200)  PRIMARY KEY REFERENCES Ticket(PNR),
creditCardNumber INT(30) REFERENCES Payment(creditCardNumber),
reguserSsn VARCHAR(12) REFERENCES RegisteredUser(reguserSsn),
routeId INT(20) REFERENCES Route(routeId),
totalPrice FLOAT(6,2) REFERENCES Route(price),
classType VARCHAR(20) REFERENCES SeatAndClass(classType),
seatNumber VARCHAR(20) REFERENCES SeatAndClass(seatNumber));

/*Train Table*/
CREATE TABLE Train(
trainNumber VARCHAR(50) PRIMARY KEY,
capacity INT(20));

/*Station Table*/
CREATE TABLE Station(
stationLocation VARCHAR(50),
stationName VARCHAR(50) PRIMARY KEY);

/*Route Table*/
CREATE TABLE Route(
routeId INT(20) PRIMARY KEY,
startingStationTerminal VARCHAR(50) REFERENCES Station(stationName),
destinationStationTerminal VARCHAR(50) REFERENCES Station(stationName),
arrivelTime VARCHAR(20),
departureTime VARCHAR(20),
dateOfRoute DATE,
trainNumber VARCHAR(50) REFERENCES Train(trainNumber),
price FLOAT(6,2));


/*Ticket Table*/
CREATE TABLE Ticket(
PNR VARCHAR(200) PRIMARY KEY,
reguserSsn VARCHAR(12) REFERENCES RegisteredUser(reguserSsn),
totalPrice FLOAT(6,2) REFERENCES Buy(totalprice),
routeId INT(20) REFERENCES Route(routeId),
classType VARCHAR(20) REFERENCES SeatAndClass(classType),
seatNumber VARCHAR(20) REFERENCES SeatAndClass(seatNumber));


/*Administrators in System*/
INSERT INTO Administrators VALUES('21474836471','Elif','Akar','elif.akar@isik.edu.tr','123elif');
INSERT INTO Administrators VALUES('31249826713','Hilal','Yavuz','218cs2112@isik.edu.tr','123hilal');
INSERT INTO Administrators VALUES('21354689271','Görkem Deniz','Seyhan','gorkem.seyhan@isik.edu.tr','123gork');
INSERT INTO Administrators VALUES('51286932143','Doğukan','Doğanay','dogukan.doganay@isik.edu.tr','123doğu');
/*Users*/
INSERT INTO Users VALUES('21474836471','Elif','Akar','elif.akar@isik.edu.tr','123elif');
INSERT INTO  Users VALUES('31249826713','Hilal','Yavuz','218cs2112@isik.edu.tr','123hilal');
INSERT INTO  Users VALUES('21354689271','Görkem Deniz','Seyhan','gorkem.seyhan@isik.edu.tr','123gork');
INSERT INTO  Users VALUES('51286932143','Doğukan','Doğanay','dogukan.doganay@isik.edu.tr','123doğu');

/*Trains in System*/
INSERT INTO Train VALUES('100 6 September Express', 483); 
INSERT INTO Train VALUES('101 17 September Express', 483);
INSERT INTO Train VALUES('102 East Express',483);
INSERT INTO Train VALUES('103 Aegean Express', 483);
INSERT INTO Train VALUES('106 South Kurtulan Express',483);
INSERT INTO Train VALUES('107 İzmir Blue Train', 483);
INSERT INTO Train VALUES('111 Toros Express', 483);
INSERT INTO Train VALUES('112 Van Lake Express', 483);
INSERT INTO Train VALUES('113 High Speed Train', 483);

/*Seat and Class Type for Trains in System*/
/* For 100 6 September Express*/
INSERT INTO SeatAndClass VALUES(1,'100 6 September Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(2,'100 6 September Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(3,'100 6 September Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(4,'100 6 September Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(5,'100 6 September Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(6,'100 6 September Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(7,'100 6 September Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(8,'100 6 September Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(9,'100 6 September Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(10,'100 6 September Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(11,'100 6 September Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(12,'100 6 September Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(13,'100 6 September Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(14,'100 6 September Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(15,'100 6 September Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(16,'100 6 September Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(17,'100 6 September Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(18,'100 6 September Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(19,'100 6 September Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(20,'100 6 September Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(21,'100 6 September Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(22,'100 6 September Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(23,'100 6 September Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(24,'100 6 September Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(25,'100 6 September Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(26,'100 6 September Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(27,'100 6 September Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(28,'100 6 September Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(29,'100 6 September Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(30,'100 6 September Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(31,'100 6 September Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(32,'100 6 September Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(33,'100 6 September Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(34,'100 6 September Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(35,'100 6 September Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(36,'100 6 September Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(37,'100 6 September Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(38,'100 6 September Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(39,'100 6 September Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(40,'100 6 September Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(41,'100 6 September Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(42,'100 6 September Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(43,'100 6 September Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(44,'100 6 September Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(45,'100 6 September Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(46,'100 6 September Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(47,'100 6 September Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(48,'100 6 September Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(49,'100 6 September Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(50,'100 6 September Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(51,'100 6 September Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(52,'100 6 September Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(53,'100 6 September Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(54,'100 6 September Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(55,'100 6 September Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(56,'100 6 September Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(57,'100 6 September Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(58,'100 6 September Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(59,'100 6 September Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(60,'100 6 September Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(61,'100 6 September Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(62,'100 6 September Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(63,'100 6 September Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(64,'100 6 September Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(65,'100 6 September Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(66,'100 6 September Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(67,'100 6 September Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(68,'100 6 September Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(69,'100 6 September Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(70,'100 6 September Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(71,'100 6 September Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(72,'100 6 September Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(73,'100 6 September Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(74,'100 6 September Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(75,'100 6 September Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(76,'100 6 September Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(77,'100 6 September Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(78,'100 6 September Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(79,'100 6 September Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(80,'100 6 September Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(81,'100 6 September Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(82,'100 6 September Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(83,'100 6 September Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(84,'100 6 September Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(85,'100 6 September Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(86,'100 6 September Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(87,'100 6 September Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(88,'100 6 September Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(89,'100 6 September Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(90,'100 6 September Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(91,'100 6 September Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(92,'100 6 September Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(93,'100 6 September Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(94,'100 6 September Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(95,'100 6 September Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(96,'100 6 September Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(97,'100 6 September Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(98,'100 6 September Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(99,'100 6 September Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(100,'100 6 September Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(101,'100 6 September Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(102,'100 6 September Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(103,'100 6 September Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(104,'100 6 September Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(105,'100 6 September Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(106,'100 6 September Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(107,'100 6 September Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(108,'100 6 September Express','16F','BUSINESS CLASS');
/* For 101 17 September Express*/
INSERT INTO SeatAndClass VALUES(109,'101 17 September Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(110,'101 17 September Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(111,'101 17 September Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(112,'101 17 September Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(113,'101 17 September Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(114,'101 17 September Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(115,'101 17 September Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(116,'101 17 September Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(117,'101 17 September Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(118,'101 17 September Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(119,'101 17 September Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(120,'101 17 September Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(121,'101 17 September Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(122,'101 17 September Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(123,'101 17 September Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(124,'101 17 September Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(125,'101 17 September Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(126,'101 17 September Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(127,'101 17 September Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(128,'101 17 September Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(129,'101 17 September Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(130,'101 17 September Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(131,'101 17 September Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(132,'101 17 September Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(133,'101 17 September Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(134,'101 17 September Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(135,'101 17 September Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(136,'101 17 September Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(137,'101 17 September Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(138,'101 17 September Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(139,'101 17 September Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(140,'101 17 September Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(141,'101 17 September Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(142,'101 17 September Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(143,'101 17 September Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(144,'101 17 September Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(145,'101 17 September Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(146,'101 17 September Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(147,'101 17 September Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(148,'101 17 September Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(149,'101 17 September Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(150,'101 17 September Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(151,'101 17 September Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(152,'101 17 September Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(153,'101 17 September Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(154,'101 17 September Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(155,'101 17 September Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(156,'101 17 September Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(157,'101 17 September Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(158,'101 17 September Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(159,'101 17 September Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(160,'101 17 September Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(161,'101 17 September Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(162,'101 17 September Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(163,'101 17 September Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(164,'101 17 September Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(165,'101 17 September Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(166,'101 17 September Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(167,'101 17 September Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(168,'101 17 September Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(169,'101 17 September Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(170,'101 17 September Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(171,'101 17 September Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(172,'101 17 September Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(173,'101 17 September Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(174,'101 17 September Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(175,'101 17 September Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(176,'101 17 September Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(177,'101 17 September Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(178,'101 17 September Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(179,'101 17 September Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(180,'101 17 September Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(181,'101 17 September Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(182,'101 17 September Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(183,'101 17 September Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(184,'101 17 September Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(185,'101 17 September Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(186,'101 17 September Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(187,'101 17 September Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(188,'101 17 September Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(189,'101 17 September Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(190,'101 17 September Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(191,'101 17 September Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(192,'101 17 September Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(193,'101 17 September Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(194,'101 17 September Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(195,'101 17 September Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(196,'101 17 September Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(197,'101 17 September Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(198,'101 17 September Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(199,'101 17 September Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(200,'101 17 September Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(201,'101 17 September Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(202,'101 17 September Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(203,'101 17 September Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(204,'101 17 September Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(205,'101 17 September Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(206,'101 17 September Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(207,'101 17 September Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(208,'101 17 September Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(209,'101 17 September Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(210,'101 17 September Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(211,'101 17 September Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(212,'101 17 September Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(213,'101 17 September Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(214,'101 17 September Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(215,'101 17 September Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(216,'101 17 September Express','16F','BUSINESS CLASS');
/* For 102 East Express*/
INSERT INTO SeatAndClass VALUES(217,'102 East Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(218,'102 East Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(219,'102 East Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(220,'102 East Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(221,'102 East Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(222,'102 East Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(223,'102 East Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(224,'102 East Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(225,'102 East Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(226,'102 East Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(227,'102 East Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(228,'102 East Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(229,'102 East Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(230,'102 East Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(231,'102 East Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(232,'102 East Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(233,'102 East Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(234,'102 East Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(235,'102 East Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(236,'102 East Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(237,'102 East Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(238,'102 East Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(239,'102 East Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(240,'102 East Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(241,'102 East Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(242,'102 East Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(243,'102 East Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(244,'102 East Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(245,'102 East Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(246,'102 East Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(247,'102 East Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(248,'102 East Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(249,'102 East Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(250,'102 East Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(251,'102 East Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(252,'102 East Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(253,'102 East Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(254,'102 East Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(255,'102 East Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(256,'102 East Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(257,'102 East Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(258,'102 East Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(259,'102 East Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(260,'102 East Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(261,'102 East Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(262,'102 East Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(263,'102 East Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(264,'102 East Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(265,'102 East Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(266,'102 East Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(267,'102 East Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(268,'102 East Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(269,'102 East Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(270,'102 East Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(271,'102 East Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(272,'102 East Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(273,'102 East Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(274,'102 East Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(275,'102 East Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(276,'102 East Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(277,'102 East Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(278,'102 East Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(279,'102 East Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(280,'102 East Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(281,'102 East Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(282,'102 East Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(283,'102 East Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(284,'102 East Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(285,'102 East Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(286,'102 East Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(287,'102 East Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(288,'102 East Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(289,'102 East Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(290,'102 East Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(291,'102 East Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(292,'102 East Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(293,'102 East Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(294,'102 East Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(295,'102 East Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(296,'102 East Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(297,'102 East Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(298,'102 East Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(299,'102 East Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(300,'102 East Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(301,'102 East Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(302,'102 East Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(303,'102 East Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(304,'102 East Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(305,'102 East Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(306,'102 East Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(307,'102 East Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(308,'102 East Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(309,'102 East Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(310,'102 East Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(311,'102 East Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(312,'102 East Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(313,'102 East Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(314,'102 East Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(315,'102 East Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(316,'102 East Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(317,'102 East Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(318,'102 East Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(319,'102 East Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(320,'102 East Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(321,'102 East Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(322,'102 East Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(323,'102 East Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(324,'102 East Express','16F','BUSINESS CLASS');
/* For 103 Aegean Express*/
INSERT INTO SeatAndClass VALUES(325,'103 Aegean Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(326,'103 Aegean Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(327,'103 Aegean Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(328,'103 Aegean Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(329,'103 Aegean Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(330,'103 Aegean Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(331,'103 Aegean Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(332,'103 Aegean Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(333,'103 Aegean Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(334,'103 Aegean Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(335,'103 Aegean Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(336,'103 Aegean Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(337,'103 Aegean Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(338,'103 Aegean Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(339,'103 Aegean Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(340,'103 Aegean Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(341,'103 Aegean Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(342,'103 Aegean Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(343,'103 Aegean Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(344,'103 Aegean Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(345,'103 Aegean Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(346,'103 Aegean Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(347,'103 Aegean Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(348,'103 Aegean Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(349,'103 Aegean Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(350,'103 Aegean Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(351,'103 Aegean Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(352,'103 Aegean Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(353,'103 Aegean Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(354,'103 Aegean Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(355,'103 Aegean Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(356,'103 Aegean Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(357,'103 Aegean Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(358,'103 Aegean Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(359,'103 Aegean Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(360,'103 Aegean Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(361,'103 Aegean Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(362,'103 Aegean Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(363,'103 Aegean Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(364,'103 Aegean Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(365,'103 Aegean Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(366,'103 Aegean Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(367,'103 Aegean Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(368,'103 Aegean Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(369,'103 Aegean Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(370,'103 Aegean Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(371,'103 Aegean Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(372,'103 Aegean Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(373,'103 Aegean Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(374,'103 Aegean Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(375,'103 Aegean Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(376,'103 Aegean Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(377,'103 Aegean Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(378,'103 Aegean Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(379,'103 Aegean Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(380,'103 Aegean Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(381,'103 Aegean Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(382,'103 Aegean Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(383,'103 Aegean Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(384,'103 Aegean Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(385,'103 Aegean Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(386,'103 Aegean Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(387,'103 Aegean Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(388,'103 Aegean Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(389,'103 Aegean Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(390,'103 Aegean Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(391,'103 Aegean Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(392,'103 Aegean Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(393,'103 Aegean Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(394,'103 Aegean Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(395,'103 Aegean Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(396,'103 Aegean Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(397,'103 Aegean Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(398,'103 Aegean Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(399,'103 Aegean Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(400,'103 Aegean Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(401,'103 Aegean Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(402,'103 Aegean Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(403,'103 Aegean Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(404,'103 Aegean Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(405,'103 Aegean Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(406,'103 Aegean Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(407,'103 Aegean Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(408,'103 Aegean Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(409,'103 Aegean Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(410,'103 Aegean Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(411,'103 Aegean Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(412,'103 Aegean Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(413,'103 Aegean Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(414,'103 Aegean Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(415,'103 Aegean Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(416,'103 Aegean Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(417,'103 Aegean Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(418,'103 Aegean Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(419,'103 Aegean Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(420,'103 Aegean Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(421,'103 Aegean Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(422,'103 Aegean Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(423,'103 Aegean Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(424,'103 Aegean Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(425,'103 Aegean Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(426,'103 Aegean Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(427,'103 Aegean Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(428,'103 Aegean Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(429,'103 Aegean Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(430,'103 Aegean Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(431,'103 Aegean Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(432,'103 Aegean Express','16F','BUSINESS CLASS');
/* For 106 South Kurtulan Express*/
INSERT INTO SeatAndClass VALUES(433,'106 South Kurtulan Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(434,'106 South Kurtulan Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(435,'106 South Kurtulan Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(436,'106 South Kurtulan Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(437,'106 South Kurtulan Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(438,'106 South Kurtulan Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(439,'106 South Kurtulan Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(440,'106 South Kurtulan Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(441,'106 South Kurtulan Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(442,'106 South Kurtulan Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(443,'106 South Kurtulan Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(444,'106 South Kurtulan Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(445,'106 South Kurtulan Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(446,'106 South Kurtulan Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(447,'106 South Kurtulan Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(448,'106 South Kurtulan Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(449,'106 South Kurtulan Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(450,'106 South Kurtulan Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(451,'106 South Kurtulan Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(452,'106 South Kurtulan Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(453,'106 South Kurtulan Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(454,'106 South Kurtulan Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(455,'106 South Kurtulan Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(456,'106 South Kurtulan Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(457,'106 South Kurtulan Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(458,'106 South Kurtulan Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(459,'106 South Kurtulan Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(460,'106 South Kurtulan Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(461,'106 South Kurtulan Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(462,'106 South Kurtulan Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(463,'106 South Kurtulan Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(464,'106 South Kurtulan Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(465,'106 South Kurtulan Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(466,'106 South Kurtulan Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(467,'106 South Kurtulan Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(468,'106 South Kurtulan Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(469,'106 South Kurtulan Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(470,'106 South Kurtulan Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(471,'106 South Kurtulan Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(472,'106 South Kurtulan Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(473,'106 South Kurtulan Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(474,'106 South Kurtulan Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(475,'106 South Kurtulan Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(476,'106 South Kurtulan Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(477,'106 South Kurtulan Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(478,'106 South Kurtulan Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(479,'106 South Kurtulan Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(480,'106 South Kurtulan Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(481,'106 South Kurtulan Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(482,'106 South Kurtulan Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(483,'106 South Kurtulan Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(484,'106 South Kurtulan Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(485,'106 South Kurtulan Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(486,'106 South Kurtulan Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(487,'106 South Kurtulan Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(488,'106 South Kurtulan Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(489,'106 South Kurtulan Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(490,'106 South Kurtulan Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(491,'106 South Kurtulan Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(492,'106 South Kurtulan Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(493,'106 South Kurtulan Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(494,'106 South Kurtulan Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(495,'106 South Kurtulan Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(496,'106 South Kurtulan Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(497,'106 South Kurtulan Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(498,'106 South Kurtulan Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(499,'106 South Kurtulan Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(500,'106 South Kurtulan Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(501,'106 South Kurtulan Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(502,'106 South Kurtulan Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(503,'106 South Kurtulan Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(504,'106 South Kurtulan Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(505,'106 South Kurtulan Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(506,'106 South Kurtulan Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(507,'106 South Kurtulan Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(508,'106 South Kurtulan Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(509,'106 South Kurtulan Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(510,'106 South Kurtulan Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(511,'106 South Kurtulan Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(512,'106 South Kurtulan Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(513,'106 South Kurtulan Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(514,'106 South Kurtulan Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(515,'106 South Kurtulan Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(516,'106 South Kurtulan Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(517,'106 South Kurtulan Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(518,'106 South Kurtulan Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(519,'106 South Kurtulan Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(520,'106 South Kurtulan Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(521,'106 South Kurtulan Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(522,'106 South Kurtulan Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(523,'106 South Kurtulan Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(524,'106 South Kurtulan Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(525,'106 South Kurtulan Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(526,'106 South Kurtulan Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(527,'106 South Kurtulan Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(528,'106 South Kurtulan Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(529,'106 South Kurtulan Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(530,'106 South Kurtulan Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(531,'106 South Kurtulan Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(532,'106 South Kurtulan Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(533,'106 South Kurtulan Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(534,'106 South Kurtulan Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(535,'106 South Kurtulan Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(536,'106 South Kurtulan Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(537,'106 South Kurtulan Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(538,'106 South Kurtulan Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(539,'106 South Kurtulan Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(540,'106 South Kurtulan Express','16F','BUSINESS CLASS');
/* For 107 İzmir Blue Train*/
INSERT INTO SeatAndClass VALUES(541,'107 İzmir Blue Train','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(542,'107 İzmir Blue Train','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(543,'107 İzmir Blue Train','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(544,'107 İzmir Blue Train','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(545,'107 İzmir Blue Train','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(546,'107 İzmir Blue Train','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(547,'107 İzmir Blue Train','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(548,'107 İzmir Blue Train','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(549,'107 İzmir Blue Train','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(550,'107 İzmir Blue Train','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(551,'107 İzmir Blue Train','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(552,'107 İzmir Blue Train','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(553,'107 İzmir Blue Train','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(554,'107 İzmir Blue Train','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(555,'107 İzmir Blue Train','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(556,'107 İzmir Blue Train','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(557,'107 İzmir Blue Train','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(558,'107 İzmir Blue Train','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(559,'107 İzmir Blue Train','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(560,'107 İzmir Blue Train','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(561,'107 İzmir Blue Train','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(562,'107 İzmir Blue Train','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(563,'107 İzmir Blue Train','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(564,'107 İzmir Blue Train','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(565,'107 İzmir Blue Train','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(566,'107 İzmir Blue Train','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(567,'107 İzmir Blue Train','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(568,'107 İzmir Blue Train','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(569,'107 İzmir Blue Train','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(570,'107 İzmir Blue Train','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(571,'107 İzmir Blue Train','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(572,'107 İzmir Blue Train','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(573,'107 İzmir Blue Train','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(574,'107 İzmir Blue Train','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(575,'107 İzmir Blue Train','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(576,'107 İzmir Blue Train','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(577,'107 İzmir Blue Train','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(578,'107 İzmir Blue Train','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(579,'107 İzmir Blue Train','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(580,'107 İzmir Blue Train','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(581,'107 İzmir Blue Train','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(582,'107 İzmir Blue Train','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(583,'107 İzmir Blue Train','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(584,'107 İzmir Blue Train','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(585,'107 İzmir Blue Train','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(586,'107 İzmir Blue Train','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(587,'107 İzmir Blue Train','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(588,'107 İzmir Blue Train','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(589,'107 İzmir Blue Train','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(590,'107 İzmir Blue Train','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(591,'107 İzmir Blue Train','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(592,'107 İzmir Blue Train','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(593,'107 İzmir Blue Train','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(594,'107 İzmir Blue Train','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(595,'107 İzmir Blue Train','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(596,'107 İzmir Blue Train','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(597,'107 İzmir Blue Train','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(598,'107 İzmir Blue Train','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(599,'107 İzmir Blue Train','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(600,'107 İzmir Blue Train','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(601,'107 İzmir Blue Train','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(602,'107 İzmir Blue Train','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(603,'107 İzmir Blue Train','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(604,'107 İzmir Blue Train','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(605,'107 İzmir Blue Train','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(606,'107 İzmir Blue Train','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(607,'107 İzmir Blue Train','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(608,'107 İzmir Blue Train','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(609,'107 İzmir Blue Train','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(610,'107 İzmir Blue Train','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(611,'107 İzmir Blue Train','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(612,'107 İzmir Blue Train','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(613,'107 İzmir Blue Train','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(614,'107 İzmir Blue Train','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(615,'107 İzmir Blue Train','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(616,'107 İzmir Blue Train','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(617,'107 İzmir Blue Train','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(618,'107 İzmir Blue Train','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(619,'107 İzmir Blue Train','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(620,'107 İzmir Blue Train','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(621,'107 İzmir Blue Train','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(622,'107 İzmir Blue Train','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(623,'107 İzmir Blue Train','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(624,'107 İzmir Blue Train','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(625,'107 İzmir Blue Train','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(626,'107 İzmir Blue Train','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(627,'107 İzmir Blue Train','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(628,'107 İzmir Blue Train','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(629,'107 İzmir Blue Train','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(630,'107 İzmir Blue Train','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(631,'107 İzmir Blue Train','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(632,'107 İzmir Blue Train','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(633,'107 İzmir Blue Train','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(634,'107 İzmir Blue Train','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(635,'107 İzmir Blue Train','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(636,'107 İzmir Blue Train','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(637,'107 İzmir Blue Train','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(638,'107 İzmir Blue Train','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(639,'107 İzmir Blue Train','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(640,'107 İzmir Blue Train','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(641,'107 İzmir Blue Train','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(642,'107 İzmir Blue Train','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(643,'107 İzmir Blue Train','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(644,'107 İzmir Blue Train','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(645,'107 İzmir Blue Train','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(646,'107 İzmir Blue Train','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(647,'107 İzmir Blue Train','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(648,'107 İzmir Blue Train','16F','BUSINESS CLASS');
/* For 111 Toros Express*/
INSERT INTO SeatAndClass VALUES(649,'111 Toros Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(650,'111 Toros Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(651,'111 Toros Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(652,'111 Toros Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(653,'111 Toros Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(654,'111 Toros Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(655,'111 Toros Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(656,'111 Toros Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(657,'111 Toros Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(658,'111 Toros Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(659,'111 Toros Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(660,'111 Toros Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(661,'111 Toros Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(662,'111 Toros Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(663,'111 Toros Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(664,'111 Toros Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(665,'111 Toros Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(666,'111 Toros Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(667,'111 Toros Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(668,'111 Toros Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(669,'111 Toros Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(670,'111 Toros Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(671,'111 Toros Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(672,'111 Toros Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(673,'111 Toros Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(674,'111 Toros Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(675,'111 Toros Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(676,'111 Toros Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(677,'111 Toros Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(678,'111 Toros Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(679,'111 Toros Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(680,'111 Toros Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(681,'111 Toros Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(682,'111 Toros Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(683,'111 Toros Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(684,'111 Toros Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(685,'111 Toros Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(686,'111 Toros Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(687,'111 Toros Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(688,'111 Toros Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(689,'111 Toros Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(690,'111 Toros Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(691,'111 Toros Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(692,'111 Toros Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(693,'111 Toros Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(694,'111 Toros Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(695,'111 Toros Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(696,'111 Toros Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(697,'111 Toros Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(698,'111 Toros Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(699,'111 Toros Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(700,'111 Toros Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(701,'111 Toros Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(702,'111 Toros Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(703,'111 Toros Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(704,'111 Toros Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(705,'111 Toros Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(706,'111 Toros Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(707,'111 Toros Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(708,'111 Toros Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(709,'111 Toros Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(710,'111 Toros Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(711,'111 Toros Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(712,'111 Toros Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(713,'111 Toros Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(714,'111 Toros Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(715,'111 Toros Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(716,'111 Toros Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(717,'111 Toros Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(718,'111 Toros Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(719,'111 Toros Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(720,'111 Toros Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(721,'111 Toros Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(722,'111 Toros Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(723,'111 Toros Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(724,'111 Toros Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(725,'111 Toros Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(726,'111 Toros Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(727,'111 Toros Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(728,'111 Toros Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(729,'111 Toros Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(730,'111 Toros Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(731,'111 Toros Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(732,'111 Toros Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(733,'111 Toros Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(734,'111 Toros Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(735,'111 Toros Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(736,'111 Toros Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(737,'111 Toros Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(738,'111 Toros Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(739,'111 Toros Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(740,'111 Toros Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(741,'111 Toros Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(742,'111 Toros Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(743,'111 Toros Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(744,'111 Toros Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(745,'111 Toros Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(746,'111 Toros Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(747,'111 Toros Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(748,'111 Toros Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(749,'111 Toros Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(750,'111 Toros Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(751,'111 Toros Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(752,'111 Toros Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(753,'111 Toros Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(754,'111 Toros Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(755,'111 Toros Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(756,'111 Toros Express','16F','BUSINESS CLASS');
/* For 112 Van Lake Express*/
INSERT INTO SeatAndClass VALUES(757,'112 Van Lake Express','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(758,'112 Van Lake Express','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(759,'112 Van Lake Express','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(760,'112 Van Lake Express','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(761,'112 Van Lake Express','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(762,'112 Van Lake Express','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(763,'112 Van Lake Express','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(764,'112 Van Lake Express','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(765,'112 Van Lake Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(766,'112 Van Lake Express','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(767,'112 Van Lake Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(768,'112 Van Lake Express','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(769,'112 Van Lake Express','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(770,'112 Van Lake Express','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(771,'112 Van Lake Express','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(772,'112 Van Lake Express','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(773,'112 Van Lake Express','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(774,'112 Van Lake Express','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(775,'112 Van Lake Express','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(776,'112 Van Lake Express','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(777,'112 Van Lake Express','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(778,'112 Van Lake Express','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(779,'112 Van Lake Express','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(780,'112 Van Lake Express','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(781,'112 Van Lake Express','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(782,'112 Van Lake Express','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(783,'112 Van Lake Express','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(784,'112 Van Lake Express','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(785,'112 Van Lake Express','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(786,'112 Van Lake Express','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(787,'112 Van Lake Express','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(788,'112 Van Lake Express','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(789,'112 Van Lake Express','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(790,'112 Van Lake Express','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(791,'112 Van Lake Express','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(792,'112 Van Lake Express','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(793,'112 Van Lake Express','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(794,'112 Van Lake Express','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(795,'112 Van Lake Express','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(796,'112 Van Lake Express','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(797,'112 Van Lake Express','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(798,'112 Van Lake Express','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(799,'112 Van Lake Express','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(800,'112 Van Lake Express','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(801,'112 Van Lake Express','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(802,'112 Van Lake Express','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(803,'112 Van Lake Express','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(804,'112 Van Lake Express','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(805,'112 Van Lake Express','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(806,'112 Van Lake Express','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(807,'112 Van Lake Express','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(808,'112 Van Lake Express','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(809,'112 Van Lake Express','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(810,'112 Van Lake Express','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(811,'112 Van Lake Express','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(812,'112 Van Lake Express','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(813,'112 Van Lake Express','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(814,'112 Van Lake Express','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(815,'112 Van Lake Express','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(816,'112 Van Lake Express','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(817,'112 Van Lake Express','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(818,'112 Van Lake Express','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(819,'112 Van Lake Express','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(820,'112 Van Lake Express','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(821,'112 Van Lake Express','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(822,'112 Van Lake Express','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(823,'112 Van Lake Express','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(824,'112 Van Lake Express','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(825,'112 Van Lake Express','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(826,'112 Van Lake Express','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(827,'112 Van Lake Express','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(828,'112 Van Lake Express','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(829,'112 Van Lake Express','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(830,'112 Van Lake Express','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(831,'112 Van Lake Express','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(832,'112 Van Lake Express','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(833,'112 Van Lake Express','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(834,'112 Van Lake Express','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(835,'112 Van Lake Express','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(836,'112 Van Lake Express','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(837,'112 Van Lake Express','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(838,'112 Van Lake Express','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(839,'112 Van Lake Express','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(840,'112 Van Lake Express','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(841,'112 Van Lake Express','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(842,'112 Van Lake Express','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(843,'112 Van Lake Express','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(844,'112 Van Lake Express','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(845,'112 Van Lake Express','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(846,'112 Van Lake Express','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(847,'112 Van Lake Express','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(848,'112 Van Lake Express','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(849,'112 Van Lake Express','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(850,'112 Van Lake Express','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(851,'112 Van Lake Express','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(852,'112 Van Lake Express','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(853,'112 Van Lake Express','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(854,'112 Van Lake Express','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(855,'112 Van Lake Express','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(856,'112 Van Lake Express','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(857,'112 Van Lake Express','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(858,'112 Van Lake Express','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(859,'112 Van Lake Express','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(860,'112 Van Lake Express','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(861,'112 Van Lake Express','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(862,'112 Van Lake Express','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(863,'112 Van Lake Express','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(864,'112 Van Lake Express','16F','BUSINESS CLASS');
/* For 113 High Speed Train*/
INSERT INTO SeatAndClass VALUES(865,'113 High Speed Train','1A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(866,'113 High Speed Train','1C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(867,'113 High Speed Train','1F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(868,'113 High Speed Train','2A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(869,'113 High Speed Train','2C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(870,'113 High Speed Train','2D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(871,'113 High Speed Train','2F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(872,'113 High Speed Train','3A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(873,'113 High Speed Train','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(874,'113 High Speed Train','3D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(875,'113 High Speed Train','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(876,'113 High Speed Train','4A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(877,'113 High Speed Train','4C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(878,'113 High Speed Train','4D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(879,'113 High Speed Train','4F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(880,'113 High Speed Train','5A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(881,'113 High Speed Train','5C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(882,'113 High Speed Train','5D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(883,'113 High Speed Train','5F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(884,'113 High Speed Train','6A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(885,'113 High Speed Train','6C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(886,'113 High Speed Train','6D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(887,'113 High Speed Train','6F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(888,'113 High Speed Train','7A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(889,'113 High Speed Train','7C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(890,'113 High Speed Train','7D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(891,'113 High Speed Train','7F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(892,'113 High Speed Train','8A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(893,'113 High Speed Train','8C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(894,'113 High Speed Train','8D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(895,'113 High Speed Train','8F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(896,'113 High Speed Train','9A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(897,'113 High Speed Train','9C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(898,'113 High Speed Train','9D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(899,'113 High Speed Train','9F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(900,'113 High Speed Train','10A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(901,'113 High Speed Train','10C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(902,'113 High Speed Train','10D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(903,'113 High Speed Train','10F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(904,'113 High Speed Train','11A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(905,'113 High Speed Train','11C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(906,'113 High Speed Train','11D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(907,'113 High Speed Train','11F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(908,'113 High Speed Train','12A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(909,'113 High Speed Train','12C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(910,'113 High Speed Train','12D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(911,'113 High Speed Train','12F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(912,'113 High Speed Train','13A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(913,'113 High Speed Train','13C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(914,'113 High Speed Train','13D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(915,'113 High Speed Train','13F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(916,'113 High Speed Train','14A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(917,'113 High Speed Train','14C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(918,'113 High Speed Train','14D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(919,'113 High Speed Train','14F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(920,'113 High Speed Train','15A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(921,'113 High Speed Train','15C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(922,'113 High Speed Train','15D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(923,'113 High Speed Train','15F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(924,'113 High Speed Train','16A','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(925,'113 High Speed Train','16C','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(926,'113 High Speed Train','16D','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(927,'113 High Speed Train','16F','ECONOMY CLASS');
INSERT INTO SeatAndClass VALUES(928,'113 High Speed Train','1A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(929,'113 High Speed Train','1F','BUSINESS CLASS'); 
INSERT INTO SeatAndClass VALUES(930,'113 High Speed Train','2A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(931,'113 High Speed Train','2F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(932,'113 High Speed Train','3A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(933,'113 High Speed Train','3C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(934,'113 High Speed Train','3F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(935,'113 High Speed Train','4A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(936,'113 High Speed Train','4C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(937,'113 High Speed Train','4F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(938,'113 High Speed Train','5A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(939,'113 High Speed Train','5C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(940,'113 High Speed Train','5F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(941,'113 High Speed Train','6A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(942,'113 High Speed Train','6C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(943,'113 High Speed Train','6F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(944,'113 High Speed Train','7A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(945,'113 High Speed Train','7C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(946,'113 High Speed Train','7F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(947,'113 High Speed Train','8A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(948,'113 High Speed Train','8C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(949,'113 High Speed Train','8F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(950,'113 High Speed Train','9A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(951,'113 High Speed Train','9C','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(952,'113 High Speed Train','9F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(953,'113 High Speed Train','10A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(954,'113 High Speed Train','10F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(955,'113 High Speed Train','11A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(956,'113 High Speed Train','11D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(957,'113 High Speed Train','11F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(958,'113 High Speed Train','12A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(959,'113 High Speed Train','12D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(960,'113 High Speed Train','12F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(961,'113 High Speed Train','13A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(962,'113 High Speed Train','13D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(963,'113 High Speed Train','13F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(964,'113 High Speed Train','14A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(965,'113 High Speed Train','14D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(966,'113 High Speed Train','14F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(967,'113 High Speed Train','15A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(968,'113 High Speed Train','15D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(969,'113 High Speed Train','15F','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(970,'113 High Speed Train','16A','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(971,'113 High Speed Train','16D','BUSINESS CLASS');
INSERT INTO SeatAndClass VALUES(972,'113 High Speed Train','16F','BUSINESS CLASS');

/*Stations in System*/
INSERT INTO Station VALUES('İzmir', 'IZMIR');
INSERT INTO Station VALUES('Balıkesir','BALIKESIR');
INSERT INTO Station VALUES('Ankara', 'ANKARA');
INSERT INTO Station VALUES('Kayseri','KAYSERI');
INSERT INTO Station VALUES('Sivas','SIVAS');
INSERT INTO Station VALUES('Erzincan','ERZINCAN');
INSERT INTO Station VALUES('Kars','KARS');
INSERT INTO Station VALUES('Malatya','MALATYA');
INSERT INTO Station VALUES('Adana','ADANA');
INSERT INTO Station VALUES('Diyarbakır','DIYARBAKIR');
INSERT INTO Station VALUES('Eskişehir','ESKISEHIR');
INSERT INTO Station VALUES('Konya','KONYA');
INSERT INTO Station VALUES('Van','VAN');
INSERT INTO Station VALUES('İstanbul','ISTANBUL');

/*Routes in System*/
/*1. Hafta*/
/*Route: İzmir-Balıkesir*/
INSERT INTO Route VALUES (1,'IZMIR','BALIKESIR','07:00 ','09:00 ','2020-12-01','100 6 September Express',50.00);
INSERT INTO Route VALUES (2,'IZMIR','BALIKESIR','13:00','15:00','2020-12-01','100 6 September Express',50.00);
INSERT INTO Route VALUES (3,'IZMIR','BALIKESIR','09:00','11:00','2020-12-06','101 17 September Express',50.00);
INSERT INTO Route VALUES (4,'IZMIR','BALIKESIR','15:00','17:00','2020-12-06','101 17 September Express',50.00);
INSERT INTO Route VALUES (5,'IZMIR','BALIKESIR','12:00','14:00','2020-12-03', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (6,'IZMIR','BALIKESIR','18:00','20:00','2020-12-03', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (7,'IZMIR','BALIKESIR','08:00','09:00','2020-12-05','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (8,'IZMIR','BALIKESIR','20:00','21:00','2020-12-05','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (9,'IZMIR','BALIKESIR','08:00','09:00','2020-12-03','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (10,'IZMIR','BALIKESIR','20:00','21:00','2020-12-03','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (11,'BALIKESIR', 'IZMIR', '10:00','12:00','2020-12-01','100 6 September Express',50.00);
INSERT INTO Route VALUES (12,'BALIKESIR', 'IZMIR', '16:00','18:00','2020-12-01','100 6 September Express',50.00);
INSERT INTO Route VALUES (13,'BALIKESIR', 'IZMIR', '12:00', '14:00','2020-12-06','101 17 September Express',50.00);
INSERT INTO Route VALUES (14,'BALIKESIR', 'IZMIR', '18:00', '20:00','2020-12-06','101 17 September Express',50.00);
INSERT INTO Route VALUES (15,'BALIKESIR', 'IZMIR',' 15:00', '17:00','2020-12-03', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (16,'BALIKESIR', 'IZMIR',' 21:00', '23:00','2020-12-03','103 Aegean Express',50.00);
INSERT INTO Route VALUES (17,'BALIKESIR', 'IZMIR','06:00','07:00','2020-12-05','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (18,'BALIKESIR', 'IZMIR','18:00','19:00','2020-12-05','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (19,'BALIKESIR', 'IZMIR','06:00','07:00','2020-12-03','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (20,'BALIKESIR', 'IZMIR','18:00','19:00','2020-12-03','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (21,'IZMIR','BALIKESIR','04:00','05:00 ','2020-12-05','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (22,'IZMIR','BALIKESIR','16:00','17:00 ','2020-12-05','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (23,'IZMIR','BALIKESIR','04:00','05:00 ','2020-12-03','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (24,'IZMIR','BALIKESIR','16:00','17:00 ','2020-12-03','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (25,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-05','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (26,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-05','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (27,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-03','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (28,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-03','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(29,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-05','113 High Speed Train',30.00);
INSERT INTO Route VALUES(30,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-05','113 High Speed Train',30.00);
INSERT INTO Route VALUES(31,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-03','113 High Speed Train',30.00);
INSERT INTO Route VALUES(32,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-03','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(33,'ESKISEHIR','ISTANBUL','12:00','13:00','2020-12-05','113 High Speed Train',30.00);
INSERT INTO Route VALUES(34,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-05','113 High Speed Train',30.00);
INSERT INTO Route VALUES(35,'ESKISEHIR','ISTANBUL','12:00','13:00','2020-12-03','113 High Speed Train',30.00);
INSERT INTO Route VALUES(36,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-03','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (37,'ANKARA','KAYSERI','06:00', '07:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (38,'ANKARA','KAYSERI','22:00', '23:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (39,'ANKARA','KAYSERI','06:00', '07:00','2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (40,'ANKARA','KAYSERI','22:00', '23:00','2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (41,'ANKARA','KAYSERI','06:00','07:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (42,'ANKARA','KAYSERI','22:00','23:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (43,'ANKARA','KAYSERI','06:00','07:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (44,'ANKARA','KAYSERI','22:00','23:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (45,'ANKARA','KAYSERI','10:00','11:00','2020-12-02','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (46,'ANKARA','KAYSERI','18:00','19:00','2020-12-02','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (47,'KAYSERI','ANKARA','20:00', '21:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (48,'KAYSERI','ANKARA','12:00', '13:00','2020-12-02','110 East Express',30.00);
INSERT INTO Route VALUES (49,'KAYSERI','ANKARA','20:00', '21:00','2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (50,'KAYSERI','ANKARA','12:00', '13:00','2020-12-04','110 East Express',30.00);
INSERT INTO Route VALUES (51,'KAYSERI','ANKARA','20:00', '21:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (52,'KAYSERI','ANKARA','12:00', '13:00','2020-12-05','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (53,'KAYSERI','ANKARA','20:00', '21:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (54,'KAYSERI','ANKARA','12:00', '13:00','2020-12-03','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (55,'KAYSERI','ANKARA','16:00', '17:00','2020-12-02','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (56,'KAYSERI','ANKARA','24:00', '01:00', '2020-12-02','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (57,'KAYSERI','SIVAS','08:00','09:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (58,'KAYSERI','SIVAS','24:00','01:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (59,'KAYSERI','SIVAS','08:00','09:00', '2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (60,'KAYSERI','SIVAS','24:00','01:00', '2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (61,'KAYSERI','SIVAS','08:00','09:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (62,'KAYSERI','SIVAS','24:00','01:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (63,'KAYSERI','SIVAS','08:00','09:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (64,'KAYSERI','SIVAS','24:00','01:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (65,'KAYSERI','SIVAS','12:00','13:00','2020-12-02','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (66,'KAYSERI','SIVAS','20:00','21:00','2020-12-02','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (67,'SIVAS','KAYSERI','18:00','19:00','2020-12-01','110 East Express',30.00);
INSERT INTO Route VALUES (68,'SIVAS','KAYSERI','10:00','11:00','2020-12-02','110 East Express',30.00);
INSERT INTO Route VALUES (69,'SIVAS','KAYSERI','18:00','19:00','2020-12-03','110 East Express',30.00);
INSERT INTO Route VALUES (70,'SIVAS','KAYSERI','10:00','11:00','2020-12-04','110 East Express',30.00);
INSERT INTO Route VALUES (71,'SIVAS','KAYSERI','18:00','19:00','2020-12-04','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (72,'SIVAS','KAYSERI','10:00','11:00','2020-12-05','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (73,'SIVAS','KAYSERI','18:00','19:00','2020-12-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (74,'SIVAS','KAYSERI','10:00','11:00','2020-12-03','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (75,'SIVAS','KAYSERI','14:00','15:00','2020-12-02','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (76,'SIVAS','KAYSERI','22:00','23:00','2020-12-02','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (77,'SIVAS','MALATYA','10:00','11:00','2020-12-04','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (78,'SIVAS','MALATYA','02:00','03:00','2020-12-05','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (79,'SIVAS','MALATYA','10:00','11:00', '2020-12-02','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (80,'SIVAS','MALATYA','02:00','03:00','2020-12-03','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (81,'MALATYA','SIVAS','16:00','17:00','2020-12-04','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (82,'MALATYA','SIVAS','08:00','09:00','2020-12-05','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (83,'MALATYA','SIVAS','16:00','17:00','2020-12-02','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (84,'MALATYA','SIVAS','08:00','09:00','2020-12-03','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (85,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-04','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (86,'MALATYA','DIYARBAKIR','04:00','05:00','2020-12-05','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (87,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-02','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (88,'MALATYA','DIYARBAKIR','04:00','05:00','2020-12-03','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (89,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-04','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (90,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-05','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (91,'DIYARBAKIR','MALATYA','14:00','15:00','2020-12-02','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (92,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-03','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (93,'SIVAS','ERZINCAN','10:00','11:00','2020-12-01','110 East Express',45.00);
INSERT INTO Route VALUES (94,'SIVAS','ERZINCAN','02:00','03:00', '2020-12-02','110 East Express',45.00);
INSERT INTO Route VALUES (95,'SIVAS','ERZINCAN','10:00','11:00', '2020-12-03','110 East Express',45.00);
INSERT INTO Route VALUES (96,'SIVAS','ERZINCAN','02:00','03:00','2020-12-04','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (97,'ERZINCAN','SIVAS','16:00','17:00','2020-12-01','110 East Express',45.00);
INSERT INTO Route VALUES (98,'ERZINCAN','SIVAS','08:00','09:00','2020-12-02','110 East Express',45.00);
INSERT INTO Route VALUES (99,'ERZINCAN','SIVAS','16:00','17:00','2020-12-03','110 East Express',45.00);
INSERT INTO Route VALUES (100,'ERZINCAN','SIVAS','08:00','09:00','2020-12-04','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (101,'ERZINCAN','KARS','12:00','13:00','2020-12-01','110 East Express',35.00);
INSERT INTO Route VALUES (102,'ERZINCAN','KARS','04:00','05:00', '2020-12-02','110 East Express',35.00);
INSERT INTO Route VALUES (103,'ERZINCAN','KARS','12:00','13:00','2020-12-03','110 East Express',35.00);
INSERT INTO Route VALUES (104,'ERZINCAN','KARS','04:00','05:00','2020-12-04','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (105,'KARS','ERZINCAN','14:00','15:00','2020-12-01','110 East Express',35.00);
INSERT INTO Route VALUES (106,'KARS','ERZINCAN','06:00','07:00','2020-12-02','110 East Express',35.00);
INSERT INTO Route VALUES (107,'KARS','ERZINCAN','14:00','15:00','2020-12-03','110 East Express',35.00);
INSERT INTO Route VALUES (108,'KARS','ERZINCAN','06:00','07:00','2020-12-04','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (109,'ADANA','KONYA','11:00','12:00', '2020-12-02','111 Toros Express',55.00);
INSERT INTO Route VALUES (110,'ADANA','KONYA','19:00','20:00', '2020-12-02','111 Toros Express',55.00);
INSERT INTO Route VALUES (111,'ADANA','KONYA','11:00','12:00', '2020-12-04','111 Toros Express',55.00);
INSERT INTO Route VALUES (112,'ADANA','KONYA','19:00','20:00','2020-12-04','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (113,'KONYA','ADANA','09:00','10:00', '2020-12-02','111 Toros Express',55.00);
INSERT INTO Route VALUES (114,'KONYA','ADANA','17:00','18:00','2020-12-02','111 Toros Express',55.00);
INSERT INTO Route VALUES (115,'KONYA','ADANA','09:00','10:00', '2020-12-04','111 Toros Express',55.00);
INSERT INTO Route VALUES (116,'KONYA','ADANA','17:00','18:00', '2020-12-04','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (117,'KONYA','ISTANBUL','13:00','14:00','2020-12-02','113 High Speed Train',60.00);
INSERT INTO Route VALUES (118,'KONYA','ISTANBUL','21:00','22:00','2020-12-02','113 High Speed Train',60.00);
INSERT INTO Route VALUES (119,'KONYA','ISTANBUL','13:00','14:00','2020-12-04','113 High Speed Train',60.00);
INSERT INTO Route VALUES (120,'KONYA','ISTANBUL','21:00','22:00', '2020-12-04','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (121,'ISTANBUL','KONYA','07:00','08:00','2020-12-02','113 High Speed Train',60.00);
INSERT INTO Route VALUES (122,'ISTANBUL','KONYA','15:00','16:00','2020-12-02','113 High Speed Train',60.00);
INSERT INTO Route VALUES (123,'ISTANBUL','KONYA','07:00','08:00','2020-12-04','113 High Speed Train',60.00);
INSERT INTO Route VALUES (124,'ISTANBUL','KONYA','15:00','16:00', '2020-12-04','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (125,'ANKARA','VAN','11:00','12:00','2020-12-01','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (126,'ANKARA','VAN','19:00','20:00','2020-12-01','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (127,'ANKARA','VAN','11:00','12:00','2020-12-06','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (128,'ANKARA','VAN','19:00','20:00', '2020-12-06','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (129,'VAN','ANKARA','13:00','14:00','2020-12-01','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (130,'VAN','ANKARA','21:00','22:00','2020-12-01','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (131,'VAN','ANKARA','13:00','14:00','2020-12-06','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (132,'VAN','ANKARA','21:00','22:00','2020-12-06','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (133,'ISTANBUL','ANKARA','09:00','10:00','2020-12-01','113 High Speed Train',40.00);
INSERT INTO Route VALUES (134,'ISTANBUL','ANKARA','17:00','18:00','2020-12-01','113 High Speed Train',40.00);
INSERT INTO Route VALUES (135,'ISTANBUL','ANKARA','09:00','10:00', '2020-12-06','113 High Speed Train',40.00);
INSERT INTO Route VALUES (136,'ISTANBUL','ANKARA','17:00','18:00','2020-12-06','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (137,'ANKARA','ISTANBUL','15:00','16:00','2020-12-01','113 High Speed Train',40.00);
INSERT INTO Route VALUES (138,'ANKARA','ISTANBUL','23:00','24:00','2020-12-01','113 High Speed Train',40.00);
INSERT INTO Route VALUES (139,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-06','113 High Speed Train',40.00);
INSERT INTO Route VALUES (140,'ANKARA','ISTANBUL','23:00','24:00','2020-12-06','113 High Speed Train',40.00);

/*2. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (141,'IZMIR','BALIKESIR','07:00 ','09:00 ','2020-12-08','100 6 September Express',50.00);
INSERT INTO Route VALUES (142,'IZMIR','BALIKESIR','13:00','15:00','2020-12-08','100 6 September Express',50.00);
INSERT INTO Route VALUES (143,'IZMIR','BALIKESIR','09:00','11:00', '2020-12-13','101 17 September Express',50.00);
INSERT INTO Route VALUES (144,'IZMIR','BALIKESIR','15:00','17:00',  '2020-12-13','101 17 September Express',50.00);
INSERT INTO Route VALUES (145,'IZMIR','BALIKESIR','12:00','14:00','2020-12-10', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (146,'IZMIR','BALIKESIR','18:00','20:00', '2020-12-10', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (147,'IZMIR','BALIKESIR','08:00','09:00', '2020-12-12','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (148,'IZMIR','BALIKESIR','20:00','21:00', '2020-12-12','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (149,'IZMIR','BALIKESIR','08:00','09:00','2020-12-10','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (150,'IZMIR','BALIKESIR','20:00','21:00','2020-12-10','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (151,'BALIKESIR', 'IZMIR', '10:00','12:00','2020-12-08','100 6 September Express',50.00);
INSERT INTO Route VALUES (152,'BALIKESIR', 'IZMIR', '16:00','18:00','2020-12-08','100 6 September Express',50.00);
INSERT INTO Route VALUES (153,'BALIKESIR', 'IZMIR', '12:00', '14:00',  '2020-12-13','101 17 September Express',50.00);
INSERT INTO Route VALUES (154,'BALIKESIR', 'IZMIR', '18:00', '20:00', '2020-12-13','101 17 September Express',50.00);
INSERT INTO Route VALUES (155,'BALIKESIR', 'IZMIR',' 15:00', '17:00', '2020-12-10', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (156,'BALIKESIR', 'IZMIR',' 21:00', '23:00', '2020-12-10', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (157,'BALIKESIR', 'IZMIR','06:00','07:00','2020-12-12','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (158,'BALIKESIR', 'IZMIR','18:00','19:00', '2020-12-12','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (159,'BALIKESIR', 'IZMIR','06:00','07:00','2020-12-10','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (160,'BALIKESIR', 'IZMIR','18:00','19:00','2020-12-10','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (161,'IZMIR','BALIKESIR','04:00','05:00 ','2020-12-12','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (162,'IZMIR','BALIKESIR','16:00','17:00 ', '2020-12-12','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (163,'IZMIR','BALIKESIR','04:00','05:00 ','2020-12-10','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (164,'IZMIR','BALIKESIR','16:00','17:00 ','2020-12-10','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (165,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-12','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (166,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-12','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (167,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-10','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (168,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-10','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(169,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-12','113 High Speed Train',30.00);
INSERT INTO Route VALUES(170,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-12','113 High Speed Train',30.00);
INSERT INTO Route VALUES(171,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-10','113 High Speed Train',30.00);
INSERT INTO Route VALUES(172,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-10','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(173,'ESKISEHIR','ISTANBUL','12:00','13:00','2020-12-12','113 High Speed Train',30.00);
INSERT INTO Route VALUES(174,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-12','113 High Speed Train',30.00);
INSERT INTO Route VALUES(175,'ESKISEHIR','ISTANBUL','12:00','13:00','2020-12-10','113 High Speed Train',30.00);
INSERT INTO Route VALUES(176,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-10','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (177,'ANKARA','KAYSERI','06:00', '07:00','2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (178,'ANKARA','KAYSERI','22:00', '23:00', '2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (179,'ANKARA','KAYSERI','06:00', '07:00','2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (180,'ANKARA','KAYSERI','22:00', '23:00','2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (181,'ANKARA','KAYSERI','06:00','07:00', '2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (182,'ANKARA','KAYSERI','22:00','23:00', '2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (183,'ANKARA','KAYSERI','06:00','07:00','2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (184,'ANKARA','KAYSERI','22:00','23:00', '2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (185,'ANKARA','KAYSERI','10:00','11:00', '2020-12-09','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (186,'ANKARA','KAYSERI','18:00','19:00','2020-12-09','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (187,'KAYSERI','ANKARA','20:00', '21:00','2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (188,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (189,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (190,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-11','110 East Express',30.00);
INSERT INTO Route VALUES (191,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (192,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-12','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (193,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (194,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-10','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (195,'KAYSERI','ANKARA','16:00', '17:00', '2020-12-09','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (196,'KAYSERI','ANKARA','24:00', '01:00', '2020-12-09','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (197,'KAYSERI','SIVAS','08:00','09:00','2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (198,'KAYSERI','SIVAS','24:00','01:00', '2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (199,'KAYSERI','SIVAS','08:00','09:00','2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (200,'KAYSERI','SIVAS','24:00','01:00', '2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (201,'KAYSERI','SIVAS','08:00','09:00','2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (202,'KAYSERI','SIVAS','24:00','01:00','2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (203,'KAYSERI','SIVAS','08:00','09:00', '2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (204,'KAYSERI','SIVAS','24:00','01:00','2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (205,'KAYSERI','SIVAS','12:00','13:00', '2020-12-09','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (206,'KAYSERI','SIVAS','20:00','21:00','2020-12-09','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (207,'SIVAS','KAYSERI','18:00','19:00','2020-12-08','110 East Express',30.00);
INSERT INTO Route VALUES (208,'SIVAS','KAYSERI','10:00','11:00', '2020-12-09','110 East Express',30.00);
INSERT INTO Route VALUES (209,'SIVAS','KAYSERI','18:00','19:00', '2020-12-10','110 East Express',30.00);
INSERT INTO Route VALUES (210,'SIVAS','KAYSERI','10:00','11:00','2020-12-11','110 East Express',30.00);
INSERT INTO Route VALUES (211,'SIVAS','KAYSERI','18:00','19:00','2020-12-11','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (212,'SIVAS','KAYSERI','10:00','11:00', '2020-12-12','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (213,'SIVAS','KAYSERI','18:00','19:00', '2020-12-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (214,'SIVAS','KAYSERI','10:00','11:00', '2020-12-10','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (215,'SIVAS','KAYSERI','14:00','15:00', '2020-12-09','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (216,'SIVAS','KAYSERI','22:00','23:00','2020-12-09','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (217,'SIVAS','MALATYA','10:00','11:00', '2020-12-11','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (218,'SIVAS','MALATYA','02:00','03:00','2020-12-12','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (219,'SIVAS','MALATYA','10:00','11:00', '2020-12-09','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (220,'SIVAS','MALATYA','02:00','03:00','2020-12-10','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (221,'MALATYA','SIVAS','16:00','17:00','2020-12-11','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (222,'MALATYA','SIVAS','08:00','09:00','2020-12-12','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (223,'MALATYA','SIVAS','16:00','17:00','2020-12-09','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (224,'MALATYA','SIVAS','08:00','09:00','2020-12-10','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (225,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-11','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (226,'MALATYA','DIYARBAKIR','04:00','05:00','2020-12-12','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (227,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-09','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (228,'MALATYA','DIYARBAKIR','04:00','05:00','2020-12-10','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (229,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-11','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (230,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-12','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (231,'DIYARBAKIR','MALATYA','14:00','15:00','2020-12-09','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (232,'DIYARBAKIR','MALATYA','06:00','07:00', '2020-12-10','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (233,'SIVAS','ERZINCAN','10:00','11:00','2020-12-08','110 East Express',45.00);
INSERT INTO Route VALUES (234,'SIVAS','ERZINCAN','02:00','03:00', '2020-12-09','110 East Express',45.00);
INSERT INTO Route VALUES (235,'SIVAS','ERZINCAN','10:00','11:00', '2020-12-10','110 East Express',45.00);
INSERT INTO Route VALUES (236,'SIVAS','ERZINCAN','02:00','03:00', '2020-12-12','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (237,'ERZINCAN','SIVAS','16:00','17:00', '2020-12-08','110 East Express',45.00);
INSERT INTO Route VALUES (238,'ERZINCAN','SIVAS','08:00','09:00', '2020-12-09','110 East Express',45.00);
INSERT INTO Route VALUES (239,'ERZINCAN','SIVAS','16:00','17:00','2020-12-10','110 East Express',45.00);
INSERT INTO Route VALUES (240,'ERZINCAN','SIVAS','08:00','09:00', '2020-12-11','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (241,'ERZINCAN','KARS','12:00','13:00','2020-12-08','110 East Express',35.00);
INSERT INTO Route VALUES (242,'ERZINCAN','KARS','04:00','05:00', '2020-12-09','110 East Express',35.00);
INSERT INTO Route VALUES (243,'ERZINCAN','KARS','12:00','13:00', '2020-12-10','110 East Express',35.00);
INSERT INTO Route VALUES (244,'ERZINCAN','KARS','04:00','05:00','2020-12-11','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (245,'KARS','ERZINCAN','14:00','15:00','2020-12-08','110 East Express',35.00);
INSERT INTO Route VALUES (246,'KARS','ERZINCAN','06:00','07:00', '2020-12-09','110 East Express',35.00);
INSERT INTO Route VALUES (247,'KARS','ERZINCAN','14:00','15:00','2020-12-10','110 East Express',35.00);
INSERT INTO Route VALUES (248,'KARS','ERZINCAN','06:00','07:00', '2020-12-11','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (249,'ADANA','KONYA','11:00','12:00', '2020-12-09','111 Toros Express',55.00);
INSERT INTO Route VALUES (250,'ADANA','KONYA','19:00','20:00','2020-12-09','111 Toros Express',55.00);
INSERT INTO Route VALUES (251,'ADANA','KONYA','11:00','12:00', '2020-12-11','111 Toros Express',55.00);
INSERT INTO Route VALUES (252,'ADANA','KONYA','19:00','20:00', '2020-12-11','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (253,'KONYA','ADANA','09:00','10:00', '2020-12-09','111 Toros Express',55.00);
INSERT INTO Route VALUES (254,'KONYA','ADANA','17:00','18:00', '2020-12-09','111 Toros Express',55.00);
INSERT INTO Route VALUES (255,'KONYA','ADANA','09:00','10:00', '2020-12-11','111 Toros Express',55.00);
INSERT INTO Route VALUES (256,'KONYA','ADANA','17:00','18:00', '2020-12-11','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (257,'KONYA','ISTANBUL','13:00','14:00', '2020-12-09','113 High Speed Train',60.00);
INSERT INTO Route VALUES (258,'KONYA','ISTANBUL','21:00','22:00', '2020-12-09','113 High Speed Train',60.00);
INSERT INTO Route VALUES (259,'KONYA','ISTANBUL','13:00','14:00', '2020-12-11','113 High Speed Train',60.00);
INSERT INTO Route VALUES (260,'KONYA','ISTANBUL','21:00','22:00', '2020-12-11','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (261,'ISTANBUL','KONYA','07:00','08:00', '2020-12-09','113 High Speed Train',60.00);
INSERT INTO Route VALUES (262,'ISTANBUL','KONYA','15:00','16:00','2020-12-09','113 High Speed Train',60.00);
INSERT INTO Route VALUES (263,'ISTANBUL','KONYA','07:00','08:00', '2020-12-11','113 High Speed Train',60.00);
INSERT INTO Route VALUES (264,'ISTANBUL','KONYA','15:00','16:00', '2020-12-11','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (265,'ANKARA','VAN','11:00','12:00', '2020-12-08','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (266,'ANKARA','VAN','19:00','20:00', '2020-12-08','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (267,'ANKARA','VAN','11:00','12:00', '2020-12-13','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (268,'ANKARA','VAN','19:00','20:00', '2020-12-13','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (269,'VAN','ANKARA','13:00','14:00', '2020-12-08','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (270,'VAN','ANKARA','21:00','22:00','2020-12-08','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (271,'VAN','ANKARA','13:00','14:00', '2020-12-13','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (272,'VAN','ANKARA','21:00','22:00', '2020-12-13','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (273,'ISTANBUL','ANKARA','09:00','10:00','2020-12-08','113 High Speed Train',40.00);
INSERT INTO Route VALUES (274,'ISTANBUL','ANKARA','17:00','18:00', '2020-12-08','113 High Speed Train',40.00);
INSERT INTO Route VALUES (275,'ISTANBUL','ANKARA','09:00','10:00','2020-12-13','113 High Speed Train',40.00);
INSERT INTO Route VALUES (276,'ISTANBUL','ANKARA','17:00','18:00', '2020-12-13','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (277,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-08','113 High Speed Train',40.00);
INSERT INTO Route VALUES (278,'ANKARA','ISTANBUL','23:00','24:00', '2020-12-08','113 High Speed Train',40.00);
INSERT INTO Route VALUES (279,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-13','113 High Speed Train',40.00);
INSERT INTO Route VALUES (280,'ANKARA','ISTANBUL','23:00','24:00','2020-12-13','113 High Speed Train',40.00);

/*3. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (281,'IZMIR','BALIKESIR','07:00','09:00','2020-12-15','100 6 September Express',50.00);
INSERT INTO Route VALUES (282,'IZMIR','BALIKESIR','13:00','15:00','2020-12-15','100 6 September Express',50.00);
INSERT INTO Route VALUES (283,'IZMIR','BALIKESIR','09:00','11:00',  '2020-12-20','101 17 September Express',50.00);
INSERT INTO Route VALUES (284,'IZMIR','BALIKESIR','15:00','17:00',  '2020-12-20','101 17 September Express',50.00);
INSERT INTO Route VALUES (285,'IZMIR','BALIKESIR','12:00','14:00','2020-12-17', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (286,'IZMIR','BALIKESIR','18:00','20:00','2020-12-17','103 Aegean Express',50.00);
INSERT INTO Route VALUES (287,'IZMIR','BALIKESIR','08:00','09:00','2020-12-19','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (288,'IZMIR','BALIKESIR','20:00','21:00','2020-12-19','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (289,'IZMIR','BALIKESIR','08:00','09:00', '2020-12-17','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (290,'IZMIR','BALIKESIR','20:00','21:00','2020-12-17','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (291,'BALIKESIR', 'IZMIR', '10:00','12:00','2020-12-15','100 6 September Express',50.00);
INSERT INTO Route VALUES (292,'BALIKESIR', 'IZMIR', '16:00','18:00', '2020-12-15','100 6 September Express',50.00);
INSERT INTO Route VALUES (293,'BALIKESIR', 'IZMIR', '12:00', '14:00',  '2020-12-20','101 17 September Express',50.00);
INSERT INTO Route VALUES (294,'BALIKESIR', 'IZMIR', '18:00', '20:00', '2020-12-20','101 17 September Express',50.00);
INSERT INTO Route VALUES (295,'BALIKESIR', 'IZMIR',' 15:00', '17:00', '2020-12-17', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (296,'BALIKESIR', 'IZMIR',' 21:00', '23:00', '2020-12-17', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (297,'BALIKESIR', 'IZMIR','06:00','07:00', '2020-12-19','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (298,'BALIKESIR', 'IZMIR','18:00','19:00', '2020-12-19','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (299,'BALIKESIR', 'IZMIR','06:00','07:00', '2020-12-17','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (300,'BALIKESIR', 'IZMIR','18:00','19:00', '2020-12-17','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (301,'IZMIR','BALIKESIR','04:00','05:00 ', '2020-12-19','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (302,'IZMIR','BALIKESIR','16:00','17:00 ','2020-12-19','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (303,'IZMIR','BALIKESIR','04:00','05:00 ','2020-12-17','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (304,'IZMIR','BALIKESIR','16:00','17:00 ', '2020-12-17','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (305,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-19','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (306,'BALIKESIR', 'ESKISEHIR','22:01','23:00', '2020-12-19','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (307,'BALIKESIR', 'ESKISEHIR','10:00','11:00', '2020-12-17','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (308,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-17','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(309,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-19','113 High Speed Train',30.00);
INSERT INTO Route VALUES(310,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-19','113 High Speed Train',30.00);
INSERT INTO Route VALUES(311,'ISTANBUL','ESKISEHIR','02:00','03:00', '2020-12-17','113 High Speed Train',30.00);
INSERT INTO Route VALUES(312,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-17','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(313,'ESKISEHIR','ISTANBUL','12:00','13:00', '2020-12-19','113 High Speed Train',30.00);
INSERT INTO Route VALUES(314,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-19','113 High Speed Train',30.00);
INSERT INTO Route VALUES(315,'ESKISEHIR','ISTANBUL','12:00','13:00', '2020-12-17','113 High Speed Train',30.00);
INSERT INTO Route VALUES(316,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-17','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (317,'ANKARA','KAYSERI','06:00', '07:00','2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (318,'ANKARA','KAYSERI','22:00', '23:00','2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (319,'ANKARA','KAYSERI','06:00', '07:00', '2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (320,'ANKARA','KAYSERI','22:00', '23:00','2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (321,'ANKARA','KAYSERI','06:00','07:00', '2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (322,'ANKARA','KAYSERI','22:00','23:00','2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (323,'ANKARA','KAYSERI','06:00','07:00', '2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (324,'ANKARA','KAYSERI','22:00','23:00', '2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (325,'ANKARA','KAYSERI','10:00','11:00', '2020-12-16','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (326,'ANKARA','KAYSERI','18:00','19:00', '2020-12-16','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (327,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (328,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (329,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (330,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-18','110 East Express',30.00);
INSERT INTO Route VALUES (331,'KAYSERI','ANKARA','20:00', '21:00','2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (332,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-19','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (333,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (334,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-17','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (335,'KAYSERI','ANKARA','16:00', '17:00', '2020-12-16','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (336,'KAYSERI','ANKARA','24:00', '01:00', '2020-12-16','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (337,'KAYSERI','SIVAS','08:00','09:00', '2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (338,'KAYSERI','SIVAS','24:00','01:00', '2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (339,'KAYSERI','SIVAS','08:00','09:00', '2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (340,'KAYSERI','SIVAS','24:00','01:00', '2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (341,'KAYSERI','SIVAS','08:00','09:00', '2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (342,'KAYSERI','SIVAS','24:00','01:00','2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (343,'KAYSERI','SIVAS','08:00','09:00','2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (344,'KAYSERI','SIVAS','24:00','01:00', '2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (345,'KAYSERI','SIVAS','12:00','13:00','2020-12-16','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (346,'KAYSERI','SIVAS','20:00','21:00', '2020-12-16','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (347,'SIVAS','KAYSERI','18:00','19:00','2020-12-15','110 East Express',30.00);
INSERT INTO Route VALUES (348,'SIVAS','KAYSERI','10:00','11:00','2020-12-16','110 East Express',30.00);
INSERT INTO Route VALUES (349,'SIVAS','KAYSERI','18:00','19:00', '2020-12-17','110 East Express',30.00);
INSERT INTO Route VALUES (350,'SIVAS','KAYSERI','10:00','11:00', '2020-12-18','110 East Express',30.00);
INSERT INTO Route VALUES (351,'SIVAS','KAYSERI','18:00','19:00', '2020-12-18','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (352,'SIVAS','KAYSERI','10:00','11:00', '2020-12-19','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (353,'SIVAS','KAYSERI','18:00','19:00', '2020-12-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (354,'SIVAS','KAYSERI','10:00','11:00','2020-12-17','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (355,'SIVAS','KAYSERI','14:00','15:00','2020-12-16','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (356,'SIVAS','KAYSERI','22:00','23:00', '2020-12-16','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (357,'SIVAS','MALATYA','10:00','11:00','2020-12-18','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (358,'SIVAS','MALATYA','02:00','03:00','2020-12-19','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (359,'SIVAS','MALATYA','10:00','11:00', '2020-12-16','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (360,'SIVAS','MALATYA','02:00','03:00', '2020-12-17','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (361,'MALATYA','SIVAS','16:00','17:00','2020-12-18','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (362,'MALATYA','SIVAS','08:00','09:00', '2020-12-19','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (363,'MALATYA','SIVAS','16:00','17:00','2020-12-16','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (364,'MALATYA','SIVAS','08:00','09:00','2020-12-17','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (365,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-18','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (366,'MALATYA','DIYARBAKIR','04:00','05:00', '2020-12-19','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (367,'MALATYA','DIYARBAKIR','12:00','13:00', '2020-12-16','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (368,'MALATYA','DIYARBAKIR','04:00','05:00', '2020-12-17','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (369,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-18','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (370,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-19','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (371,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-16','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (372,'DIYARBAKIR','MALATYA','06:00','07:00', '2020-12-17','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (373,'SIVAS','ERZINCAN','10:00','11:00','2020-12-15','110 East Express',45.00);
INSERT INTO Route VALUES (374,'SIVAS','ERZINCAN','02:00','03:00', '2020-12-16','110 East Express',45.00);
INSERT INTO Route VALUES (375,'SIVAS','ERZINCAN','10:00','11:00','2020-12-17','110 East Express',45.00);
INSERT INTO Route VALUES (376,'SIVAS','ERZINCAN','02:00','03:00', '2020-12-18','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (377,'ERZINCAN','SIVAS','16:00','17:00', '2020-12-15','110 East Express',45.00);
INSERT INTO Route VALUES (378,'ERZINCAN','SIVAS','08:00','09:00', '2020-12-16','110 East Express',45.00);
INSERT INTO Route VALUES (379,'ERZINCAN','SIVAS','16:00','17:00', '2020-12-17','110 East Express',45.00);
INSERT INTO Route VALUES (380,'ERZINCAN','SIVAS','08:00','09:00', '2020-12-18','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (381,'ERZINCAN','KARS','12:00','13:00','2020-12-15','110 East Express',35.00);
INSERT INTO Route VALUES (382,'ERZINCAN','KARS','04:00','05:00','2020-12-16','110 East Express',35.00);
INSERT INTO Route VALUES (383,'ERZINCAN','KARS','12:00','13:00', '2020-12-17','110 East Express',35.00);
INSERT INTO Route VALUES (384,'ERZINCAN','KARS','04:00','05:00','2020-12-18','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (385,'KARS','ERZINCAN','14:00','15:00','2020-12-15','110 East Express',35.00);
INSERT INTO Route VALUES (386,'KARS','ERZINCAN','06:00','07:00', '2020-12-16','110 East Express',35.00);
INSERT INTO Route VALUES (387,'KARS','ERZINCAN','14:00','15:00', '2020-12-17','110 East Express',35.00);
INSERT INTO Route VALUES (388,'KARS','ERZINCAN','06:00','07:00', '2020-12-18','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (389,'ADANA','KONYA','11:00','12:00', '2020-12-16','111 Toros Express',55.00);
INSERT INTO Route VALUES (390,'ADANA','KONYA','19:00','20:00','2020-12-16','111 Toros Express',55.00);
INSERT INTO Route VALUES (391,'ADANA','KONYA','11:00','12:00','2020-12-18','111 Toros Express',55.00);
INSERT INTO Route VALUES (392,'ADANA','KONYA','19:00','20:00', '2020-12-18','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (393,'KONYA','ADANA','09:00','10:00','2020-12-16','111 Toros Express',55.00);
INSERT INTO Route VALUES (394,'KONYA','ADANA','17:00','18:00', '2020-12-16','111 Toros Express',55.00);
INSERT INTO Route VALUES (395,'KONYA','ADANA','09:00','10:00', '2020-12-18','111 Toros Express',55.00);
INSERT INTO Route VALUES (396,'KONYA','ADANA','17:00','18:00','2020-12-18','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (397,'KONYA','ISTANBUL','13:00','14:00', '2020-12-16','113 High Speed Train',60.00);
INSERT INTO Route VALUES (398,'KONYA','ISTANBUL','21:00','22:00', '2020-12-16','113 High Speed Train',60.00);
INSERT INTO Route VALUES (399,'KONYA','ISTANBUL','13:00','14:00', '2020-12-18','113 High Speed Train',60.00);
INSERT INTO Route VALUES (400,'KONYA','ISTANBUL','21:00','22:00','2020-12-18','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (401,'ISTANBUL','KONYA','07:00','08:00', '2020-12-16','113 High Speed Train',60.00);
INSERT INTO Route VALUES (402,'ISTANBUL','KONYA','15:00','16:00', '2020-12-16','113 High Speed Train',60.00);
INSERT INTO Route VALUES (403,'ISTANBUL','KONYA','07:00','08:00','2020-12-18','113 High Speed Train',60.00);
INSERT INTO Route VALUES (404,'ISTANBUL','KONYA','15:00','16:00','2020-12-18','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (405,'ANKARA','VAN','11:00','12:00', '2020-12-15','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (406,'ANKARA','VAN','19:00','20:00', '2020-12-15','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (407,'ANKARA','VAN','11:00','12:00','2020-12-20','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (408,'ANKARA','VAN','19:00','20:00','2020-12-20','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (409,'VAN','ANKARA','13:00','14:00', '2020-12-15','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (410,'VAN','ANKARA','21:00','22:00','2020-12-15','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (411,'VAN','ANKARA','13:00','14:00', '2020-12-20','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (412,'VAN','ANKARA','21:00','22:00','2020-12-20','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (413,'ISTANBUL','ANKARA','09:00','10:00','2020-12-15','113 High Speed Train',40.00);
INSERT INTO Route VALUES (414,'ISTANBUL','ANKARA','17:00','18:00', '2020-12-15','113 High Speed Train',40.00);
INSERT INTO Route VALUES (415,'ISTANBUL','ANKARA','09:00','10:00', '2020-12-20','113 High Speed Train',40.00);
INSERT INTO Route VALUES (416,'ISTANBUL','ANKARA','17:00','18:00','2020-12-20','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (417,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-15','113 High Speed Train',40.00);
INSERT INTO Route VALUES (418,'ANKARA','ISTANBUL','23:00','24:00', '2020-12-15','113 High Speed Train',40.00);
INSERT INTO Route VALUES (419,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-20','113 High Speed Train',40.00);
INSERT INTO Route VALUES (420,'ANKARA','ISTANBUL','23:00','24:00', '2020-12-20','113 High Speed Train',40.00);

/*4. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (421,'IZMIR','BALIKESIR','07:00 ','09:00 ', '2020-12-22','100 6 September Express',50.00);
INSERT INTO Route VALUES (422,'IZMIR','BALIKESIR','13:00','15:00', '2020-12-22','100 6 September Express',50.00);
INSERT INTO Route VALUES (423,'IZMIR','BALIKESIR','09:00','11:00','2020-12-27','101 17 September Express',50.00);
INSERT INTO Route VALUES (424,'IZMIR','BALIKESIR','15:00','17:00',  '2020-12-27','101 17 September Express',50.00);
INSERT INTO Route VALUES (425,'IZMIR','BALIKESIR','12:00','14:00','2020-12-24', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (426,'IZMIR','BALIKESIR','18:00','20:00', '2020-12-24', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (427,'IZMIR','BALIKESIR','08:00','09:00','2020-12-26','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (428,'IZMIR','BALIKESIR','20:00','21:00', '2020-12-26','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (429,'IZMIR','BALIKESIR','08:00','09:00', '2020-12-24','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (430,'IZMIR','BALIKESIR','20:00','21:00', '2020-12-24','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (431,'BALIKESIR', 'IZMIR', '10:00','12:00','2020-12-22','100 6 September Express',50.00);
INSERT INTO Route VALUES (432,'BALIKESIR', 'IZMIR', '16:00','18:00','2020-12-22','100 6 September Express',50.00);
INSERT INTO Route VALUES (433,'BALIKESIR', 'IZMIR', '12:00', '14:00',  '2020-12-27','101 17 September Express',50.00);
INSERT INTO Route VALUES (434,'BALIKESIR', 'IZMIR', '18:00', '20:00', '2020-12-27','101 17 September Express',50.00);
INSERT INTO Route VALUES (435,'BALIKESIR', 'IZMIR',' 15:00', '17:00',  '2020-12-24', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (436,'BALIKESIR', 'IZMIR',' 21:00', '23:00',  '2020-12-24', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (437,'BALIKESIR', 'IZMIR','06:00','07:00', '2020-12-26','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (438,'BALIKESIR', 'IZMIR','18:00','19:00','2020-12-26','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (439,'BALIKESIR', 'IZMIR','06:00','07:00', '2020-12-24','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (440,'BALIKESIR', 'IZMIR','18:00','19:00', '2020-12-24','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (441,'IZMIR','BALIKESIR','04:00','05:00 ', '2020-12-26','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (442,'IZMIR','BALIKESIR','16:00','17:00 ', '2020-12-26','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (443,'IZMIR','BALIKESIR','04:00','05:00 ', '2020-12-24','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (444,'IZMIR','BALIKESIR','16:00','17:00 ', '2020-12-24','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (445,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-26','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (446,'BALIKESIR', 'ESKISEHIR','22:01','23:00', '2020-12-26','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (447,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-24','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (448,'BALIKESIR', 'ESKISEHIR','22:01','23:00', '2020-12-24','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(449,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-26','113 High Speed Train',30.00);
INSERT INTO Route VALUES(450,'ISTANBUL','ESKISEHIR','14:00','15:00', '2020-12-26','113 High Speed Train',30.00);
INSERT INTO Route VALUES(451,'ISTANBUL','ESKISEHIR','02:00','03:00','2020-12-24','113 High Speed Train',30.00);
INSERT INTO Route VALUES(452,'ISTANBUL','ESKISEHIR','14:00','15:00', '2020-12-24','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(453,'ESKISEHIR','ISTANBUL','12:00','13:00', '2020-12-26','113 High Speed Train',30.00);
INSERT INTO Route VALUES(454,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-26','113 High Speed Train',30.00);
INSERT INTO Route VALUES(455,'ESKISEHIR','ISTANBUL','12:00','13:00', '2020-12-24','113 High Speed Train',30.00);
INSERT INTO Route VALUES(456,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-24','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (457,'ANKARA','KAYSERI','06:00', '07:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (458,'ANKARA','KAYSERI','22:00', '23:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (459,'ANKARA','KAYSERI','06:00', '07:00', '2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (460,'ANKARA','KAYSERI','22:00', '23:00','2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (461,'ANKARA','KAYSERI','06:00','07:00', '2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (462,'ANKARA','KAYSERI','22:00','23:00','2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (463,'ANKARA','KAYSERI','06:00','07:00','2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (464,'ANKARA','KAYSERI','22:00','23:00','2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (465,'ANKARA','KAYSERI','10:00','11:00', '2020-12-23','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (466,'ANKARA','KAYSERI','18:00','19:00', '2020-12-23','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (467,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (468,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (469,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (470,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-25','110 East Express',30.00);
INSERT INTO Route VALUES (471,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (472,'KAYSERI','ANKARA','12:00', '13:00', '2020-12-26','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (473,'KAYSERI','ANKARA','20:00', '21:00', '2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (474,'KAYSERI','ANKARA','12:00', '13:00','2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (475,'KAYSERI','ANKARA','16:00', '17:00', '2020-12-23','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (476,'KAYSERI','ANKARA','24:00', '01:00','2020-12-23','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (477,'KAYSERI','SIVAS','08:00','09:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (478,'KAYSERI','SIVAS','24:00','01:00', '2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (479,'KAYSERI','SIVAS','08:00','09:00','2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (480,'KAYSERI','SIVAS','24:00','01:00', '2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (481,'KAYSERI','SIVAS','08:00','09:00','2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (482,'KAYSERI','SIVAS','24:00','01:00','2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (483,'KAYSERI','SIVAS','08:00','09:00', '2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (484,'KAYSERI','SIVAS','24:00','01:00', '2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (485,'KAYSERI','SIVAS','12:00','13:00', '2020-12-23','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (486,'KAYSERI','SIVAS','20:00','21:00', '2020-12-23','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (487,'SIVAS','KAYSERI','18:00','19:00','2020-12-22','110 East Express',30.00);
INSERT INTO Route VALUES (488,'SIVAS','KAYSERI','10:00','11:00', '2020-12-23','110 East Express',30.00);
INSERT INTO Route VALUES (489,'SIVAS','KAYSERI','18:00','19:00', '2020-12-24','110 East Express',30.00);
INSERT INTO Route VALUES (490,'SIVAS','KAYSERI','10:00','11:00','2020-12-25','110 East Express',30.00);
INSERT INTO Route VALUES (491,'SIVAS','KAYSERI','18:00','19:00', '2020-12-25','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (492,'SIVAS','KAYSERI','10:00','11:00','2020-12-26','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (493,'SIVAS','KAYSERI','18:00','19:00', '2020-12-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (494,'SIVAS','KAYSERI','10:00','11:00', '2020-12-24','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (495,'SIVAS','KAYSERI','14:00','15:00', '2020-12-23','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (496,'SIVAS','KAYSERI','22:00','23:00', '2020-12-24','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (497,'SIVAS','MALATYA','10:00','11:00','2020-12-25','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (498,'SIVAS','MALATYA','02:00','03:00', '2020-12-26','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (499,'SIVAS','MALATYA','10:00','11:00', '2020-12-23','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (500,'SIVAS','MALATYA','02:00','03:00','2020-12-24','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (501,'MALATYA','SIVAS','16:00','17:00', '2020-12-25','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (502,'MALATYA','SIVAS','08:00','09:00', '2020-12-26','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (503,'MALATYA','SIVAS','16:00','17:00','2020-12-23','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (504,'MALATYA','SIVAS','08:00','09:00','2020-12-24','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (505,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-25','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (506,'MALATYA','DIYARBAKIR','04:00','05:00','2020-12-26','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (507,'MALATYA','DIYARBAKIR','12:00','13:00', '2020-12-23','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (508,'MALATYA','DIYARBAKIR','04:00','05:00', '2020-12-24','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (509,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-25','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (510,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-26','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (511,'DIYARBAKIR','MALATYA','14:00','15:00', '2020-12-23','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (512,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-24','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (513,'SIVAS','ERZINCAN','10:00','11:00','2020-12-22','110 East Express',45.00);
INSERT INTO Route VALUES (514,'SIVAS','ERZINCAN','02:00','03:00','2020-12-23','110 East Express',45.00);
INSERT INTO Route VALUES (515,'SIVAS','ERZINCAN','10:00','11:00','2020-12-24','110 East Express',45.00);
INSERT INTO Route VALUES (516,'SIVAS','ERZINCAN','02:00','03:00','2020-12-25','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (517,'ERZINCAN','SIVAS','16:00','17:00','2020-12-22','110 East Express',45.00);
INSERT INTO Route VALUES (518,'ERZINCAN','SIVAS','08:00','09:00','2020-12-23','110 East Express',45.00);
INSERT INTO Route VALUES (519,'ERZINCAN','SIVAS','16:00','17:00','2020-12-24','110 East Express',45.00);
INSERT INTO Route VALUES (520,'ERZINCAN','SIVAS','08:00','09:00','2020-12-25','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (521,'ERZINCAN','KARS','12:00','13:00','2020-12-22','110 East Express',35.00);
INSERT INTO Route VALUES (522,'ERZINCAN','KARS','04:00','05:00','2020-12-23','110 East Express',35.00);
INSERT INTO Route VALUES (523,'ERZINCAN','KARS','12:00','13:00','2020-12-24','110 East Express',35.00);
INSERT INTO Route VALUES (524,'ERZINCAN','KARS','04:00','05:00','2020-12-25','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (525,'KARS','ERZINCAN','14:00','15:00', '2020-12-22','110 East Express',35.00);
INSERT INTO Route VALUES (526,'KARS','ERZINCAN','06:00','07:00', '2020-12-23','110 East Express',35.00);
INSERT INTO Route VALUES (527,'KARS','ERZINCAN','14:00','15:00','2020-12-24','110 East Express',35.00);
INSERT INTO Route VALUES (528,'KARS','ERZINCAN','06:00','07:00', '2020-12-25','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (529,'ADANA','KONYA','11:00','12:00', '2020-12-23','111 Toros Express',55.00);
INSERT INTO Route VALUES (530,'ADANA','KONYA','19:00','20:00', '2020-12-23','111 Toros Express',55.00);
INSERT INTO Route VALUES (531,'ADANA','KONYA','11:00','12:00', '2020-12-25','111 Toros Express',55.00);
INSERT INTO Route VALUES (532,'ADANA','KONYA','19:00','20:00','2020-12-25','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (533,'KONYA','ADANA','09:00','10:00','2020-12-23','111 Toros Express',55.00);
INSERT INTO Route VALUES (534,'KONYA','ADANA','17:00','18:00', '2020-12-23','111 Toros Express',55.00);
INSERT INTO Route VALUES (535,'KONYA','ADANA','09:00','10:00','2020-12-25','111 Toros Express',55.00);
INSERT INTO Route VALUES (536,'KONYA','ADANA','17:00','18:00','2020-12-25','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (537,'KONYA','ISTANBUL','13:00','14:00', '2020-12-23','113 High Speed Train',60.00);
INSERT INTO Route VALUES (538,'KONYA','ISTANBUL','21:00','22:00', '2020-12-23','113 High Speed Train',60.00);
INSERT INTO Route VALUES (539,'KONYA','ISTANBUL','13:00','14:00', '2020-12-25','113 High Speed Train',60.00);
INSERT INTO Route VALUES (540,'KONYA','ISTANBUL','21:00','22:00', '2020-12-25','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (541,'ISTANBUL','KONYA','07:00','08:00','2020-12-23','113 High Speed Train',60.00);
INSERT INTO Route VALUES (542,'ISTANBUL','KONYA','15:00','16:00','2020-12-23','113 High Speed Train',60.00);
INSERT INTO Route VALUES (543,'ISTANBUL','KONYA','07:00','08:00', '2020-12-25','113 High Speed Train',60.00);
INSERT INTO Route VALUES (544,'ISTANBUL','KONYA','15:00','16:00', '2020-12-25','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (545,'ANKARA','VAN','11:00','12:00','2020-12-22','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (546,'ANKARA','VAN','19:00','20:00','2020-12-22','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (547,'ANKARA','VAN','11:00','12:00', '2020-12-27','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (548,'ANKARA','VAN','19:00','20:00','2020-12-27','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (549,'VAN','ANKARA','13:00','14:00', '2020-12-22','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (550,'VAN','ANKARA','21:00','22:00','2020-12-22','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (551,'VAN','ANKARA','13:00','14:00', '2020-12-27','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (552,'VAN','ANKARA','21:00','22:00', '2020-12-27','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (553,'ISTANBUL','ANKARA','09:00','10:00', '2020-12-22','113 High Speed Train',40.00);
INSERT INTO Route VALUES (554,'ISTANBUL','ANKARA','17:00','18:00','2020-12-22','113 High Speed Train',40.00);
INSERT INTO Route VALUES (555,'ISTANBUL','ANKARA','09:00','10:00', '2020-12-27','113 High Speed Train',40.00);
INSERT INTO Route VALUES (556,'ISTANBUL','ANKARA','17:00','18:00','2020-12-27','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (557,'ANKARA','ISTANBUL','15:00','16:00', '2020-12-22','113 High Speed Train',40.00);
INSERT INTO Route VALUES (558,'ANKARA','ISTANBUL','23:00','24:00','2020-12-22','113 High Speed Train',40.00);
INSERT INTO Route VALUES (559,'ANKARA','ISTANBUL','15:00','16:00','2020-12-27','113 High Speed Train',40.00);
INSERT INTO Route VALUES (560,'ANKARA','ISTANBUL','23:00','24:00','2020-12-27','113 High Speed Train',40.00);

/*5. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (561,'IZMIR','BALIKESIR','07:00 ','09:00 ','2020-12-29','100 6 September Express',50.00);
INSERT INTO Route VALUES (562,'IZMIR','BALIKESIR','13:00','15:00', '2020-12-29','100 6 September Express',50.00);
INSERT INTO Route VALUES (563,'IZMIR','BALIKESIR','09:00','11:00', '2021-01-03','101 17 September Express',50.00);
INSERT INTO Route VALUES (564,'IZMIR','BALIKESIR','15:00','17:00', '2021-01-03','101 17 September Express',50.00);
INSERT INTO Route VALUES (565,'IZMIR','BALIKESIR','12:00','14:00','2020-12-31', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (566,'IZMIR','BALIKESIR','18:00','20:00','2020-12-31', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (567,'IZMIR','BALIKESIR','08:00','09:00', '2021-01-02','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (568,'IZMIR','BALIKESIR','20:00','21:00','2021-01-01','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (569,'IZMIR','BALIKESIR','08:00','09:00','2020-12-31','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (570,'IZMIR','BALIKESIR','20:00','21:00','2020-12-31','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (571,'BALIKESIR', 'IZMIR', '10:00','12:00', '2020-12-29','100 6 September Express',50.00);
INSERT INTO Route VALUES (572,'BALIKESIR', 'IZMIR', '16:00','18:00', '2020-12-29','100 6 September Express',50.00);
INSERT INTO Route VALUES (573,'BALIKESIR', 'IZMIR', '12:00', '14:00', '2021-01-03','101 17 September Express',50.00);
INSERT INTO Route VALUES (574,'BALIKESIR', 'IZMIR', '18:00', '20:00', '2021-01-03','101 17 September Express',50.00);
INSERT INTO Route VALUES (575,'BALIKESIR', 'IZMIR',' 15:00', '17:00',  '2020-12-31', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (576,'BALIKESIR', 'IZMIR',' 21:00', '23:00', '2020-12-31', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (577,'BALIKESIR', 'IZMIR','06:00','07:00', '2021-01-02','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (578,'BALIKESIR', 'IZMIR','18:00','19:00', '2021-01-02','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (579,'BALIKESIR', 'IZMIR','06:00','07:00', '2020-12-31','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (580,'BALIKESIR', 'IZMIR','18:00','19:00','2020-12-31','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (581,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-02','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (582,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-02','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (583,'IZMIR','BALIKESIR','04:00','05:00 ', '2020-12-31','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (584,'IZMIR','BALIKESIR','16:00','17:00 ', '2020-12-31','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (585,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-02','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (586,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-02','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (587,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2020-12-31','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (588,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2020-12-31','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(589,'ISTANBUL','ESKISEHIR','02:00','03:00', '2021-01-02','113 High Speed Train',30.00);
INSERT INTO Route VALUES(590,'ISTANBUL','ESKISEHIR','14:00','15:00', '2021-01-02','113 High Speed Train',30.00);
INSERT INTO Route VALUES(591,'ISTANBUL','ESKISEHIR','02:00','03:00', '2020-12-31','113 High Speed Train',30.00);
INSERT INTO Route VALUES(592,'ISTANBUL','ESKISEHIR','14:00','15:00','2020-12-31','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(593,'ESKISEHIR','ISTANBUL','12:00','13:00', '2021-01-02','113 High Speed Train',30.00);
INSERT INTO Route VALUES(594,'ESKISEHIR','ISTANBUL','24:00','01:00', '2021-01-02','113 High Speed Train',30.00);
INSERT INTO Route VALUES(595,'ESKISEHIR','ISTANBUL','12:00','13:00','2020-12-31','113 High Speed Train',30.00);
INSERT INTO Route VALUES(596,'ESKISEHIR','ISTANBUL','24:00','01:00','2020-12-31','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (597,'ANKARA','KAYSERI','06:00', '07:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (598,'ANKARA','KAYSERI','22:00', '23:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (599,'ANKARA','KAYSERI','06:00', '07:00','2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (600,'ANKARA','KAYSERI','22:00', '23:00','2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (601,'ANKARA','KAYSERI','06:00','07:00','2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (602,'ANKARA','KAYSERI','22:00','23:00','2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (603,'ANKARA','KAYSERI','06:00','07:00','2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (604,'ANKARA','KAYSERI','22:00','23:00','2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (605,'ANKARA','KAYSERI','10:00','11:00', '2020-12-30','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (606,'ANKARA','KAYSERI','18:00','19:00','2020-12-30','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (607,'KAYSERI','ANKARA','20:00', '21:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (608,'KAYSERI','ANKARA','12:00', '13:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (609,'KAYSERI','ANKARA','20:00', '21:00','2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (610,'KAYSERI','ANKARA','12:00', '13:00','2021-01-01','110 East Express',30.00);
INSERT INTO Route VALUES (611,'KAYSERI','ANKARA','20:00', '21:00', '2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (612,'KAYSERI','ANKARA','12:00', '13:00','2021-01-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (613,'KAYSERI','ANKARA','20:00', '21:00','2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (614,'KAYSERI','ANKARA','12:00', '13:00','2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (615,'KAYSERI','ANKARA','16:00', '17:00','2020-12-30','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (616,'KAYSERI','ANKARA','24:00', '01:00','2020-12-30','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (617,'KAYSERI','SIVAS','08:00','09:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (618,'KAYSERI','SIVAS','24:00','01:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (619,'KAYSERI','SIVAS','08:00','09:00','2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (620,'KAYSERI','SIVAS','24:00','01:00', '2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (621,'KAYSERI','SIVAS','08:00','09:00','2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (622,'KAYSERI','SIVAS','24:00','01:00', '2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (623,'KAYSERI','SIVAS','08:00','09:00', '2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (624,'KAYSERI','SIVAS','24:00','01:00','2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (625,'KAYSERI','SIVAS','12:00','13:00','2020-12-30','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (626,'KAYSERI','SIVAS','20:00','21:00', '2020-12-30','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (627,'SIVAS','KAYSERI','18:00','19:00','2020-12-29','110 East Express',30.00);
INSERT INTO Route VALUES (628,'SIVAS','KAYSERI','10:00','11:00','2020-12-30','110 East Express',30.00);
INSERT INTO Route VALUES (629,'SIVAS','KAYSERI','18:00','19:00','2020-12-31','110 East Express',30.00);
INSERT INTO Route VALUES (630,'SIVAS','KAYSERI','10:00','11:00', '2021-01-01','110 East Express',30.00);
INSERT INTO Route VALUES (631,'SIVAS','KAYSERI','18:00','19:00','2021-01-01','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (632,'SIVAS','KAYSERI','10:00','11:00','2021-01-02','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (633,'SIVAS','KAYSERI','18:00','19:00', '2020-12-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (634,'SIVAS','KAYSERI','10:00','11:00', '2020-12-31','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (635,'SIVAS','KAYSERI','14:00','15:00','2020-12-30','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (636,'SIVAS','KAYSERI','22:00','23:00','2020-12-30','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (637,'SIVAS','MALATYA','10:00','11:00','2021-01-01','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (638,'SIVAS','MALATYA','02:00','03:00', '2021-01-02','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (639,'SIVAS','MALATYA','10:00','11:00','2020-12-30','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (640,'SIVAS','MALATYA','02:00','03:00','2020-12-31','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (641,'MALATYA','SIVAS','16:00','17:00', '2021-01-01','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (642,'MALATYA','SIVAS','08:00','09:00', '2021-01-02','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (643,'MALATYA','SIVAS','16:00','17:00','2020-12-30','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (644,'MALATYA','SIVAS','08:00','09:00','2020-12-31','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (645,'MALATYA','DIYARBAKIR','12:00','13:00', '2021-01-01','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (646,'MALATYA','DIYARBAKIR','04:00','05:00','2021-01-02','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (647,'MALATYA','DIYARBAKIR','12:00','13:00','2020-12-30','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (648,'MALATYA','DIYARBAKIR','04:00','05:00', '2020-12-31','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (649,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-01','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (650,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-02','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (651,'DIYARBAKIR','MALATYA','14:00','15:00','2020-12-30','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (652,'DIYARBAKIR','MALATYA','06:00','07:00','2020-12-31','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (653,'SIVAS','ERZINCAN','10:00','11:00', '2020-12-29','110 East Express',45.00);
INSERT INTO Route VALUES (654,'SIVAS','ERZINCAN','02:00','03:00','2020-12-30','110 East Express',45.00);
INSERT INTO Route VALUES (655,'SIVAS','ERZINCAN','10:00','11:00', '2020-12-31','110 East Express',45.00);
INSERT INTO Route VALUES (656,'SIVAS','ERZINCAN','02:00','03:00', '2021-01-01','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (657,'ERZINCAN','SIVAS','16:00','17:00','2020-12-29','110 East Express',45.00);
INSERT INTO Route VALUES (658,'ERZINCAN','SIVAS','08:00','09:00','2020-12-30','110 East Express',45.00);
INSERT INTO Route VALUES (659,'ERZINCAN','SIVAS','16:00','17:00', '2020-12-31','110 East Express',45.00);
INSERT INTO Route VALUES (660,'ERZINCAN','SIVAS','08:00','09:00','2021-01-01','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (661,'ERZINCAN','KARS','12:00','13:00','2020-12-29','110 East Express',35.00);
INSERT INTO Route VALUES (662,'ERZINCAN','KARS','04:00','05:00','2020-12-30','110 East Express',35.00);
INSERT INTO Route VALUES (663,'ERZINCAN','KARS','12:00','13:00','2020-12-31','110 East Express',35.00);
INSERT INTO Route VALUES (664,'ERZINCAN','KARS','04:00','05:00','2021-01-01','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (665,'KARS','ERZINCAN','14:00','15:00','2020-12-29','110 East Express',35.00);
INSERT INTO Route VALUES (666,'KARS','ERZINCAN','06:00','07:00', '2020-12-30','110 East Express',35.00);
INSERT INTO Route VALUES (667,'KARS','ERZINCAN','14:00','15:00','2020-12-31','110 East Express',35.00);
INSERT INTO Route VALUES (668,'KARS','ERZINCAN','06:00','07:00','2021-01-01','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (669,'ADANA','KONYA','11:00','12:00','2020-12-30','111 Toros Express',55.00);
INSERT INTO Route VALUES (670,'ADANA','KONYA','19:00','20:00','2020-12-30','111 Toros Express',55.00);
INSERT INTO Route VALUES (671,'ADANA','KONYA','11:00','12:00','2021-01-01','111 Toros Express',55.00);
INSERT INTO Route VALUES (672,'ADANA','KONYA','19:00','20:00','2021-01-01','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (673,'KONYA','ADANA','09:00','10:00','2020-12-30','111 Toros Express',55.00);
INSERT INTO Route VALUES (674,'KONYA','ADANA','17:00','18:00', '2020-12-30','111 Toros Express',55.00);
INSERT INTO Route VALUES (675,'KONYA','ADANA','09:00','10:00', '2021-01-01','111 Toros Express',55.00);
INSERT INTO Route VALUES (676,'KONYA','ADANA','17:00','18:00','2021-01-01','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (677,'KONYA','ISTANBUL','13:00','14:00','2020-12-30','113 High Speed Train',60.00);
INSERT INTO Route VALUES (678,'KONYA','ISTANBUL','21:00','22:00', '2020-12-30','113 High Speed Train',60.00);
INSERT INTO Route VALUES (679,'KONYA','ISTANBUL','13:00','14:00','2021-01-01','113 High Speed Train',60.00);
INSERT INTO Route VALUES (680,'KONYA','ISTANBUL','21:00','22:00','2021-01-01','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (681,'ISTANBUL','KONYA','07:00','08:00','2020-12-30','113 High Speed Train',60.00);
INSERT INTO Route VALUES (682,'ISTANBUL','KONYA','15:00','16:00', '2020-12-30','113 High Speed Train',60.00);
INSERT INTO Route VALUES (683,'ISTANBUL','KONYA','07:00','08:00','2021-01-01','113 High Speed Train',60.00);
INSERT INTO Route VALUES (684,'ISTANBUL','KONYA','15:00','16:00','2021-01-01','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (685,'ANKARA','VAN','11:00','12:00','2020-12-29','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (686,'ANKARA','VAN','19:00','20:00','2020-12-29','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (687,'ANKARA','VAN','11:00','12:00', '2021-01-03','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (688,'ANKARA','VAN','19:00','20:00','2021-01-03','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (689,'VAN','ANKARA','13:00','14:00', '2020-12-29','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (690,'VAN','ANKARA','21:00','22:00','2020-12-29','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (691,'VAN','ANKARA','13:00','14:00','2021-01-03','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (692,'VAN','ANKARA','21:00','22:00','2021-01-03','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (693,'ISTANBUL','ANKARA','09:00','10:00','2020-12-29','113 High Speed Train',40.00);
INSERT INTO Route VALUES (694,'ISTANBUL','ANKARA','17:00','18:00','2020-12-29','113 High Speed Train',40.00);
INSERT INTO Route VALUES (695,'ISTANBUL','ANKARA','09:00','10:00','2021-01-03','113 High Speed Train',40.00);
INSERT INTO Route VALUES (696,'ISTANBUL','ANKARA','17:00','18:00','2021-01-03','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (697,'ANKARA','ISTANBUL','15:00','16:00','2020-12-29','113 High Speed Train',40.00);
INSERT INTO Route VALUES (698,'ANKARA','ISTANBUL','23:00','24:00','2020-12-29','113 High Speed Train',40.00);
INSERT INTO Route VALUES (699,'ANKARA','ISTANBUL','15:00','16:00','2021-01-03','113 High Speed Train',40.00);
INSERT INTO Route VALUES (700,'ANKARA','ISTANBUL','23:00','24:00','2021-01-03','113 High Speed Train',40.00);

/*6. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (701,'IZMIR','BALIKESIR','07:00 ','09:00 ','2021-01-05','100 6 September Express',50.00);
INSERT INTO Route VALUES (702,'IZMIR','BALIKESIR','13:00','15:00','2021-01-05','100 6 September Express',50.00);
INSERT INTO Route VALUES (703,'IZMIR','BALIKESIR','09:00','11:00', '2021-01-10','101 17 September Express',50.00);
INSERT INTO Route VALUES (704,'IZMIR','BALIKESIR','15:00','17:00', '2021-01-10','101 17 September Express',50.00);
INSERT INTO Route VALUES (705,'IZMIR','BALIKESIR','12:00','14:00','2021-01-07', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (706,'IZMIR','BALIKESIR','18:00','20:00','2021-01-07','103 Aegean Express',50.00);
INSERT INTO Route VALUES (707,'IZMIR','BALIKESIR','08:00','09:00','2021-01-09','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (708,'IZMIR','BALIKESIR','20:00','21:00','2021-01-08','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (709,'IZMIR','BALIKESIR','08:00','09:00','2021-01-07','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (710,'IZMIR','BALIKESIR','20:00','21:00','2021-01-07','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (711,'BALIKESIR', 'IZMIR', '10:00','12:00', '2021-01-05','100 6 September Express',50.00);
INSERT INTO Route VALUES (712,'BALIKESIR', 'IZMIR', '16:00','18:00','2021-01-05','100 6 September Express',50.00);
INSERT INTO Route VALUES (713,'BALIKESIR', 'IZMIR', '12:00', '14:00', '2021-01-10','101 17 September Express',50.00);
INSERT INTO Route VALUES (714,'BALIKESIR', 'IZMIR', '18:00', '20:00', '2021-01-10','101 17 September Express',50.00);
INSERT INTO Route VALUES (715,'BALIKESIR', 'IZMIR',' 15:00', '17:00', '2021-01-07','103 Aegean Express',50.00);
INSERT INTO Route VALUES (716,'BALIKESIR', 'IZMIR',' 21:00', '23:00','2021-01-07','103 Aegean Express',50.00);
INSERT INTO Route VALUES (717,'BALIKESIR', 'IZMIR','06:00','07:00','2021-01-09','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (718,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-09','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (719,'BALIKESIR', 'IZMIR','06:00','07:00','2021-01-07','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (720,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-07','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (721,'IZMIR','BALIKESIR','04:00','05:00 ', '2021-01-09','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (722,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-09','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (723,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-07','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (724,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-07','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (725,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-09','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (726,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-09','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (727,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-07','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (728,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-07','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(729,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-09','113 High Speed Train',30.00);
INSERT INTO Route VALUES(730,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-09','113 High Speed Train',30.00);
INSERT INTO Route VALUES(731,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-07','113 High Speed Train',30.00);
INSERT INTO Route VALUES(732,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-07','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(733,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-09','113 High Speed Train',30.00);
INSERT INTO Route VALUES(734,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-09','113 High Speed Train',30.00);
INSERT INTO Route VALUES(735,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-07','113 High Speed Train',30.00);
INSERT INTO Route VALUES(736,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-07','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (737,'ANKARA','KAYSERI','06:00', '07:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (738,'ANKARA','KAYSERI','22:00', '23:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (739,'ANKARA','KAYSERI','06:00', '07:00','2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (740,'ANKARA','KAYSERI','22:00', '23:00','2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (741,'ANKARA','KAYSERI','06:00','07:00','2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (742,'ANKARA','KAYSERI','22:00','23:00','2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (743,'ANKARA','KAYSERI','06:00','07:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (744,'ANKARA','KAYSERI','22:00','23:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (745,'ANKARA','KAYSERI','10:00','11:00','2021-01-06','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (746,'ANKARA','KAYSERI','18:00','19:00','2021-01-06','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (747,'KAYSERI','ANKARA','20:00', '21:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (748,'KAYSERI','ANKARA','12:00', '13:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (749,'KAYSERI','ANKARA','20:00', '21:00','2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (750,'KAYSERI','ANKARA','12:00', '13:00','2021-01-08','110 East Express',30.00);
INSERT INTO Route VALUES (751,'KAYSERI','ANKARA','20:00', '21:00','2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (752,'KAYSERI','ANKARA','12:00', '13:00','2021-01-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (753,'KAYSERI','ANKARA','20:00', '21:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (754,'KAYSERI','ANKARA','12:00', '13:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (755,'KAYSERI','ANKARA','16:00', '17:00','2021-01-06','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (756,'KAYSERI','ANKARA','24:00', '01:00','2021-01-06','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (757,'KAYSERI','SIVAS','08:00','09:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (758,'KAYSERI','SIVAS','24:00','01:00','2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (759,'KAYSERI','SIVAS','08:00','09:00', '2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (760,'KAYSERI','SIVAS','24:00','01:00','2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (761,'KAYSERI','SIVAS','08:00','09:00', '2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (762,'KAYSERI','SIVAS','24:00','01:00', '2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (763,'KAYSERI','SIVAS','08:00','09:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (764,'KAYSERI','SIVAS','24:00','01:00','2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (765,'KAYSERI','SIVAS','12:00','13:00','2021-01-06','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (766,'KAYSERI','SIVAS','20:00','21:00', '2021-01-06','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (767,'SIVAS','KAYSERI','18:00','19:00', '2021-01-05','110 East Express',30.00);
INSERT INTO Route VALUES (768,'SIVAS','KAYSERI','10:00','11:00','2021-01-06','110 East Express',30.00);
INSERT INTO Route VALUES (769,'SIVAS','KAYSERI','18:00','19:00','2021-01-07','110 East Express',30.00);
INSERT INTO Route VALUES (770,'SIVAS','KAYSERI','10:00','11:00','2021-01-08','110 East Express',30.00);
INSERT INTO Route VALUES (771,'SIVAS','KAYSERI','18:00','19:00','2021-01-08','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (772,'SIVAS','KAYSERI','10:00','11:00','2021-01-09','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (773,'SIVAS','KAYSERI','18:00','19:00', '2021-01-06','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (774,'SIVAS','KAYSERI','10:00','11:00', '2021-01-07','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (775,'SIVAS','KAYSERI','14:00','15:00','2021-01-06','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (776,'SIVAS','KAYSERI','22:00','23:00', '2021-01-06','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (777,'SIVAS','MALATYA','10:00','11:00','2021-01-08','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (778,'SIVAS','MALATYA','02:00','03:00','2021-01-09','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (779,'SIVAS','MALATYA','10:00','11:00', '2021-01-06','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (780,'SIVAS','MALATYA','02:00','03:00', '2021-01-07','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (781,'MALATYA','SIVAS','16:00','17:00','2021-01-08','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (782,'MALATYA','SIVAS','08:00','09:00','2021-01-09','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (783,'MALATYA','SIVAS','16:00','17:00', '2021-01-06','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (784,'MALATYA','SIVAS','08:00','09:00', '2021-01-07','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (785,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-08','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (786,'MALATYA','DIYARBAKIR','04:00','05:00', '2021-01-09','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (787,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-06','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (788,'MALATYA','DIYARBAKIR','04:00','05:00', '2021-01-07','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (789,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-08','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (790,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-09','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (791,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-06','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (792,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-07','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (793,'SIVAS','ERZINCAN','10:00','11:00','2021-01-05','110 East Express',45.00);
INSERT INTO Route VALUES (794,'SIVAS','ERZINCAN','02:00','03:00','2021-01-06','110 East Express',45.00);
INSERT INTO Route VALUES (795,'SIVAS','ERZINCAN','10:00','11:00', '2021-01-07','110 East Express',45.00);
INSERT INTO Route VALUES (796,'SIVAS','ERZINCAN','02:00','03:00', '2021-01-08','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (797,'ERZINCAN','SIVAS','16:00','17:00', '2021-01-05','110 East Express',45.00);
INSERT INTO Route VALUES (798,'ERZINCAN','SIVAS','08:00','09:00','2021-01-06','110 East Express',45.00);
INSERT INTO Route VALUES (799,'ERZINCAN','SIVAS','16:00','17:00','2021-01-07','110 East Express',45.00);
INSERT INTO Route VALUES (800,'ERZINCAN','SIVAS','08:00','09:00','2021-01-08','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (801,'ERZINCAN','KARS','12:00','13:00','2021-01-05','110 East Express',35.00);
INSERT INTO Route VALUES (802,'ERZINCAN','KARS','04:00','05:00','2021-01-06','110 East Express',35.00);
INSERT INTO Route VALUES (803,'ERZINCAN','KARS','12:00','13:00','2021-01-07','110 East Express',35.00);
INSERT INTO Route VALUES (804,'ERZINCAN','KARS','04:00','05:00','2021-01-08','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (805,'KARS','ERZINCAN','14:00','15:00','2021-01-05','110 East Express',35.00);
INSERT INTO Route VALUES (806,'KARS','ERZINCAN','06:00','07:00','2021-01-06','110 East Express',35.00);
INSERT INTO Route VALUES (807,'KARS','ERZINCAN','14:00','15:00','2021-01-07','110 East Express',35.00);
INSERT INTO Route VALUES (808,'KARS','ERZINCAN','06:00','07:00','2021-01-08','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (809,'ADANA','KONYA','11:00','12:00', '2021-01-06','111 Toros Express',55.00);
INSERT INTO Route VALUES (810,'ADANA','KONYA','19:00','20:00','2021-01-06','111 Toros Express',55.00);
INSERT INTO Route VALUES (811,'ADANA','KONYA','11:00','12:00','2021-01-08','111 Toros Express',55.00);
INSERT INTO Route VALUES (812,'ADANA','KONYA','19:00','20:00','2021-01-08','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (813,'KONYA','ADANA','09:00','10:00','2021-01-06','111 Toros Express',55.00);
INSERT INTO Route VALUES (814,'KONYA','ADANA','17:00','18:00','2021-01-06','111 Toros Express',55.00);
INSERT INTO Route VALUES (815,'KONYA','ADANA','09:00','10:00','2021-01-08','111 Toros Express',55.00);
INSERT INTO Route VALUES (816,'KONYA','ADANA','17:00','18:00','2021-01-08','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (817,'KONYA','ISTANBUL','13:00','14:00','2021-01-06','113 High Speed Train',60.00);
INSERT INTO Route VALUES (818,'KONYA','ISTANBUL','21:00','22:00','2021-01-06','113 High Speed Train',60.00);
INSERT INTO Route VALUES (819,'KONYA','ISTANBUL','13:00','14:00','2021-01-08','113 High Speed Train',60.00);
INSERT INTO Route VALUES (820,'KONYA','ISTANBUL','21:00','22:00','2021-01-08','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (821,'ISTANBUL','KONYA','07:00','08:00','2021-01-06','113 High Speed Train',60.00);
INSERT INTO Route VALUES (822,'ISTANBUL','KONYA','15:00','16:00','2021-01-06','113 High Speed Train',60.00);
INSERT INTO Route VALUES (823,'ISTANBUL','KONYA','07:00','08:00','2021-01-08','113 High Speed Train',60.00);
INSERT INTO Route VALUES (824,'ISTANBUL','KONYA','15:00','16:00','2021-01-08','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (825,'ANKARA','VAN','11:00','12:00','2021-01-05','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (826,'ANKARA','VAN','19:00','20:00','2021-01-05','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (827,'ANKARA','VAN','11:00','12:00','2021-01-10','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (828,'ANKARA','VAN','19:00','20:00', '2021-01-10','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (829,'VAN','ANKARA','13:00','14:00','2021-01-05','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (830,'VAN','ANKARA','21:00','22:00', '2021-01-05','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (831,'VAN','ANKARA','13:00','14:00', '2021-01-10','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (832,'VAN','ANKARA','21:00','22:00','2021-01-10','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (833,'ISTANBUL','ANKARA','09:00','10:00', '2021-01-05','113 High Speed Train',40.00);
INSERT INTO Route VALUES (834,'ISTANBUL','ANKARA','17:00','18:00','2021-01-05','113 High Speed Train',40.00);
INSERT INTO Route VALUES (835,'ISTANBUL','ANKARA','09:00','10:00', '2021-01-10','113 High Speed Train',40.00);
INSERT INTO Route VALUES (836,'ISTANBUL','ANKARA','17:00','18:00','2021-01-10','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (837,'ANKARA','ISTANBUL','15:00','16:00','2021-01-05','113 High Speed Train',40.00);
INSERT INTO Route VALUES (838,'ANKARA','ISTANBUL','23:00','24:00','2021-01-05','113 High Speed Train',40.00);
INSERT INTO Route VALUES (839,'ANKARA','ISTANBUL','15:00','16:00','2021-01-10','113 High Speed Train',40.00);
INSERT INTO Route VALUES (840,'ANKARA','ISTANBUL','23:00','24:00','2021-01-10','113 High Speed Train',40.00);


/*7. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (841,'IZMIR','BALIKESIR','07:00 ','09:00 ','2021-01-12','100 6 September Express',50.00);
INSERT INTO Route VALUES (842,'IZMIR','BALIKESIR','13:00','15:00', '2021-01-12','100 6 September Express',50.00);
INSERT INTO Route VALUES (843,'IZMIR','BALIKESIR','09:00','11:00', '2021-01-17','101 17 September Express',50.00);
INSERT INTO Route VALUES (844,'IZMIR','BALIKESIR','15:00','17:00',  '2021-01-17','101 17 September Express',50.00);
INSERT INTO Route VALUES (845,'IZMIR','BALIKESIR','12:00','14:00','2021-01-14', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (846,'IZMIR','BALIKESIR','18:00','20:00','2021-01-14','103 Aegean Express',50.00);
INSERT INTO Route VALUES (847,'IZMIR','BALIKESIR','08:00','09:00','2021-01-16','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (848,'IZMIR','BALIKESIR','20:00','21:00','2021-01-15','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (849,'IZMIR','BALIKESIR','08:00','09:00','2021-01-14','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (850,'IZMIR','BALIKESIR','20:00','21:00','2021-01-14','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (851,'BALIKESIR', 'IZMIR', '10:00','12:00','2021-01-12','100 6 September Express',50.00);
INSERT INTO Route VALUES (852,'BALIKESIR', 'IZMIR', '16:00','18:00', '2021-01-12','100 6 September Express',50.00);
INSERT INTO Route VALUES (853,'BALIKESIR', 'IZMIR', '12:00', '14:00', '2021-01-17','101 17 September Express',50.00);
INSERT INTO Route VALUES (854,'BALIKESIR', 'IZMIR', '18:00', '20:00',  '2021-01-17','101 17 September Express',50.00);
INSERT INTO Route VALUES (855,'BALIKESIR', 'IZMIR',' 15:00', '17:00', '2021-01-14', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (856,'BALIKESIR', 'IZMIR',' 21:00', '23:00', '2021-01-14', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (857,'BALIKESIR', 'IZMIR','06:00','07:00','2021-01-16','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (858,'BALIKESIR', 'IZMIR','18:00','19:00', '2021-01-16','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (859,'BALIKESIR', 'IZMIR','06:00','07:00', '2021-01-14','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (860,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-14','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (861,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-16','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (862,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-16','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (863,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-14','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (864,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-14','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (865,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-16','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (866,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-16','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (867,'BALIKESIR', 'ESKISEHIR','10:00','11:00', '2021-01-14','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (868,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-14','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(869,'ISTANBUL','ESKISEHIR','02:00','03:00', '2021-01-16','113 High Speed Train',30.00);
INSERT INTO Route VALUES(870,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-16','113 High Speed Train',30.00);
INSERT INTO Route VALUES(871,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-14','113 High Speed Train',30.00);
INSERT INTO Route VALUES(872,'ISTANBUL','ESKISEHIR','14:00','15:00', '2021-01-14','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(873,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-16','113 High Speed Train',30.00);
INSERT INTO Route VALUES(874,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-16','113 High Speed Train',30.00);
INSERT INTO Route VALUES(875,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-14','113 High Speed Train',30.00);
INSERT INTO Route VALUES(876,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-14','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (877,'ANKARA','KAYSERI','06:00', '07:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (878,'ANKARA','KAYSERI','22:00', '23:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (879,'ANKARA','KAYSERI','06:00', '07:00','2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (880,'ANKARA','KAYSERI','22:00', '23:00','2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (881,'ANKARA','KAYSERI','06:00','07:00', '2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (882,'ANKARA','KAYSERI','22:00','23:00', '2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (883,'ANKARA','KAYSERI','06:00','07:00','2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (884,'ANKARA','KAYSERI','22:00','23:00','2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (885,'ANKARA','KAYSERI','10:00','11:00','2021-01-13','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (886,'ANKARA','KAYSERI','18:00','19:00','2021-01-13','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (887,'KAYSERI','ANKARA','20:00', '21:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (888,'KAYSERI','ANKARA','12:00', '13:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (889,'KAYSERI','ANKARA','20:00', '21:00','2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (890,'KAYSERI','ANKARA','12:00', '13:00','2021-01-15','110 East Express',30.00);
INSERT INTO Route VALUES (891,'KAYSERI','ANKARA','20:00', '21:00','2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (892,'KAYSERI','ANKARA','12:00', '13:00','2021-01-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (893,'KAYSERI','ANKARA','20:00', '21:00', '2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (894,'KAYSERI','ANKARA','12:00', '13:00','2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (895,'KAYSERI','ANKARA','16:00', '17:00','2021-01-13','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (896,'KAYSERI','ANKARA','24:00', '01:00','2021-01-13','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (897,'KAYSERI','SIVAS','08:00','09:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (898,'KAYSERI','SIVAS','24:00','01:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (899,'KAYSERI','SIVAS','08:00','09:00','2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (900,'KAYSERI','SIVAS','24:00','01:00','2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (901,'KAYSERI','SIVAS','08:00','09:00','2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (902,'KAYSERI','SIVAS','24:00','01:00','2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (903,'KAYSERI','SIVAS','08:00','09:00','2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (904,'KAYSERI','SIVAS','24:00','01:00','2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (905,'KAYSERI','SIVAS','12:00','13:00','2021-01-13','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (906,'KAYSERI','SIVAS','20:00','21:00','2021-01-13','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (907,'SIVAS','KAYSERI','18:00','19:00','2021-01-12','110 East Express',30.00);
INSERT INTO Route VALUES (908,'SIVAS','KAYSERI','10:00','11:00','2021-01-13','110 East Express',30.00);
INSERT INTO Route VALUES (909,'SIVAS','KAYSERI','18:00','19:00', '2021-01-14','110 East Express',30.00);
INSERT INTO Route VALUES (910,'SIVAS','KAYSERI','10:00','11:00', '2021-01-15','110 East Express',30.00);
INSERT INTO Route VALUES (911,'SIVAS','KAYSERI','18:00','19:00','2021-01-15','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (912,'SIVAS','KAYSERI','10:00','11:00', '2021-01-16','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (913,'SIVAS','KAYSERI','18:00','19:00', '2021-01-13','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (914,'SIVAS','KAYSERI','10:00','11:00','2021-01-14','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (915,'SIVAS','KAYSERI','14:00','15:00', '2021-00-13','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (916,'SIVAS','KAYSERI','22:00','23:00','2021-01-13','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (917,'SIVAS','MALATYA','10:00','11:00', '2021-01-15','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (918,'SIVAS','MALATYA','02:00','03:00','2021-01-16','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (919,'SIVAS','MALATYA','10:00','11:00','2021-01-13','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (920,'SIVAS','MALATYA','02:00','03:00','2021-01-14','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (921,'MALATYA','SIVAS','16:00','17:00','2021-01-15','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (922,'MALATYA','SIVAS','08:00','09:00','2021-01-16','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (923,'MALATYA','SIVAS','16:00','17:00','2021-01-13','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (924,'MALATYA','SIVAS','08:00','09:00','2021-01-14','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (925,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-15','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (926,'MALATYA','DIYARBAKIR','04:00','05:00', '2021-01-16','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (927,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-13','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (928,'MALATYA','DIYARBAKIR','04:00','05:00','2021-01-14','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (929,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-15','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (930,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-16','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (931,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-13','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (932,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-14','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (933,'SIVAS','ERZINCAN','10:00','11:00','2021-01-12','110 East Express',45.00);
INSERT INTO Route VALUES (934,'SIVAS','ERZINCAN','02:00','03:00','2021-01-13','110 East Express',45.00);
INSERT INTO Route VALUES (935,'SIVAS','ERZINCAN','10:00','11:00','2021-01-14','110 East Express',45.00);
INSERT INTO Route VALUES (936,'SIVAS','ERZINCAN','02:00','03:00','2021-01-15','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (937,'ERZINCAN','SIVAS','16:00','17:00','2021-01-12','110 East Express',45.00);
INSERT INTO Route VALUES (938,'ERZINCAN','SIVAS','08:00','09:00','2021-01-13','110 East Express',45.00);
INSERT INTO Route VALUES (939,'ERZINCAN','SIVAS','16:00','17:00','2021-01-14','110 East Express',45.00);
INSERT INTO Route VALUES (940,'ERZINCAN','SIVAS','08:00','09:00','2021-01-15','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (941,'ERZINCAN','KARS','12:00','13:00', '2021-01-12','110 East Express',35.00);
INSERT INTO Route VALUES (942,'ERZINCAN','KARS','04:00','05:00','2021-01-13','110 East Express',35.00);
INSERT INTO Route VALUES (943,'ERZINCAN','KARS','12:00','13:00', '2021-01-14','110 East Express',35.00);
INSERT INTO Route VALUES (944,'ERZINCAN','KARS','04:00','05:00','2021-01-15','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (945,'KARS','ERZINCAN','14:00','15:00','2021-01-12','110 East Express',35.00);
INSERT INTO Route VALUES (946,'KARS','ERZINCAN','06:00','07:00','2021-01-13','110 East Express',35.00);
INSERT INTO Route VALUES (947,'KARS','ERZINCAN','14:00','15:00', '2021-01-14','110 East Express',35.00);
INSERT INTO Route VALUES (948,'KARS','ERZINCAN','06:00','07:00','2021-01-15','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (949,'ADANA','KONYA','11:00','12:00','2021-01-13','111 Toros Express',55.00);
INSERT INTO Route VALUES (950,'ADANA','KONYA','19:00','20:00','2021-01-13','111 Toros Express',55.00);
INSERT INTO Route VALUES (951,'ADANA','KONYA','11:00','12:00','2021-01-15','111 Toros Express',55.00);
INSERT INTO Route VALUES (952,'ADANA','KONYA','19:00','20:00','2021-01-15','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (953,'KONYA','ADANA','09:00','10:00', '2021-01-13','111 Toros Express',55.00);
INSERT INTO Route VALUES (954,'KONYA','ADANA','17:00','18:00', '2021-01-13','111 Toros Express',55.00);
INSERT INTO Route VALUES (955,'KONYA','ADANA','09:00','10:00','2021-01-15','111 Toros Express',55.00);
INSERT INTO Route VALUES (956,'KONYA','ADANA','17:00','18:00','2021-01-15','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (957,'KONYA','ISTANBUL','13:00','14:00','2021-01-13','113 High Speed Train',60.00);
INSERT INTO Route VALUES (958,'KONYA','ISTANBUL','21:00','22:00','2021-01-13','113 High Speed Train',60.00);
INSERT INTO Route VALUES (959,'KONYA','ISTANBUL','13:00','14:00', '2021-01-15','113 High Speed Train',60.00);
INSERT INTO Route VALUES (960,'KONYA','ISTANBUL','21:00','22:00', '2021-01-15','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (961,'ISTANBUL','KONYA','07:00','08:00','2021-01-13','113 High Speed Train',60.00);
INSERT INTO Route VALUES (962,'ISTANBUL','KONYA','15:00','16:00','2021-01-13','113 High Speed Train',60.00);
INSERT INTO Route VALUES (963,'ISTANBUL','KONYA','07:00','08:00', '2021-01-15','113 High Speed Train',60.00);
INSERT INTO Route VALUES (964,'ISTANBUL','KONYA','15:00','16:00', '2021-01-15','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (965,'ANKARA','VAN','11:00','12:00','2021-01-12','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (966,'ANKARA','VAN','19:00','20:00', '2021-01-12','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (967,'ANKARA','VAN','11:00','12:00', '2021-01-17','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (968,'ANKARA','VAN','19:00','20:00','2021-01-17','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (969,'VAN','ANKARA','13:00','14:00','2021-01-12','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (970,'VAN','ANKARA','21:00','22:00','2021-01-12','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (971,'VAN','ANKARA','13:00','14:00','2021-01-17','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (972,'VAN','ANKARA','21:00','22:00', '2021-01-17','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (973,'ISTANBUL','ANKARA','09:00','10:00','2021-01-12','113 High Speed Train',40.00);
INSERT INTO Route VALUES (974,'ISTANBUL','ANKARA','17:00','18:00','2021-01-12','113 High Speed Train',40.00);
INSERT INTO Route VALUES (975,'ISTANBUL','ANKARA','09:00','10:00','2021-01-17','113 High Speed Train',40.00);
INSERT INTO Route VALUES (976,'ISTANBUL','ANKARA','17:00','18:00','2021-01-17','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (977,'ANKARA','ISTANBUL','15:00','16:00','2021-01-12','113 High Speed Train',40.00);
INSERT INTO Route VALUES (978,'ANKARA','ISTANBUL','23:00','24:00', '2021-01-12','113 High Speed Train',40.00);
INSERT INTO Route VALUES (979,'ANKARA','ISTANBUL','15:00','16:00', '2021-01-17','113 High Speed Train',40.00);
INSERT INTO Route VALUES (980,'ANKARA','ISTANBUL','23:00','24:00', '2021-01-17','113 High Speed Train',40.00);


/*8. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (981,'IZMIR','BALIKESIR','07:00 ','09:00 ','2021-01-19','100 6 September Express',50.00);
INSERT INTO Route VALUES (982,'IZMIR','BALIKESIR','13:00','15:00', '2021-01-19','100 6 September Express',50.00);
INSERT INTO Route VALUES (983,'IZMIR','BALIKESIR','09:00','11:00', '2021-01-24','101 17 September Express',50.00);
INSERT INTO Route VALUES (984,'IZMIR','BALIKESIR','15:00','17:00',  '2021-01-24','101 17 September Express',50.00);
INSERT INTO Route VALUES (985,'IZMIR','BALIKESIR','12:00','14:00', '2021-01-21', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (986,'IZMIR','BALIKESIR','18:00','20:00', '2021-01-21','103 Aegean Express',50.00);
INSERT INTO Route VALUES (987,'IZMIR','BALIKESIR','08:00','09:00', '2021-01-23','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (988,'IZMIR','BALIKESIR','20:00','21:00','2021-01-22','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (989,'IZMIR','BALIKESIR','08:00','09:00', '2021-01-21','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (990,'IZMIR','BALIKESIR','20:00','21:00', '2021-01-21','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (991,'BALIKESIR', 'IZMIR', '10:00','12:00','2021-01-19','100 6 September Express',50.00);
INSERT INTO Route VALUES (992,'BALIKESIR', 'IZMIR', '16:00','18:00','2021-01-19','100 6 September Express',50.00);
INSERT INTO Route VALUES (993,'BALIKESIR', 'IZMIR', '12:00', '14:00','2021-01-24','101 17 September Express',50.00);
INSERT INTO Route VALUES (994,'BALIKESIR', 'IZMIR', '18:00', '20:00','2021-01-24','101 17 September Express',50.00);
INSERT INTO Route VALUES (995,'BALIKESIR', 'IZMIR',' 15:00', '17:00','2021-01-21','103 Aegean Express',50.00);
INSERT INTO Route VALUES (996,'BALIKESIR', 'IZMIR',' 21:00', '23:00','2021-01-21', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (997,'BALIKESIR', 'IZMIR','06:00','07:00','2021-01-23','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (998,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-23','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (999,'BALIKESIR', 'IZMIR','06:00','07:00', '2021-01-21','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (1000,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-21','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (1001,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-23','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1002,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-23','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1003,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-21','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1004,'IZMIR','BALIKESIR','16:00','17:00 ', '2021-01-21','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (1005,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-23','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1006,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-23','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1007,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-21','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1008,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-21','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(1009,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-23','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1010,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-23','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1011,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-21','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1012,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-21','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(1013,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-23','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1014,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-23','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1015,'ESKISEHIR','ISTANBUL','12:00','13:00', '2021-01-21','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1016,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-21','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (1017,'ANKARA','KAYSERI','06:00', '07:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1018,'ANKARA','KAYSERI','22:00', '23:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1019,'ANKARA','KAYSERI','06:00', '07:00','2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1020,'ANKARA','KAYSERI','22:00', '23:00','2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1021,'ANKARA','KAYSERI','06:00','07:00','2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1022,'ANKARA','KAYSERI','22:00','23:00','2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1023,'ANKARA','KAYSERI','06:00','07:00','2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1024,'ANKARA','KAYSERI','22:00','23:00','2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1025,'ANKARA','KAYSERI','10:00','11:00','2021-01-20','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1026,'ANKARA','KAYSERI','18:00','19:00','2021-01-20','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (1027,'KAYSERI','ANKARA','20:00', '21:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1028,'KAYSERI','ANKARA','12:00', '13:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1029,'KAYSERI','ANKARA','20:00', '21:00','2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1030,'KAYSERI','ANKARA','12:00', '13:00','2021-01-22','110 East Express',30.00);
INSERT INTO Route VALUES (1031,'KAYSERI','ANKARA','20:00', '21:00','2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1032,'KAYSERI','ANKARA','12:00', '13:00','2021-01-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1033,'KAYSERI','ANKARA','20:00', '21:00', '2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1034,'KAYSERI','ANKARA','12:00', '13:00','2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1035,'KAYSERI','ANKARA','16:00', '17:00', '2021-01-20','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1036,'KAYSERI','ANKARA','24:00', '01:00', '2021-01-20','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (1037,'KAYSERI','SIVAS','08:00','09:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1038,'KAYSERI','SIVAS','24:00','01:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1039,'KAYSERI','SIVAS','08:00','09:00','2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1040,'KAYSERI','SIVAS','24:00','01:00', '2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1041,'KAYSERI','SIVAS','08:00','09:00','2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1042,'KAYSERI','SIVAS','24:00','01:00', '2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1043,'KAYSERI','SIVAS','08:00','09:00','2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1044,'KAYSERI','SIVAS','24:00','01:00', '2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1045,'KAYSERI','SIVAS','12:00','13:00','2021-01-20','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1046,'KAYSERI','SIVAS','20:00','21:00','2021-01-20','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (1047,'SIVAS','KAYSERI','18:00','19:00','2021-01-19','110 East Express',30.00);
INSERT INTO Route VALUES (1048,'SIVAS','KAYSERI','10:00','11:00','2021-01-20','110 East Express',30.00);
INSERT INTO Route VALUES (1049,'SIVAS','KAYSERI','18:00','19:00','2021-01-21','110 East Express',30.00);
INSERT INTO Route VALUES (1050,'SIVAS','KAYSERI','10:00','11:00','2021-01-22','110 East Express',30.00);
INSERT INTO Route VALUES (1051,'SIVAS','KAYSERI','18:00','19:00','2021-01-22','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1052,'SIVAS','KAYSERI','10:00','11:00','2021-01-23','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1053,'SIVAS','KAYSERI','18:00','19:00','2021-01-20','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1054,'SIVAS','KAYSERI','10:00','11:00','2021-01-21','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1055,'SIVAS','KAYSERI','14:00','15:00','2021-00-20','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1056,'SIVAS','KAYSERI','22:00','23:00', '2021-01-20','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (1057,'SIVAS','MALATYA','10:00','11:00','2021-01-22','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1058,'SIVAS','MALATYA','02:00','03:00','2021-01-23','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1059,'SIVAS','MALATYA','10:00','11:00', '2021-01-20','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1060,'SIVAS','MALATYA','02:00','03:00','2021-01-21','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (1061,'MALATYA','SIVAS','16:00','17:00','2021-01-22','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1062,'MALATYA','SIVAS','08:00','09:00','2021-01-23','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1063,'MALATYA','SIVAS','16:00','17:00','2021-01-20','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1064,'MALATYA','SIVAS','08:00','09:00','2021-01-21','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (1065,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-22','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1066,'MALATYA','DIYARBAKIR','04:00','05:00', '2021-01-23','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1067,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-20','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1068,'MALATYA','DIYARBAKIR','04:00','05:00','2021-01-21','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (1069,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-22','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1070,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-23','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1071,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-20','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1072,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-21','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (1073,'SIVAS','ERZINCAN','10:00','11:00', '2021-01-19','110 East Express',45.00);
INSERT INTO Route VALUES (1074,'SIVAS','ERZINCAN','02:00','03:00','2021-01-20','110 East Express',45.00);
INSERT INTO Route VALUES (1075,'SIVAS','ERZINCAN','10:00','11:00','2021-01-21','110 East Express',45.00);
INSERT INTO Route VALUES (1076,'SIVAS','ERZINCAN','02:00','03:00', '2021-01-22','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (1077,'ERZINCAN','SIVAS','16:00','17:00','2021-01-19','110 East Express',45.00);
INSERT INTO Route VALUES (1078,'ERZINCAN','SIVAS','08:00','09:00','2021-01-20','110 East Express',45.00);
INSERT INTO Route VALUES (1079,'ERZINCAN','SIVAS','16:00','17:00','2021-01-21','110 East Express',45.00);
INSERT INTO Route VALUES (1080,'ERZINCAN','SIVAS','08:00','09:00','2021-01-22','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (1081,'ERZINCAN','KARS','12:00','13:00','2021-01-19','110 East Express',35.00);
INSERT INTO Route VALUES (1082,'ERZINCAN','KARS','04:00','05:00','2021-01-20','110 East Express',35.00);
INSERT INTO Route VALUES (1083,'ERZINCAN','KARS','12:00','13:00', '2021-01-21','110 East Express',35.00);
INSERT INTO Route VALUES (1084,'ERZINCAN','KARS','04:00','05:00','2021-01-22','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (1085,'KARS','ERZINCAN','14:00','15:00','2021-01-19','110 East Express',35.00);
INSERT INTO Route VALUES (1086,'KARS','ERZINCAN','06:00','07:00','2021-01-20','110 East Express',35.00);
INSERT INTO Route VALUES (1087,'KARS','ERZINCAN','14:00','15:00', '2021-01-21','110 East Express',35.00);
INSERT INTO Route VALUES (1088,'KARS','ERZINCAN','06:00','07:00','2021-01-22','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (1089,'ADANA','KONYA','11:00','12:00', '2021-01-20','111 Toros Express',55.00);
INSERT INTO Route VALUES (1090,'ADANA','KONYA','19:00','20:00','2021-01-20','111 Toros Express',55.00);
INSERT INTO Route VALUES (1091,'ADANA','KONYA','11:00','12:00','2021-01-22','111 Toros Express',55.00);
INSERT INTO Route VALUES (1092,'ADANA','KONYA','19:00','20:00','2021-01-22','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (1093,'KONYA','ADANA','09:00','10:00','2021-01-20','111 Toros Express',55.00);
INSERT INTO Route VALUES (1094,'KONYA','ADANA','17:00','18:00','2021-01-20','111 Toros Express',55.00);
INSERT INTO Route VALUES (1095,'KONYA','ADANA','09:00','10:00','2021-01-22','111 Toros Express',55.00);
INSERT INTO Route VALUES (1096,'KONYA','ADANA','17:00','18:00','2021-01-22','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (1097,'KONYA','ISTANBUL','13:00','14:00','2021-01-20','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1098,'KONYA','ISTANBUL','21:00','22:00','2021-01-20','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1099,'KONYA','ISTANBUL','13:00','14:00','2021-01-22','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1100,'KONYA','ISTANBUL','21:00','22:00','2021-01-22','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (1101,'ISTANBUL','KONYA','07:00','08:00','2021-01-20','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1102,'ISTANBUL','KONYA','15:00','16:00','2021-01-20','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1103,'ISTANBUL','KONYA','07:00','08:00','2021-01-22','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1104,'ISTANBUL','KONYA','15:00','16:00','2021-01-22','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (1105,'ANKARA','VAN','11:00','12:00','2021-01-19','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1106,'ANKARA','VAN','19:00','20:00', '2021-01-19','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1107,'ANKARA','VAN','11:00','12:00','2021-01-24','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1108,'ANKARA','VAN','19:00','20:00', '2021-01-24','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (1109,'VAN','ANKARA','13:00','14:00', '2021-01-19','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1110,'VAN','ANKARA','21:00','22:00', '2021-01-19','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1111,'VAN','ANKARA','13:00','14:00','2021-01-24','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1112,'VAN','ANKARA','21:00','22:00','2021-01-24','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (1113,'ISTANBUL','ANKARA','09:00','10:00','2021-01-19','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1114,'ISTANBUL','ANKARA','17:00','18:00','2021-01-19','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1115,'ISTANBUL','ANKARA','09:00','10:00','2021-01-24','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1116,'ISTANBUL','ANKARA','17:00','18:00', '2021-01-24','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (1117,'ANKARA','ISTANBUL','15:00','16:00','2021-01-19','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1118,'ANKARA','ISTANBUL','23:00','24:00','2021-01-19','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1119,'ANKARA','ISTANBUL','15:00','16:00','2021-01-24','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1120,'ANKARA','ISTANBUL','23:00','24:00','2021-01-24','113 High Speed Train',40.00);

/*9. Hafta*/
/*Route: İzmir- Balıkesir*/
INSERT INTO Route VALUES (1121,'IZMIR','BALIKESIR','07:00 ','09:00 ','2021-01-26','100 6 September Express',50.00);
INSERT INTO Route VALUES (1122,'IZMIR','BALIKESIR','13:00','15:00','2021-01-26','100 6 September Express',50.00);
INSERT INTO Route VALUES (1123,'IZMIR','BALIKESIR','09:00','11:00', '2021-01-31','101 17 September Express',50.00);
INSERT INTO Route VALUES (1124,'IZMIR','BALIKESIR','15:00','17:00', '2021-01-31','101 17 September Express',50.00);
INSERT INTO Route VALUES (1125,'IZMIR','BALIKESIR','12:00','14:00','2021-01-28', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (1126,'IZMIR','BALIKESIR','18:00','20:00','2021-01-28', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (1127,'IZMIR','BALIKESIR','08:00','09:00','2021-01-30','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (1128,'IZMIR','BALIKESIR','20:00','21:00','2021-01-29','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (1129,'IZMIR','BALIKESIR','08:00','09:00','2021-01-28','105 İzmir  Blue Train',50.00);
INSERT INTO Route VALUES (1130,'IZMIR','BALIKESIR','20:00','21:00','2021-01-28','105 İzmir Blue Train',50.00);
/*Route: Balıkesir-İzmir*/
INSERT INTO Route VALUES (1131,'BALIKESIR', 'IZMIR', '10:00','12:00','2021-01-26','100 6 September Express',50.00);
INSERT INTO Route VALUES (1132,'BALIKESIR', 'IZMIR', '16:00','18:00','2021-01-26','100 6 September Express',50.00);
INSERT INTO Route VALUES (1133,'BALIKESIR', 'IZMIR', '12:00', '14:00', '2021-01-31','101 17 September Express',50.00);
INSERT INTO Route VALUES (1134,'BALIKESIR', 'IZMIR', '18:00', '20:00','2021-01-31','101 17 September Express',50.00);
INSERT INTO Route VALUES (1135,'BALIKESIR', 'IZMIR',' 15:00', '17:00', '2021-01-28', '103 Aegean Express',50.00);
INSERT INTO Route VALUES (1136,'BALIKESIR', 'IZMIR',' 21:00', '23:00','2021-01-28','103 Aegean Express',50.00);
INSERT INTO Route VALUES (1137,'BALIKESIR', 'IZMIR','06:00','07:00', '2021-01-30','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (1138,'BALIKESIR', 'IZMIR','18:00','19:00','2021-01-30','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (1139,'BALIKESIR', 'IZMIR','06:00','07:00','2021-01-28','105 İzmir Blue Train',50.00);
INSERT INTO Route VALUES (1140,'BALIKESIR', 'IZMIR','18:00','19:00', '2021-01-28','105 İzmir Blue Train',50.00);
/*Route: Eskişehir-Balıkesir*/
INSERT INTO Route VALUES (1141,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-30','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1142,'IZMIR','BALIKESIR','16:00','17:00 ','2021-01-30','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1143,'IZMIR','BALIKESIR','04:00','05:00 ','2021-01-28','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1144,'IZMIR','BALIKESIR','16:00','17:00 ', '2021-01-28','105 İzmir Blue Train',40.00);
/*Route: Balıkesir-Eskişehir*/
INSERT INTO Route VALUES (1145,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-30','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1146,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-30','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1147,'BALIKESIR', 'ESKISEHIR','10:00','11:00','2021-01-28','105 İzmir Blue Train',40.00);
INSERT INTO Route VALUES (1148,'BALIKESIR', 'ESKISEHIR','22:01','23:00','2021-01-28','105 İzmir Blue Train',40.00);
/*Route: İstanbul-Eskişehir*/
INSERT INTO Route VALUES(1149,'ISTANBUL','ESKISEHIR','02:00','03:00', '2021-01-30','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1150,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-30','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1151,'ISTANBUL','ESKISEHIR','02:00','03:00','2021-01-28','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1152,'ISTANBUL','ESKISEHIR','14:00','15:00','2021-01-28','113 High Speed Train',30.00);
/*Route: Eskişehir-İstanbul*/
INSERT INTO Route VALUES(1153,'ESKISEHIR','ISTANBUL','12:00','13:00','2021-01-30','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1154,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-30','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1155,'ESKISEHIR','ISTANBUL','12:00','13:00', '2021-01-28','113 High Speed Train',30.00);
INSERT INTO Route VALUES(1156,'ESKISEHIR','ISTANBUL','24:00','01:00','2021-01-28','113 High Speed Train',30.00);
/*Route: Ankara-Kayseri*/
INSERT INTO Route VALUES (1157,'ANKARA','KAYSERI','06:00', '07:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1158,'ANKARA','KAYSERI','22:00', '23:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1159,'ANKARA','KAYSERI','06:00', '07:00','2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1160,'ANKARA','KAYSERI','22:00', '23:00','2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1161,'ANKARA','KAYSERI','06:00','07:00', '2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1162,'ANKARA','KAYSERI','22:00','23:00', '2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1163,'ANKARA','KAYSERI','06:00','07:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1164,'ANKARA','KAYSERI','22:00','23:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1165,'ANKARA','KAYSERI','10:00','11:00','2021-01-27','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1166,'ANKARA','KAYSERI','18:00','19:00','2021-01-27','112 Van Lake Express',30.00);
/*Route: Kayseri-Ankara*/
INSERT INTO Route VALUES (1167,'KAYSERI','ANKARA','20:00', '21:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1168,'KAYSERI','ANKARA','12:00', '13:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1169,'KAYSERI','ANKARA','20:00', '21:00', '2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1170,'KAYSERI','ANKARA','12:00', '13:00', '2021-01-29','110 East Express',30.00);
INSERT INTO Route VALUES (1171,'KAYSERI','ANKARA','20:00', '21:00','2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1172,'KAYSERI','ANKARA','12:00', '13:00','2021-01-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1173,'KAYSERI','ANKARA','20:00', '21:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1174,'KAYSERI','ANKARA','12:00', '13:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1175,'KAYSERI','ANKARA','16:00', '17:00','2021-01-27','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1176,'KAYSERI','ANKARA','24:00', '01:00','2021-01-27','112 Van Lake Express',30.00);
/*Route: Kayseri-Sivas*/
INSERT INTO Route VALUES (1177,'KAYSERI','SIVAS','08:00','09:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1178,'KAYSERI','SIVAS','24:00','01:00','2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1179,'KAYSERI','SIVAS','08:00','09:00','2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1180,'KAYSERI','SIVAS','24:00','01:00','2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1181,'KAYSERI','SIVAS','08:00','09:00', '2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1182,'KAYSERI','SIVAS','24:00','01:00','2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1183,'KAYSERI','SIVAS','08:00','09:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1184,'KAYSERI','SIVAS','24:00','01:00','2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1185,'KAYSERI','SIVAS','12:00','13:00', '2021-01-27','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1186,'KAYSERI','SIVAS','20:00','21:00', '2021-01-27','112 Van Lake Express',30.00);
/*Route: Sivas-Kayseri*/
INSERT INTO Route VALUES (1187,'SIVAS','KAYSERI','18:00','19:00', '2021-01-26','110 East Express',30.00);
INSERT INTO Route VALUES (1188,'SIVAS','KAYSERI','10:00','11:00', '2021-01-27','110 East Express',30.00);
INSERT INTO Route VALUES (1189,'SIVAS','KAYSERI','18:00','19:00', '2021-01-28','110 East Express',30.00);
INSERT INTO Route VALUES (1190,'SIVAS','KAYSERI','10:00','11:00','2021-01-29','110 East Express',30.00);
INSERT INTO Route VALUES (1191,'SIVAS','KAYSERI','18:00','19:00','2021-01-29','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1192,'SIVAS','KAYSERI','10:00','11:00','2021-01-30','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1193,'SIVAS','KAYSERI','18:00','19:00', '2021-01-27','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1194,'SIVAS','KAYSERI','10:00','11:00', '2021-01-28','106 South Kurtulan Express',30.00);
INSERT INTO Route VALUES (1195,'SIVAS','KAYSERI','14:00','15:00','2021-00-27','112 Van Lake Express',30.00);
INSERT INTO Route VALUES (1196,'SIVAS','KAYSERI','22:00','23:00', '2021-01-27','112 Van Lake Express',30.00);
/*Route: Sivas-Malatya*/
INSERT INTO Route VALUES (1197,'SIVAS','MALATYA','10:00','11:00','2021-01-29','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1198,'SIVAS','MALATYA','02:00','03:00','2021-01-30','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1199,'SIVAS','MALATYA','10:00','11:00','2021-01-27','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1200,'SIVAS','MALATYA','02:00','03:00','2021-01-28','106 South Kurtulan Express',40.00);
/*Route: Malatya-Sivas*/
INSERT INTO Route VALUES (1201,'MALATYA','SIVAS','16:00','17:00', '2021-01-29','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1202,'MALATYA','SIVAS','08:00','09:00', '2021-01-30','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1203,'MALATYA','SIVAS','16:00','17:00','2021-01-27','106 South Kurtulan Express',40.00);
INSERT INTO Route VALUES (1204,'MALATYA','SIVAS','08:00','09:00','2021-01-28','106 South Kurtulan Express',40.00);
/*Route: Malatya-Diyarbakır*/
INSERT INTO Route VALUES (1205,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-29','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1206,'MALATYA','DIYARBAKIR','04:00','05:00','2021-01-30','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1207,'MALATYA','DIYARBAKIR','12:00','13:00','2021-01-27','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1208,'MALATYA','DIYARBAKIR','04:00','05:00','2021-01-28','106 South Kurtulan Express',20.00);
/*Diyarbakır-Malatya*/
INSERT INTO Route VALUES (1209,'DIYARBAKIR','MALATYA','14:00','15:00','2021-01-29','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1210,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-30','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1211,'DIYARBAKIR','MALATYA','14:00','15:00', '2021-01-27','106 South Kurtulan Express',20.00);
INSERT INTO Route VALUES (1212,'DIYARBAKIR','MALATYA','06:00','07:00','2021-01-28','106 South Kurtulan Express',20.00);
/*Route: Sivas-Erzincan*/
INSERT INTO Route VALUES (1213,'SIVAS','ERZINCAN','10:00','11:00','2021-01-26','110 East Express',45.00);
INSERT INTO Route VALUES (1214,'SIVAS','ERZINCAN','02:00','03:00', '2021-01-27','110 East Express',45.00);
INSERT INTO Route VALUES (1215,'SIVAS','ERZINCAN','10:00','11:00', '2021-01-28','110 East Express',45.00);
INSERT INTO Route VALUES (1216,'SIVAS','ERZINCAN','02:00','03:00','2021-01-29','110 East Express',45.00);
/*Route: Erzincan-Sivas*/
INSERT INTO Route VALUES (1217,'ERZINCAN','SIVAS','16:00','17:00', '2021-01-26','110 East Express',45.00);
INSERT INTO Route VALUES (1218,'ERZINCAN','SIVAS','08:00','09:00', '2021-01-27','110 East Express',45.00);
INSERT INTO Route VALUES (1219,'ERZINCAN','SIVAS','16:00','17:00','2021-01-28','110 East Express',45.00);
INSERT INTO Route VALUES (1220,'ERZINCAN','SIVAS','08:00','09:00','2021-01-29','110 East Express',45.00);
/*Route: Erzincan-Kars*/
INSERT INTO Route VALUES (1221,'ERZINCAN','KARS','12:00','13:00','2021-01-26','110 East Express',35.00);
INSERT INTO Route VALUES (1222,'ERZINCAN','KARS','04:00','05:00', '2021-01-27','110 East Express',35.00);
INSERT INTO Route VALUES (1223,'ERZINCAN','KARS','12:00','13:00','2021-01-28','110 East Express',35.00);
INSERT INTO Route VALUES (1224,'ERZINCAN','KARS','04:00','05:00', '2021-01-29','110 East Express',35.00);
/*Route: Kars-Erzincan*/
INSERT INTO Route VALUES (1225,'KARS','ERZINCAN','14:00','15:00','2021-01-26','110 East Express',35.00);
INSERT INTO Route VALUES (1226,'KARS','ERZINCAN','06:00','07:00', '2021-01-27','110 East Express',35.00);
INSERT INTO Route VALUES (1227,'KARS','ERZINCAN','14:00','15:00','2021-01-28','110 East Express',35.00);
INSERT INTO Route VALUES (1228,'KARS','ERZINCAN','06:00','07:00', '2021-01-29','110 East Express',35.00);
/*Route: Adana-Konya*/
INSERT INTO Route VALUES (1229,'ADANA','KONYA','11:00','12:00','2021-01-27','111 Toros Express',55.00);
INSERT INTO Route VALUES (1230,'ADANA','KONYA','19:00','20:00','2021-01-27','111 Toros Express',55.00);
INSERT INTO Route VALUES (1231,'ADANA','KONYA','11:00','12:00', '2021-01-29','111 Toros Express',55.00);
INSERT INTO Route VALUES (1232,'ADANA','KONYA','19:00','20:00','2021-01-29','111 Toros Express',55.00);
/*Route: Konya-Adana*/
INSERT INTO Route VALUES (1233,'KONYA','ADANA','09:00','10:00','2021-01-27','111 Toros Express',55.00);
INSERT INTO Route VALUES (1234,'KONYA','ADANA','17:00','18:00','2021-01-27','111 Toros Express',55.00);
INSERT INTO Route VALUES (1235,'KONYA','ADANA','09:00','10:00','2021-01-29','111 Toros Express',55.00);
INSERT INTO Route VALUES (1236,'KONYA','ADANA','17:00','18:00', '2021-01-29','111 Toros Express',55.00);
/*Route: Konya-İstanbul*/
INSERT INTO Route VALUES (1237,'KONYA','ISTANBUL','13:00','14:00','2021-01-27','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1238,'KONYA','ISTANBUL','21:00','22:00','2021-01-27','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1239,'KONYA','ISTANBUL','13:00','14:00','2021-01-29','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1240,'KONYA','ISTANBUL','21:00','22:00','2021-01-29','113 High Speed Train',60.00);
/*Route: İstanbul-Konya*/
INSERT INTO Route VALUES (1241,'ISTANBUL','KONYA','07:00','08:00','2021-01-27','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1242,'ISTANBUL','KONYA','15:00','16:00', '2021-01-27','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1243,'ISTANBUL','KONYA','07:00','08:00','2021-01-29','113 High Speed Train',60.00);
INSERT INTO Route VALUES (1244,'ISTANBUL','KONYA','15:00','16:00','2021-01-29','113 High Speed Train',60.00);
/*Route: Ankara-Van*/
INSERT INTO Route VALUES (1245,'ANKARA','VAN','11:00','12:00','2021-01-26','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1246,'ANKARA','VAN','19:00','20:00','2021-01-26','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1247,'ANKARA','VAN','11:00','12:00','2021-01-31','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1248,'ANKARA','VAN','19:00','20:00','2021-01-31','112 Van Lake Express',100.00);
/*Route: Van-Ankara*/
INSERT INTO Route VALUES (1249,'VAN','ANKARA','13:00','14:00', '2021-01-26','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1250,'VAN','ANKARA','21:00','22:00', '2021-01-26','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1251,'VAN','ANKARA','13:00','14:00','2021-01-31','112 Van Lake Express',100.00);
INSERT INTO Route VALUES (1252,'VAN','ANKARA','21:00','22:00','2021-01-31','112 Van Lake Express',100.00);
/*Route: İstanbul-Ankara*/
INSERT INTO Route VALUES (1253,'ISTANBUL','ANKARA','09:00','10:00','2021-01-26','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1254,'ISTANBUL','ANKARA','17:00','18:00','2021-01-26','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1255,'ISTANBUL','ANKARA','09:00','10:00','2021-01-31','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1256,'ISTANBUL','ANKARA','17:00','18:00','2021-01-31','113 High Speed Train',40.00);
/*Route: Ankara- İstanbul*/
INSERT INTO Route VALUES (1257,'ANKARA','ISTANBUL','15:00','16:00','2021-01-26','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1258,'ANKARA','ISTANBUL','23:00','24:00','2021-01-26','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1259,'ANKARA','ISTANBUL','15:00','16:00','2021-01-31','113 High Speed Train',40.00);
INSERT INTO Route VALUES (1260,'ANKARA','ISTANBUL','23:00','24:00','2021-01-31','113 High Speed Train',40.00);

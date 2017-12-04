-- INSERT DATA
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`login`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`login` (`LoginId`, `Password`, `Security_Question`, `Security_Answer`, `Access_Rights`) VALUES ('10001', '123456', 17, 'Jane', 14);
INSERT INTO `internship_inventory`.`login` (`LoginId`, `Password`, `Security_Question`, `Security_Answer`, `Access_Rights`) VALUES ('10002', '234567', 18, 'Katty', 15);
INSERT INTO `internship_inventory`.`login` (`LoginId`, `Password`, `Security_Question`, `Security_Answer`, `Access_Rights`) VALUES ('10003', '456789', 19, '1900', 15);
INSERT INTO `internship_inventory`.`login` (`LoginId`, `Password`, `Security_Question`, `Security_Answer`, `Access_Rights`) VALUES ('10004', '987655', 20, 'New York', 15);
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10000', 'John	Lee', '(251) 578-9442', 'jlee@gmail.com', '111 Deerwood Road,San Ramon, CA 94583 ', '511-22-1993', '10000');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10001', 'Josefina	Douglas', '(251) 546-9442', 'mthurn@live.com', '20 Maple Avenue,San Pedro, CA 90731 ', '520-22-0066', '10001');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10002', 'Johnnie	Green', '(125) 546-4478', 'rgarcia@optonline.net', '601 Sherwood Ave. San Bernardino, CA 92404', '527-42-8884', '10002');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10003', 'Angelica	Lindsey', '(226) 906-2721', 'webdragon@comcast.net', '7246 W. Windsor Dr. Carmichael, CA 95608', '525-47-9158', '10003');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10004', 'Shelia	Curtis', '(671) 925-1352', 'crandall@sbcglobal.net', '241 Indian Spring St. Pittsburg, CA 94565', '527-80-4977', '10004');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10005', 'Daniel	Brown', '(732) 925-1352', 'dbrown@sbcglobal.net', '3336 Indian Spring New Brunswick 08933', '511-80-4934', '10005');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10006', 'Christ	Kirby', '(671) 925-1352', 'ckirby@yahoo.com', '241 Indian Spring St. Pittsburg, CA 94565', '522-80-4923', '10006');
INSERT INTO `internship_inventory`.`person` (`ID`, `Name`, `Cell`, `Email`, `Address`, `SSN`, `LoginID`) VALUES ('10007', 'Stephen	Young', '(212) 925-1352', 'syoung@sbcglobal.net', '70 Washington Square South New York, NY 10003', '533-80-4912', '10007');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`employee` (`EmployeeID`, `OfficePhone`, `OfficeAdd`) VALUES ('10000', '5866683878', '2600 Clifton Ave.,Cincinnati, OH 45221');
INSERT INTO `internship_inventory`.`employee` (`EmployeeID`, `OfficePhone`, `OfficeAdd`) VALUES ('10001', '4564883874', '123 6th St. Melbourne, FL 32904');
INSERT INTO `internship_inventory`.`employee` (`EmployeeID`, `OfficePhone`, `OfficeAdd`) VALUES ('10002', '5866684389', '71 Pilgrim Avenue, Chevy Chase, MD 20815 ');
INSERT INTO `internship_inventory`.`employee` (`EmployeeID`, `OfficePhone`, `OfficeAdd`) VALUES ('10003', '8883158641', '70 Bowman St. South Windsor, CT 06074 ');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`facaulty`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`facaulty` (`FacID`, `Dept`, `Type`) VALUES ('10000', 'Math', 'Fulltime');
INSERT INTO `internship_inventory`.`facaulty` (`FacID`, `Dept`, `Type`) VALUES ('10001', 'Math', 'Fulltime');
INSERT INTO `internship_inventory`.`facaulty` (`FacID`, `Dept`, `Type`) VALUES ('10003', 'Art', 'Parttime');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`administrator`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`administrator` (`AdminID`, `Shift`) VALUES ('10002', 'Yes');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`student`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`student` (`StudentID`, `Semester`, `Major`, `Minor`, `GraduationYear`, `EnrollmentYear`, `GPA`) VALUES ('10004', 'Spring', 'Math', NULL, 2020, 2016, 3.5);
INSERT INTO `internship_inventory`.`student` (`StudentID`, `Semester`, `Major`, `Minor`, `GraduationYear`, `EnrollmentYear`, `GPA`) VALUES ('10005', 'Fall', 'Art', NULL, 2018, 2016, 3.2);
INSERT INTO `internship_inventory`.`student` (`StudentID`, `Semester`, `Major`, `Minor`, `GraduationYear`, `EnrollmentYear`, `GPA`) VALUES ('10006', 'Spring', 'CS', NULL, 2017, 2015, 3.7);
INSERT INTO `internship_inventory`.`student` (`StudentID`, `Semester`, `Major`, `Minor`, `GraduationYear`, `EnrollmentYear`, `GPA`) VALUES ('10007', 'Fall', 'Finance', NULL, 2022, 2018, 3.0);
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`company` (`CompanyID`, `CompanyName`, `Address`, `Cell`, `Description`, `Industry`, `Email`) VALUES ('C1', 'Walmart', '702 Sw 8th St, Bentonville, AR', '(479) 273-4000', 'Wal-Mart Stores is an irresistible (or at least unavoidable) retail force that has yet to meet any immovable objects. The world\'s largest company by revenue and bigger than Europe\'s Carrefour, Metro AG, and Tesco combined, Walmart is the world\'s #1 retailer with more than 2.3 million employees. In the US, Wal-Mart operates more than 5,300 stores, including about 4,570 Wal-Mart stores and 655 Sam\'s Club warehouses, and a growing number of smaller format stores. The company\'s faster growing international division (26% of sales) numbers more than 6,100 locations; Wal-Mart is the #1 retailer in Canada and Mexico and has operations in Asia (where it owns a 95% stake in Japanese retailer SEIYU), Africa, Europe, and Latin America.', 'Retail', 'www.walmart.com');
INSERT INTO `internship_inventory`.`company` (`CompanyID`, `CompanyName`, `Address`, `Cell`, `Description`, `Industry`, `Email`) VALUES ('C2', 'Exxon Mobil Corporation', '4045 Scenic Hwy, Baton Rouge, LA', '(985) 359-8519', 'Some telephone numbers on the Hoover’s site may be on a country’s do not call or do not contact list including, but not limited to, the United Kingdom’s CTPS or TPS registers. It is a legal requirement that companies do not make sales or marketing calls to registered numbers. These are central opt out registers whereby corporate subscribers and individuals can register their preference not to receive unsolicited sales and marketing telephone calls. By using the information provided on the Hoover’s sites, as the direct marketer you represent and warrant that you will use such information in compliance with all applicable local, state, national or international laws and regulations, including any local do not call registers or marketing regulations, and agree to defend, indemnify and hold harmless Dun & Bradstreet and each of its affiliates in the event your use violates such laws and regulations.', 'Petroleum refining', 'www.exxonmobil.com');
INSERT INTO `internship_inventory`.`company` (`CompanyID`, `CompanyName`, `Address`, `Cell`, `Description`, `Industry`, `Email`) VALUES ('C3', 'TOYOTA MOTOR ', '1, Toyotacho, Toyota, Aichi,Japan', '+81-565282121', 'Toyota Motor, among the world\'s largest automotive manufacturers by revenue, designs and manufactures a diverse product line-up that ranges from subcompacts to luxury and sports vehicles to SUVs, trucks, minivans, and buses. Its vehicles are produced either with combustion or hybrid engines, as with the Prius. Toyota\'s subsidiaries also manufacture vehicles: Daihatsu Motor produces mini-vehicles, while Hino Motors produces trucks and buses. Additionally, Toyota makes automotive parts for its own use and for sale to others. Popular models include the Camry, Corolla, Land Cruiser, and luxury Lexus line, as well as the Tundra truck.', 'automotive manufacturers', 'www.toyota.com');
INSERT INTO `internship_inventory`.`company` (`CompanyID`, `CompanyName`, `Address`, `Cell`, `Description`, `Industry`, `Email`) VALUES ('C4', 'Apple Inc.', '1 Infinite Loop, Cupertino, CA', '(408) 996-1010', 'Ask Siri to name the most successful company in the world and it might respond: Apple. In terms of profit, revenue, market capitalization, and consumer cachet, it certainly ranks right up there. The iPhone, in its ninth year and seventh generation, has been the company\'s golden goose, although the aging product may be losing a little of its luster. In addition to the iPhone, other familiar Apple products and services include MacBook computers and iPad tablets, as well as iTunes, the App store, and Apple Music. Primarily a consumer-oriented company, Apple has inked alliances with IBM and Cisco Systems to deepen its penetration of the enterprise market. About 60% of revenue comes from outside the Americas.', 'technology', 'www.apple.com');
COMMIT;

-- -----------------------------------------------------
-- Data for table `internship_inventory`.`internship`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`internship` (`InternshipId`, `StartDate`, `EndDate`, `Location`, `Description`, `HoursPerWeek`, `NoOfOpenings`, `Title`, `PaidYorN`, `CompanyID`) VALUES ('I101', '2017-05-01', '2017-07-01', 'Charlotte', 'The successful candidate will turn data into information, information into insight and insight into business decisions. Data analyst responsibilities include conducting full lifecycle analysis to include requirements, activities and design. Data analysts will develop analysis and reporting capabilities. They will also monitor performance and quality control plans to identify improvements.', 20, 2, 'Data Analytics', 'Y', 'C1');
INSERT INTO `internship_inventory`.`internship` (`InternshipId`, `StartDate`, `EndDate`, `Location`, `Description`, `HoursPerWeek`, `NoOfOpenings`, `Title`, `PaidYorN`, `CompanyID`) VALUES ('I201', '2017-05-01', '2017-10-01', ' New York', 'Marketing Assistant responsibilities include assisting in organizing campaigns and developing marketing strategies. This work will be a critical factor for the smooth operation of the Marketing department and the attainment of its goals, as well as for the long-term growth of the company.', 40, 3, 'Marketing', 'Y', 'C2');
INSERT INTO `internship_inventory`.`internship` (`InternshipId`, `StartDate`, `EndDate`, `Location`, `Description`, `HoursPerWeek`, `NoOfOpenings`, `Title`, `PaidYorN`, `CompanyID`) VALUES ('I301', '2018-07-01', '2019-07-01', 'Chicago', 'Java developer roles and responsibilities include managing Java/Java EE application development while providing expertise in the full software development lifecycle, from concept and design to testing.', 10, 1, 'Developer', 'N', 'C3');
INSERT INTO `internship_inventory`.`internship` (`InternshipId`, `StartDate`, `EndDate`, `Location`, `Description`, `HoursPerWeek`, `NoOfOpenings`, `Title`, `PaidYorN`, `CompanyID`) VALUES ('I401', '2018-07-01', '2018-10-01', 'San Francisco', 'Sales assistant duties include selling, restocking and merchandising. The goal is to provide high class customer service and to increase company’s growth and revenue through sales maximisation.', 30, 5, 'Sales', 'N', 'C4');
COMMIT;

-- -----------------------------------------------------
-- Data for table `internship_inventory`.`application`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`application` (`ApplicationID`, `HireOrNot`, `StudentID`, `InternshipID`) VALUES ('A1011', 10, '10004', 'I101');
INSERT INTO `internship_inventory`.`application` (`ApplicationID`, `HireOrNot`, `StudentID`, `InternshipID`) VALUES ('A2011', 11, '10005', 'I201');
INSERT INTO `internship_inventory`.`application` (`ApplicationID`, `HireOrNot`, `StudentID`, `InternshipID`) VALUES ('A3011', 11, '10007', 'I301');
INSERT INTO `internship_inventory`.`application` (`ApplicationID`, `HireOrNot`, `StudentID`, `InternshipID`) VALUES ('A4011', 12, '10006', 'I401');
COMMIT;

-- -----------------------------------------------------
-- Data for table `internship_inventory`.`skills`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`skills` (`SkillID`, `SkillDescription`) VALUES ('S10001', 'Java');
INSERT INTO `internship_inventory`.`skills` (`SkillID`, `SkillDescription`) VALUES ('S10002', 'SQL');
INSERT INTO `internship_inventory`.`skills` (`SkillID`, `SkillDescription`) VALUES ('S10003', 'Python');
INSERT INTO `internship_inventory`.`skills` (`SkillID`, `SkillDescription`) VALUES ('S10004', 'Excel');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`internshipskill`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`internshipskill` (`SkillID`, `InternshipID`) VALUES ('S10001', 'I101');
INSERT INTO `internship_inventory`.`internshipskill` (`SkillID`, `InternshipID`) VALUES ('S10002', 'I201');
INSERT INTO `internship_inventory`.`internshipskill` (`SkillID`, `InternshipID`) VALUES ('S10003', 'I301');
INSERT INTO `internship_inventory`.`internshipskill` (`SkillID`, `InternshipID`) VALUES ('S10004', 'I401');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`paidintern`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`paidintern` (`InternshipID`, `TotalSalary`, `WorkType`) VALUES ('I101', NULL, 'Remote');
INSERT INTO `internship_inventory`.`paidintern` (`InternshipID`, `TotalSalary`, `WorkType`) VALUES ('I201', NULL, 'Onsite');
COMMIT;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`unpaidintern`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`unpaidintern` (`InternshipID`, `AcademicCredit`) VALUES ('I301', '4.0');
INSERT INTO `internship_inventory`.`unpaidintern` (`InternshipID`, `AcademicCredit`) VALUES ('I401', '3.0');
COMMIT;

-- -----------------------------------------------------
-- Data for table `internship_inventory`.`supervisor`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`supervisor` (`SupervisorID`, `Name`, `Email`, `WorkPhone`, `OfficeAddress`, `CompanyID`) VALUES ('S10001', 'Myriam Oneill', 'mxiao@yahoo.com', '(251) 546-9442', '71 Pilgrim Avenue, Chevy Chase, MD 20815 ', '10002');
INSERT INTO `internship_inventory`.`supervisor` (`SupervisorID`, `Name`, `Email`, `WorkPhone`, `OfficeAddress`, `CompanyID`) VALUES ('S10002', 'Johanne Rawlings', 'dogdude@comcast.net', '(226) 906-2721', '44 Shirley Ave. West Chicago, IL 60185', '10003');
COMMIT;

-- -----------------------------------------------------
-- Data for table `internship_inventory`.`placement`
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
INSERT INTO `internship_inventory`.`placement` (`PlacementID`, `SupervisorID`, `Notes`) VALUES ('P1011', 'S10001', 'Pending');
INSERT INTO `internship_inventory`.`placement` (`PlacementID`, `SupervisorID`, `Notes`) VALUES ('P2011', 'S10002', 'Pending');
COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Delete Data for table `internship_inventory`.`person`
-- -----------------------------------------------------
-- turn on CHECKS
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=1;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1;
/*
DELETE FROM person
where ID='10000';
SELECT * from person;
SELECT * from employee;
-- -----------------------------------------------------
-- Update Data for table `internship_inventory`.`employee`
-- -----------------------------------------------------
UPDATE person
SET Name = 'Alfred Schmidt'
WHERE ID = '10001';
SELECT * from person;
-- in Employee table, set "on update"*/

-- -----------------------------------------------------
-- Call procedure for enum
-- dropdownlist1 call one by one
-- dropdownlist1 return multipole rows 
-- -----------------------------------------------------
call dropdownlist1(10,@a);
select @a;

call dropdownlist2(10,12);

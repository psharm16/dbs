-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema Internship_Inventory
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Internship_Inventory` ;
-- -----------------------------------------------------
-- Schema Internship_Inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Internship_Inventory` DEFAULT CHARACTER SET utf8;
USE `Internship_Inventory` ;
-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `internship_inventory`.`login` ;
CREATE TABLE IF NOT EXISTS `internship_inventory`.`login` (
 `loginId` VARCHAR(35) NOT NULL,
 `password` VARCHAR(45) NOT NULL,
 `security_question` int NOT NULL,
 `security_answer` VARCHAR(45) NOT NULL,
 `access_rights` int NOT NULL,
 PRIMARY KEY (`LoginId`),
 UNIQUE INDEX `LoginId_UNIQUE` (`LoginId` ASC),
 CONSTRAINT `login_enum_security_question`
   FOREIGN KEY (`security_question`)
   REFERENCES `internship_inventory`.`enum` (`enumID`),
 CONSTRAINT `login_enum_access_rights`
   FOREIGN KEY (`access_rights`)
   REFERENCES `internship_inventory`.`enum` (`enumID`)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `internship_inventory`.`person` ;
CREATE TABLE IF NOT EXISTS `internship_inventory`.`person` (
 `ID` VARCHAR(15) NOT NULL,
 `name` VARCHAR(45) NULL DEFAULT NULL,
 `cell` VARCHAR(15) NULL DEFAULT NULL,
 `email` VARCHAR(45) NULL DEFAULT NULL,
 `address` VARCHAR(45) NULL DEFAULT NULL,
 `SSN` VARCHAR(15) NULL DEFAULT NULL,
 `loginid` VARCHAR(45) NULL DEFAULT NULL,
 PRIMARY KEY (`ID`),
 UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
 UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
 INDEX `loginid_idx` (`LoginID` ASC),
 CONSTRAINT `loginid`
   FOREIGN KEY (`loginid`)
   REFERENCES `internship_inventory`.`login` (`loginid`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Employee` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Employee` (
 `EmployeeID` VARCHAR(15) NOT NULL,
 `OfficePhone` VARCHAR(45) NULL,
 `OfficeAdd` VARCHAR(255) NULL,
 PRIMARY KEY (`EmployeeID`),
 CONSTRAINT `EmployeeID`
   FOREIGN KEY (`EmployeeID`)
   REFERENCES `Internship_Inventory`.`Person` (`ID`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Administrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Administrator` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Administrator` (
 `AdminID` VARCHAR(15) NOT NULL,
 `Shift` VARCHAR(45) NULL,
 PRIMARY KEY (`AdminID`),
 CONSTRAINT `AdminID`
   FOREIGN KEY (`AdminID`)
   REFERENCES `Internship_Inventory`.`Employee` (`EmployeeID`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Facaulty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Facaulty` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Facaulty` (
 `FacID` VARCHAR(15) NOT NULL,
 `Dept` VARCHAR(45) NULL,
 `Type` VARCHAR(45) NULL,
 PRIMARY KEY (`FacID`),
 CONSTRAINT `FacID`
   FOREIGN KEY (`FacID`)
   REFERENCES `Internship_Inventory`.`Employee` (`EmployeeID`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Student` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Student` (
 `StudentID` VARCHAR(15) NOT NULL,
 `Semester` VARCHAR(45) NULL,
 `Major` VARCHAR(45) NULL,
 `Minor` VARCHAR(45) NULL,
 `GraduationYear` YEAR NULL,
 `EnrollmentYear` YEAR NULL,
 `GPA` DECIMAL NULL,
 PRIMARY KEY (`StudentID`),
 CONSTRAINT `student_id`
   FOREIGN KEY (`StudentID`)
   REFERENCES `Internship_Inventory`.`Person` (`ID`)
   ON DELETE NO ACTION
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Company` ;
CREATE TABLE IF NOT EXISTS `internship_inventory`.`company` (
 `CompanyId` VARCHAR(15) NOT NULL,
 `CompanyName` VARCHAR(45) NULL DEFAULT 'Anonymous',
 `Address` VARCHAR(45) NULL,
 `Cell` VARCHAR(15) NULL DEFAULT NULL,
 `Description` VARCHAR(1000) NULL,
 `Industry` VARCHAR(45) NULL,
 `Email` VARCHAR(45) NULL,
 PRIMARY KEY (`CompanyId`),
 INDEX `industry` USING BTREE (`Industry` ASC),
 UNIQUE INDEX `CompanyId_UNIQUE` (`CompanyId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Skills` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Skills` (
 `SkillID` VARCHAR(15) NOT NULL,
 `SkillDescription` VARCHAR(45) NULL,
 PRIMARY KEY (`SkillID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`InternshipSkill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`InternshipSkill` ;

CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`InternshipSkill` (
 `SkillID` VARCHAR(15) NOT NULL,
 `InternshipID` VARCHAR(15) NOT NULL,
 PRIMARY KEY (`SkillID`, `InternshipID`),
 INDEX `InternshipID_idx` (`InternshipID` ASC),
 CONSTRAINT `SkillId`
   FOREIGN KEY (`SkillID`)
   REFERENCES `Internship_Inventory`.`Skills` (`SkillID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `InternshipSkill_Internship_InternshipID`
   FOREIGN KEY (`InternshipID`)
   REFERENCES `Internship_Inventory`.`Internship` (`InternshipId`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Internship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Internship` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Internship` (
 `InternshipId` VARCHAR(15) NOT NULL,
 `StartDate` DATE NOT NULL,
 `EndDate` DATE NOT NULL,
 `Location` VARCHAR(20) NULL DEFAULT 'Not Decided',
 `Description` VARCHAR(1000) NULL DEFAULT NULL,
 `HoursPerWeek` INT(11) NOT NULL,
 `NoOfOpenings` INT(11) NOT NULL,
 `Title` VARCHAR(45) NOT NULL,
 `PaidYorN` VARCHAR(15) NOT NULL,
 `CompanyID` VARCHAR(15) NOT NULL,
 PRIMARY KEY (`InternshipId`),
 INDEX `CompanyID_idx` (`CompanyID` ASC),
 UNIQUE INDEX `InternshipId_UNIQUE` (`InternshipId` ASC),
INDEX `title` (`Title` ASC),
 CONSTRAINT `Internship_Company_CompanyID`
   FOREIGN KEY (`CompanyID`)
   REFERENCES `Internship_Inventory`.`Company` (`CompanyId`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Application` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Application` (
 `ApplicationID` VARCHAR(15) NOT NULL,
 `HireOrNot` int NOT NULL DEFAULT 3,
 `StudentID` VARCHAR(15) NOT NULL,
 `InternshipID` VARCHAR(15) NOT NULL,
 PRIMARY KEY (`ApplicationID`),
 UNIQUE INDEX `ApplicationID_UNIQUE` (`ApplicationID` ASC),
 INDEX `studentNo_idx` (`StudentID` ASC),
 INDEX `InternshipIDs_idx` (`InternshipID` ASC),
  CONSTRAINT `login_enum_HireOrNot`
   FOREIGN KEY (`HireOrNot`)
   REFERENCES `internship_inventory`.`enum` (`enumID`) ,
 CONSTRAINT `Application_Student_studentId`
   FOREIGN KEY (`StudentID`)
   REFERENCES `Internship_Inventory`.`Student` (`StudentID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `Application_Internship_InternshipId`
   FOREIGN KEY (`InternshipID`)
   REFERENCES `Internship_Inventory`.`Internship` (`InternshipId`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Supervisor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Supervisor` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Supervisor` (
 `SupervisorID` VARCHAR(15) NOT NULL,
 `Name` VARCHAR(45) NOT NULL,
 `Email` VARCHAR(45) NOT NULL,
 `WorkPhone` VARCHAR(15) NULL,
 `OfficeAddress` VARCHAR(90) NULL,
 `CompanyID` VARCHAR(90) NOT NULL,
 PRIMARY KEY (`SupervisorID`),
 INDEX `CompanyID_idx` (`CompanyID` ASC),
 CONSTRAINT `Company_ID`
   FOREIGN KEY (`CompanyID`)
   REFERENCES `Internship_Inventory`.`Company` (`CompanyId`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Placement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Placement` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Placement` (
 `PlacementID` VARCHAR(15) NOT NULL,
 `SupervisorID` VARCHAR(15) NOT NULL DEFAULT 'ToAssign',
 `Notes` VARCHAR(45) NULL,
 PRIMARY KEY (`PlacementID`),
 INDEX `SupervisorID_idx` (`SupervisorID` ASC),
 CONSTRAINT `Placement_Appliction_PlacementID`
   FOREIGN KEY (`PlacementID`)
   REFERENCES `Internship_Inventory`.`Application` (`ApplicationID`)
   ON DELETE CASCADE
   ON UPDATE CASCADE,
 CONSTRAINT `Placement_Supervisor_Supervisor_ID`
   FOREIGN KEY (`SupervisorID`)
   REFERENCES `Internship_Inventory`.`Supervisor` (`SupervisorID`)
   ON DELETE NO ACTION
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Paperwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Paperwork` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Paperwork` (
 `PlacementId` VARCHAR(15) NOT NULL,
 `StudentEvaluation` ENUM('GOOD', 'BAD', 'EXCELLENT') NOT NULL,
 `SupervisorEvaluation` ENUM('GOOD', 'BAD', 'EXCELLENT') NOT NULL,
 `CompanyInfo` VARCHAR(90) NULL,
 `StudentInfo` VARCHAR(90) NULL,
 PRIMARY KEY (`PlacementId`),
 UNIQUE INDEX `PlacementId_UNIQUE` (`PlacementId` ASC),
 CONSTRAINT `Placement_IDx`
   FOREIGN KEY (`PlacementId`)
   REFERENCES `Internship_Inventory`.`Placement` (`PlacementID`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`PaidIntern`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`PaidIntern` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`PaidIntern` (
 `InternshipID` VARCHAR(15) NOT NULL,
 `TotalSalary` DOUBLE NULL,
 `WorkType` VARCHAR(45) NULL,
 PRIMARY KEY (`InternshipID`),
 UNIQUE INDEX `InternshipID_UNIQUE` (`InternshipID` ASC),
 CONSTRAINT `InternshipIDx`
   FOREIGN KEY (`InternshipID`)
   REFERENCES `Internship_Inventory`.`Internship` (`InternshipId`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`UnpaidIntern`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`UnpaidIntern` ;
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`UnpaidIntern` (
 `InternshipID` VARCHAR(15) NOT NULL,
 `AcademicCredit` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`InternshipID`),
 UNIQUE INDEX `InternshipID_UNIQUE` (`InternshipID` ASC),
 CONSTRAINT `Internship_IDx`
   FOREIGN KEY (`InternshipID`)
   REFERENCES `Internship_Inventory`.`Internship` (`InternshipId`)
   ON DELETE CASCADE
   ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Internship_Inventory`.`enum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `internship_inventory`.`enum` ;
CREATE TABLE IF NOT EXISTS `internship_inventory`.`enum` (
`enumId` int NOT NULL,
`content` VARCHAR(100) NOT NULL,
PRIMARY KEY (`enumId`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Data for table `internship_inventory`.`enum`
-- Here need to insert first incase some value will be use later
-- -----------------------------------------------------
START TRANSACTION;
USE `internship_inventory`;
# for enum 'HireOrNot' in Table Application
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('10', 'No');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('11', 'Yes');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('12', 'Pending');
# for enum 'access_rights' in Table login
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('14', 'ADMIN');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('15', 'USER');
# for enum 'security_question' in Table login
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('17', 'What is your first movie?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('18', 'What is your first pet\'s name?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('19', 'In what year was your 1father born?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('20', 'Where were you New Year\'s 2000?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('21', 'Who is your childhood hero? ');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('22', 'What is the make and model of your first car?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('23', 'WWhat is your favorite sport in high school?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('24', 'What school did you attend for sixth grade?');
INSERT INTO `internship_inventory`.`enum` (`enumID`, `content`) VALUES ('25', 'What is the name of your favorite childhood friend?');
COMMIT;


COMMIT;

USE `Internship_Inventory` ;
-- -----------------------------------------------------
-- Placeholder table for view `Internship_Inventory`.`InternshipDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`InternshipDetails` (`TITLE` INT, `DESCRIPTION` INT, `COMPANYNAME` INT, `NOOFOPENINGS` INT, `INDUSTRY` INT);
-- -----------------------------------------------------
-- procedure computeCredits
-- -----------------------------------------------------
USE `Internship_Inventory`;
DROP procedure IF EXISTS `Internship_Inventory`.`computeCredits`;
DELIMITER $$
USE `Internship_Inventory`$$
CREATE PROCEDURE `computeCredits` ()
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE stdt, endt, hours INT;
   DECLARE id varchar(15);
   DECLARE cur1 CURSOR FOR SELECT
                         	INTERNSHIPID,STARTDATE,ENDDATE,HOURSPERWEEK
                         	
                       	FROM INTERNSHIP
                         	;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
   OPEN cur1;
   read_loop: LOOP
 	FETCH cur1 INTO stdt, endt, hours,id;
   	IF done THEN
     	LEAVE read_loop;
   	END IF;
 	UPDATE unpaidInternship SET credit = hours*(DATEDIFF(enddt,startdt)/7)*0.13
 	WHERE internshipid=id;
   END LOOP;
   CLOSE cur1;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- View-1 `Internship_Inventory`.`InternshipStudent`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`InternshipStudent` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`InternshipStudent`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `InternshipStudent` AS 
select INTE.internshipID, INTE.TITLE, INTE.DESCRIPTION, CO.COMPANYNAME, INTE.NOOFOPENINGS,CO.INDUSTRY 
FROM COMPANY AS CO INNER JOIN INTERNSHIP AS INTE ON INTE.COMPANYID
=CO.COMPANYID; 


-- -----------------------------------------------------
-- View-2 `Internship_Inventory`.`FallPlacement`
-- All placements for a particular time frame-Fall
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`FallPlacement` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`FallPlacement`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `FallPlacement` AS SELECT * FROM Placement
WHERE PlacementID IN (SELECT ApplicationID FROM Application WHERE StudentID IN (SELECT StudentID FROM student WHERE semester='Fall'));

-- -----------------------------------------------------
-- View-3 `Internship_Inventory`.`StudentInfo`
-- All student information
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`StudentInfo` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`StudentInfo`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `StudentInfo` AS
SELECT s.studentID, p.Name, p.cell, p.email, p.address, p.ssn, s.Semester, s.Major, s.Minor, s.GraduationYear, s.EnrollmentYear, s.GPA 
FROM person p
RIGHT JOIN student s on p.ID=s.studentID;

-- -----------------------------------------------------
-- View-4 `Internship_Inventory`.`CompanyInfo`
-- All company information including internship thry provide
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`CompanyInfo` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`CompanyInfo`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `CompanyInfo` AS
SELECT c.companyid, c.companyname, c.address, c.cell, c.description,c.email, industry, i.title, internshipid, noofopenings
FROM company c
LEFT JOIN internship i ON c.companyid=i.companyid;

-- -----------------------------------------------------
-- View-5 `Internship_Inventory`.`SupervisorEvaluation`
-- Supervisor's evaluation for company to review
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`SupervisorEvaluation` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`SupervisorEvaluation`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `SupervisorEvaluation` AS
SELECT placement.placementid, person.name as 'student name', internship.title, semester, companyname, supervisor.supervisorid, supervisor.name as 'supervisor name', supervisorevaluation
FROM placement, person, internship, company,paperwork, supervisor, application, student
WHERE supervisorevaluation IS NOT NULL AND placement.placementid=application.applicationID AND application.studentID=student.studentID AND student.studentID=person.ID AND
application.internshipID=internship.internshipID AND internship.companyID=company.companyID AND
placement.placementID=paperwork.placementID AND placement.supervisorID=supervisor.name 
GROUP BY companyname;

-- -----------------------------------------------------
-- View-6 `Internship_Inventory`.`StudentEvaluation`
-- Student's evaluation on their completed internship
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`StudentEvaluation` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`StudentEvaluation`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `StudentEvaluation` AS
SELECT companyname, title, semester, person.name, studentevaluation
FROM company, internship, student, person, paperwork,placement,application
WHERE studentevaluation IS NOT NULL AND paperwork.placementID=placement.placementid AND placement.placementID=application.applicationID AND
application.studentID=student.studentID AND student.studentID=person.ID AND
application.internshipID=internship.internshipID AND internship.companyID=company.companyID
GROUP BY companyname;


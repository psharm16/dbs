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
CREATE SCHEMA IF NOT EXISTS `Internship_Inventory` DEFAULT CHARACTER SET utf8 ;
USE `Internship_Inventory` ;

-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Login` ;

CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Login` (
  `LoginId` VARCHAR(35) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Security_Question` ENUM('FIRST MOVIE') NOT NULL,
  `Security_Answer` VARCHAR(45) NOT NULL,
  `Access_Rights` ENUM('ADMIN', 'USER') NOT NULL,
  PRIMARY KEY (`LoginId`),
  UNIQUE INDEX `LoginId_UNIQUE` (`LoginId` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Person` ;

CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Person` (
  `ID` VARCHAR(15) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Cell` INT(10) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `SSN` INT(9) NULL,
  `LoginID` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  INDEX `LoginID_idx` (`LoginID` ASC),
  CONSTRAINT `LoginID`
    FOREIGN KEY (`LoginID`)
    REFERENCES `Internship_Inventory`.`Login` (`LoginId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Company` ;

CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Company` (
  `CompanyId` VARCHAR(15) NOT NULL,
  `CompanyName` VARCHAR(45) NOT NULL DEFAULT 'Anonymous',
  `Address` VARCHAR(45) NOT NULL,
  `Cell` INT(10) NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Industry` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CompanyId`))
#  FULLTEXT INDEX `fulltextsearchIdx` USING BTREE (`CompanyName` ASC, `Industry` ASC))
ENGINE = InnoDB;


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
  `Description` VARCHAR(90) NULL,
  `HoursPerWeek` INT NOT NULL,
  `NoOfOpenings` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `PaidYorN` TINYINT(0) NOT NULL,
  `CompanyID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`InternshipId`),
  INDEX `CompanyID_idx` (`CompanyID` ASC),
  UNIQUE INDEX `InternshipId_UNIQUE` (`InternshipId` ASC),
#  FULLTEXT INDEX `fulltextsearch` USING BTREE (`StartDate` ASC, `Location` ASC, `Description` ASC, `Title` ASC, `PaidYorN` ASC),
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
  `ApplicationID` INT NOT NULL AUTO_INCREMENT,
  `HireOrNot` ENUM('pending', 'yes', 'no') NOT NULL DEFAULT 'pending',
  `StudentID` VARCHAR(15) NOT NULL,
  `InternshipID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ApplicationID`),
  UNIQUE INDEX `applicationID_UNIQUE` (`ApplicationID` ASC),
  INDEX `studentNo_idx` (`StudentID` ASC),
  INDEX `InternshipIDs_idx` (`InternshipID` ASC),
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
  `WorkPhone` INT(10) NULL,
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
  `PlacementID` INT NOT NULL,
  `SupervisorID` VARCHAR(15) NOT NULL DEFAULT 'ToAssign',
  `Notes` VARCHAR(45) NULL,
  PRIMARY KEY (`PlacementID`),
  INDEX `SupervisorID_idx` (`SupervisorID` ASC),
  CONSTRAINT `Placement_Appliction_PlacementID`
    FOREIGN KEY (`PlacementID`)
    REFERENCES `Internship_Inventory`.`Application` (`ApplicationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Supervisor_ID`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `Internship_Inventory`.`Supervisor` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Internship_Inventory`.`Paperwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Internship_Inventory`.`Paperwork` ;

CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`Paperwork` (
  `PlacementId` INT NOT NULL,
  `StudentEvaluation` ENUM('GOOD', 'BAD', 'EXCELLENT') NOT NULL,
  `SupervisorEvaluation` ENUM('GOOD', 'BAD', 'EXCELLENT') NOT NULL,
  `CompanyInfo` VARCHAR(90) NULL,
  `StudentInfo` VARCHAR(90) NULL,
  PRIMARY KEY (`PlacementId`),
  UNIQUE INDEX `PlacementId_UNIQUE` (`PlacementId` ASC),
  CONSTRAINT `Placement_IDx`
    FOREIGN KEY (`PlacementId`)
    REFERENCES `Internship_Inventory`.`Placement` (`PlacementID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Internship_Inventory` ;

-- -----------------------------------------------------
-- Placeholder table for view `Internship_Inventory`.`IntershipDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Internship_Inventory`.`IntershipDetails` (`TITLE` INT, `DESCRIPTION` INT, `COMPANYNAME` INT, `NOOFOPENINGS` INT, `INDUSTRY` INT);

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
-- View `Internship_Inventory`.`IntershipDetails`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `Internship_Inventory`.`IntershipDetails` ;
DROP TABLE IF EXISTS `Internship_Inventory`.`IntershipDetails`;
USE `Internship_Inventory`;
CREATE  OR REPLACE VIEW `IntershipDetails` AS select INTE.TITLE, INTE.DESCRIPTION, CO.COMPANYNAME,
INTE.NOOFOPENINGS,CO.INDUSTRY FROM COMPANY AS CO INNER JOIN INTERNSHIP AS INTE ON INTE.COMPANYID
=CO.COMPANYID;
USE `Internship_Inventory`;

DELIMITER $$

USE `Internship_Inventory`$$
DROP TRIGGER IF EXISTS `Internship_Inventory`.`Person_AFTER_INSERT` $$
USE `Internship_Inventory`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Internship_Inventory`.`Person_AFTER_INSERT` AFTER INSERT ON `Person` FOR EACH ROW
BEGIN
update person set loginid = SUBSTRING_INDEX(`old`.`email`, '@', 1);
END$$


USE `Internship_Inventory`$$
DROP TRIGGER IF EXISTS `Internship_Inventory`.`Application_AFTER_UPDATE` $$
USE `Internship_Inventory`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Internship_Inventory`.`Application_AFTER_UPDATE` AFTER UPDATE ON `Application` FOR EACH ROW
BEGIN
if `old`.`hiredornot` = `HIRED` THEN
insert into paperwork (placementid) values (old.placementid);
end if;
END$$


USE `Internship_Inventory`$$
DROP TRIGGER IF EXISTS `Internship_Inventory`.`Placement_AFTER_UPDATE` $$
USE `Internship_Inventory`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Internship_Inventory`.`Placement_AFTER_UPDATE` AFTER UPDATE ON `Placement` FOR EACH ROW
BEGIN
insert into paperwork (placementid) values (old.placementid);
END$$


USE `Internship_Inventory`$$
DROP TRIGGER IF EXISTS `Internship_Inventory`.`Administrator_BEFORE_INSERT` $$
USE `Internship_Inventory`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Internship_Inventory`.`Administrator_BEFORE_INSERT` BEFORE INSERT ON `Administrator` FOR EACH ROW
BEGIN

END
$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

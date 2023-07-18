-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonCoursera
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonCoursera` ;

-- -----------------------------------------------------
-- Schema LittleLemonCoursera
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonCoursera` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonCoursera` ;

-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Booking` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Booking` (
  `BookingID` VARCHAR(20) NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Customer` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Customer` (
  `CustomerID` VARCHAR(20) NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `CountryCode` VARCHAR(2) NULL,
  `Customercol` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Menu` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Menu` (
  `MenuID` VARCHAR(20) NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `CuisineName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DesertName` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Sides` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Delivery` (
  `DeliveryID` VARCHAR(20) NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryCost` DECIMAL NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Staff` (
  `StaffID` VARCHAR(20) NOT NULL,
  `StafffName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonCoursera`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonCoursera`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonCoursera`.`Orders` (
  `OrderID` VARCHAR(20) NOT NULL,
  `BookingID` VARCHAR(20) NOT NULL,
  `MenuID` VARCHAR(20) NOT NULL,
  `CustomerID` VARCHAR(20) NOT NULL,
  `DeliveryID` VARCHAR(20) NOT NULL,
  `StaffID` VARCHAR(20) NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL NOT NULL,
  `Sales` DECIMAL NOT NULL,
  `Discount` DECIMAL NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Booking_idx` (`BookingID` ASC) INVISIBLE,
  INDEX `fk_Orders_Customer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_Menu_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_Orders_Delivery_idx` (`DeliveryID` ASC) INVISIBLE,
  INDEX `fk_Orders_Staff_idx` (`StaffID` ASC) INVISIBLE,
  CONSTRAINT `fk_Orders_Booking`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonCoursera`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonCoursera`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menu`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonCoursera`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonCoursera`.`Delivery` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonCoursera`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

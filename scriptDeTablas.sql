-- MySQL Script generated by MySQL Workbench
-- Tue Mar  9 11:51:44 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Progra_Web
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Progra_Web
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Progra_Web` DEFAULT CHARACTER SET utf8 ;
USE `Progra_Web` ;

-- -----------------------------------------------------
-- Table `Progra_Web`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`Status` (
  `Status_date` DATE NOT NULL,
  `Status_status` BIT NOT NULL,
  `Status_idUser` INT NOT NULL,
  PRIMARY KEY (`Status_idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`AbyU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`AbyU` (
  `AbyU_counter` INT NOT NULL AUTO_INCREMENT,
  `AbyU_idUser` INT NOT NULL,
  `AbyU_idAnswer` INT NOT NULL,
  `AbyU_delete` BIT NOT NULL,
  PRIMARY KEY (`AbyU_counter`),
  UNIQUE INDEX `AbyU_idUser_UNIQUE` (`AbyU_idUser` ASC) VISIBLE,
  UNIQUE INDEX `AbyU_idAnswer_UNIQUE` (`AbyU_idAnswer` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`QbyU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`QbyU` (
  `QbyU_counter` INT NOT NULL AUTO_INCREMENT,
  `QbyU_idUser` INT NOT NULL,
  `QbyU_idQuestion` INT NOT NULL,
  `QbyU_delete` BIT NOT NULL,
  PRIMARY KEY (`QbyU_counter`),
  UNIQUE INDEX `QbyU_idUser_UNIQUE` (`QbyU_idUser` ASC) VISIBLE,
  UNIQUE INDEX `QbyU_idQuestion_UNIQUE` (`QbyU_idQuestion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`User` (
  `User_id` INT NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(50) NOT NULL,
  `User_lastName` VARCHAR(50) NOT NULL,
  `User_email` VARCHAR(50) NOT NULL,
  `User_image` TEXT(10) NOT NULL,
  `User_user` VARCHAR(45) NOT NULL,
  `User_pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`User_id`),
  INDEX `User` (`User_user` ASC) INVISIBLE,
  INDEX `Name` (`User_name` ASC, `User_lastName` ASC) VISIBLE,
  CONSTRAINT `User_Status`
    FOREIGN KEY (`User_id`)
    REFERENCES `Progra_Web`.`Status` (`Status_idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_AbyU`
    FOREIGN KEY (`User_id`)
    REFERENCES `Progra_Web`.`AbyU` (`AbyU_idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_QbyU`
    FOREIGN KEY (`User_id`)
    REFERENCES `Progra_Web`.`QbyU` (`QbyU_idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`Answer` (
  `Answer_id` INT NOT NULL AUTO_INCREMENT,
  `Answer_answer` TEXT(10) NOT NULL,
  `Answer_picture` TEXT(10) NULL,
  `Answer_useful` INT NOT NULL,
  `Answer_useless` INT NOT NULL,
  `Answer_edited` BIT NOT NULL,
  `Answer_correct` BIT NOT NULL,
  PRIMARY KEY (`Answer_id`),
  CONSTRAINT `Answer_AbyU`
    FOREIGN KEY (`Answer_id`)
    REFERENCES `Progra_Web`.`AbyU` (`AbyU_idAnswer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`Categories` (
  `Categories_id` INT NOT NULL AUTO_INCREMENT,
  `Categories_text` TEXT(10) NOT NULL,
  PRIMARY KEY (`Categories_id`),
  FULLTEXT INDEX `Categories` (`Categories_text`) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Progra_Web`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Progra_Web`.`Question` (
  `QUestion_id` INT NOT NULL AUTO_INCREMENT,
  `Question_categoryId` INT NOT NULL,
  `Question_description` TEXT(10) NOT NULL,
  `Question_image` TEXT(10) NULL,
  `Question_date` DATE NOT NULL,
  `Question_useful` INT NULL,
  `Question_useless` INT NULL,
  `Question_favorite` INT NULL,
  `Question_edited` BIT NULL,
  PRIMARY KEY (`QUestion_id`),
  INDEX `Question_Categories_idx` (`Question_categoryId` ASC) VISIBLE,
  FULLTEXT INDEX `Question` (`Question_description`) VISIBLE,
  CONSTRAINT `Question_QbyU`
    FOREIGN KEY (`QUestion_id`)
    REFERENCES `Progra_Web`.`QbyU` (`QbyU_idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Question_Categories`
    FOREIGN KEY (`Question_categoryId`)
    REFERENCES `Progra_Web`.`Categories` (`Categories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SHOW TABLES;
Describe user;



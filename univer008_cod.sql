-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema univer_Lisitsa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema univer_Lisitsa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `univer_Lisitsa` DEFAULT CHARACTER SET utf8 ;
USE `univer_Lisitsa` ;

-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`director` (
  `#director` INT NOT NULL AUTO_INCREMENT,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`#director`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`director` (
  `#director` INT NOT NULL AUTO_INCREMENT,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`#director`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`group` (
  `#gr` CHAR(10) NOT NULL,
  `napr` MEDIUMTEXT NOT NULL,
  `profil` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`#gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`student` (
  `#stud` INT NOT NULL,
  `studname` VARCHAR(45) NOT NULL,
  `director_#director` INT NOT NULL,
  `group_#gr` CHAR(10) NULL,
  PRIMARY KEY (`#stud`),
  INDEX `fk_student_director_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_#gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer_Lisitsa`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer_Lisitsa`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`posts` (
  `postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`employee` (
  `#employee` INT NOT NULL,
  `empname` VARCHAR(45) NOT NULL,
  `director_#director` INT NOT NULL,
  `posts_postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  INDEX `fk_employee_director1_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_employee_posts1_idx` (`posts_postname` ASC) VISIBLE,
  CONSTRAINT `fk_employee_director1`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer_Lisitsa`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_posts1`
    FOREIGN KEY (`posts_postname`)
    REFERENCES `univer_Lisitsa`.`posts` (`postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`subject` (
  `#sabg` INT NOT NULL AUTO_INCREMENT,
  `sabjname` VARCHAR(100) NULL,
  `subjinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`#sabg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`lessontipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`lessontipe` (
  `lessonname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`employee_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`employee_has_subject` (
  `employee_#employee` INT NOT NULL,
  `subject_#sabg` INT NOT NULL,
  PRIMARY KEY (`employee_#employee`, `subject_#sabg`),
  INDEX `fk_employee_has_subject_subject1_idx` (`subject_#sabg` ASC) VISIBLE,
  INDEX `fk_employee_has_subject_employee1_idx` (`employee_#employee` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_subject_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer_Lisitsa`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_subject_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer_Lisitsa`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`schebule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`schebule` (
  `#week` INT NOT NULL,
  `day` CHAR NOT NULL,
  `group_#gr` CHAR(10) NOT NULL,
  `subject_#sabg` INT NOT NULL,
  `lessontipe_lessonname` VARCHAR(20) NOT NULL,
  `#room` CHAR NOT NULL,
  PRIMARY KEY (`#week`, `day`, `group_#gr`, `subject_#sabg`, `lessontipe_lessonname`),
  INDEX `fk_group_has_subject_subject1_idx` (`subject_#sabg` ASC) VISIBLE,
  INDEX `fk_group_has_subject_group1_idx` (`group_#gr` ASC) VISIBLE,
  INDEX `fk_group_has_subject_lessontipe1_idx` (`lessontipe_lessonname` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_subject_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer_Lisitsa`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer_Lisitsa`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_lessontipe1`
    FOREIGN KEY (`lessontipe_lessonname`)
    REFERENCES `univer_Lisitsa`.`lessontipe` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer_Lisitsa`.`vedomost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer_Lisitsa`.`vedomost` (
  `date` DATE NOT NULL,
  `student_#stud` INT NOT NULL,
  `employee_#employee` INT NOT NULL,
  `subject_#sabg` INT NOT NULL,
  `mark` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`date`, `student_#stud`, `employee_#employee`, `subject_#sabg`),
  INDEX `fk_student_has_employee_employee1_idx` (`employee_#employee` ASC) VISIBLE,
  INDEX `fk_student_has_employee_student1_idx` (`student_#stud` ASC) VISIBLE,
  INDEX `fk_student_has_employee_subject1_idx` (`subject_#sabg` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_employee_student1`
    FOREIGN KEY (`student_#stud`)
    REFERENCES `univer_Lisitsa`.`student` (`#stud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer_Lisitsa`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer_Lisitsa`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema univer008
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema univer008
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `univer008` DEFAULT CHARACTER SET utf8 ;
USE `univer008` ;

-- -----------------------------------------------------
-- Table `univer008`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`director` (
  `#director` INT NOT NULL AUTO_INCREMENT,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`#director`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`director` (
  `#director` INT NOT NULL AUTO_INCREMENT,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`#director`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`group` (
  `#gr` CHAR(10) NOT NULL,
  `napr` MEDIUMTEXT NOT NULL,
  `profil` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`#gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`student` (
  `#stud` INT NOT NULL,
  `studname` VARCHAR(45) NOT NULL,
  `director_#director` INT NOT NULL,
  `group_#gr` CHAR(10) NULL,
  PRIMARY KEY (`#stud`),
  INDEX `fk_student_director_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_#gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer008`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer008`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`posts` (
  `postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`employee` (
  `#employee` INT NOT NULL,
  `empname` VARCHAR(45) NOT NULL,
  `director_#director` INT NOT NULL,
  `posts_postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  INDEX `fk_employee_director1_idx` (`director_#director` ASC) VISIBLE,
  INDEX `fk_employee_posts1_idx` (`posts_postname` ASC) VISIBLE,
  CONSTRAINT `fk_employee_director1`
    FOREIGN KEY (`director_#director`)
    REFERENCES `univer008`.`director` (`#director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_posts1`
    FOREIGN KEY (`posts_postname`)
    REFERENCES `univer008`.`posts` (`postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`subject` (
  `#sabg` INT NOT NULL AUTO_INCREMENT,
  `sabjname` VARCHAR(100) NULL,
  `subjinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`#sabg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`lessontipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`lessontipe` (
  `lessonname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`employee_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`employee_has_subject` (
  `employee_#employee` INT NOT NULL,
  `subject_#sabg` INT NOT NULL,
  PRIMARY KEY (`employee_#employee`, `subject_#sabg`),
  INDEX `fk_employee_has_subject_subject1_idx` (`subject_#sabg` ASC) VISIBLE,
  INDEX `fk_employee_has_subject_employee1_idx` (`employee_#employee` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_subject_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer008`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_subject_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer008`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`schebule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`schebule` (
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
    REFERENCES `univer008`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer008`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_lessontipe1`
    FOREIGN KEY (`lessontipe_lessonname`)
    REFERENCES `univer008`.`lessontipe` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer008`.`vedomost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer008`.`vedomost` (
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
    REFERENCES `univer008`.`student` (`#stud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_employee1`
    FOREIGN KEY (`employee_#employee`)
    REFERENCES `univer008`.`employee` (`#employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_subject1`
    FOREIGN KEY (`subject_#sabg`)
    REFERENCES `univer008`.`subject` (`#sabg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

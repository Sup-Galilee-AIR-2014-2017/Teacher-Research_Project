-- MySQL Script generated by MySQL Workbench
-- Tue Jan 19 13:34:44 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema a5186601_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema a5186601_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `a5186601_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `a5186601_project` ;

-- -----------------------------------------------------
-- Table `a5186601_project`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`user` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `first_name` VARCHAR(45) NOT NULL COMMENT '',
  `last_name` VARCHAR(45) NOT NULL COMMENT '',
  `age` INT NULL COMMENT '',
  `url_site` VARCHAR(100) NULL COMMENT '',
  `telephone` VARCHAR(45) NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `bureau` VARCHAR(45) NULL COMMENT '',
  `profession` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`projet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`projet` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`projet` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(100) NOT NULL COMMENT '',
  `description` VARCHAR(500) NOT NULL COMMENT '',
  `url` VARCHAR(45) NULL COMMENT '',
  `date_publicaton` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`user_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`user_project` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`user_project` (
  `user_id` INT UNSIGNED NOT NULL COMMENT '',
  `project_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`, `project_id`)  COMMENT '',
  INDEX `fk_user_has_project_project1_idx` (`project_id` ASC)  COMMENT '',
  INDEX `fk_user_has_project_user1_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_user_has_project_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `a5186601_project`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_project_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `a5186601_project`.`projet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`university`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`university` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`university` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `address` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`laboratory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`laboratory` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`laboratory` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `descripition` VARCHAR(500) NULL COMMENT '',
  `university_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `university_id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '',
  INDEX `fk_laboratory_university1_idx` (`university_id` ASC)  COMMENT '',
  CONSTRAINT `fk_laboratory_university1`
    FOREIGN KEY (`university_id`)
    REFERENCES `a5186601_project`.`university` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`team` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`team` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(500) NOT NULL COMMENT '',
  `laboratory_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `laboratory_id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '',
  INDEX `fk_team_laboratory1_idx` (`laboratory_id` ASC)  COMMENT '',
  CONSTRAINT `fk_team_laboratory1`
    FOREIGN KEY (`laboratory_id`)
    REFERENCES `a5186601_project`.`laboratory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`user_team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`user_team` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`user_team` (
  `team_id` INT UNSIGNED NOT NULL COMMENT '',
  `user_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`team_id`, `user_id`)  COMMENT '',
  INDEX `fk_Team_has_user_user1_idx` (`user_id` ASC)  COMMENT '',
  INDEX `fk_Team_has_user_Team1_idx` (`team_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Team_has_user_Team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `a5186601_project`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `a5186601_project`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`publication` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`publication` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  `description` VARCHAR(255) NOT NULL COMMENT '',
  `url` VARCHAR(45) NULL COMMENT '',
  `date_publication` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `a5186601_project`.`user_publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `a5186601_project`.`user_publication` ;

CREATE TABLE IF NOT EXISTS `a5186601_project`.`user_publication` (
  `user_id` INT UNSIGNED NOT NULL COMMENT '',
  `publication_id` INT UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`, `publication_id`)  COMMENT '',
  INDEX `fk_user_has_publication_publication1_idx` (`publication_id` ASC)  COMMENT '',
  INDEX `fk_user_has_publication_user1_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_user_has_publication_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `a5186601_project`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_publication_publication1`
    FOREIGN KEY (`publication_id`)
    REFERENCES `a5186601_project`.`publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `a5186601_project` ;

-- -----------------------------------------------------
-- Placeholder table for view `a5186601_project`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `a5186601_project`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `a5186601_project`.`view1`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `a5186601_project`.`view1` ;
DROP TABLE IF EXISTS `a5186601_project`.`view1`;
USE `a5186601_project`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

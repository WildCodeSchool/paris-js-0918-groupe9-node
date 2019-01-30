-- MySQL Script generated by MySQL Workbench
-- mer. 30 janv. 2019 13:16:04 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema AllSponsored
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AllSponsored
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AllSponsored` DEFAULT CHARACTER SET utf8 ;
USE `AllSponsored` ;

-- -----------------------------------------------------
-- Table `AllSponsored`.`club`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`club` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`club` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(300) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(200) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `url_logo` LONGTEXT NULL DEFAULT NULL,
  `url_logo_vectorized` LONGTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`user` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(80) NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(200) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adress` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `AllSponsored`.`user` (`last_name`, `first_name`, `email`, `status`, `role`, `password`) VALUES ('Lucereau', 'Steven', 'stevens.lucereau@allsponsored.com ', 'active', 'admin', '12345');
-- -----------------------------------------------------
-- Table `AllSponsored`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`project` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `name` VARCHAR(300) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `visual_shirt` VARCHAR(300) NULL DEFAULT NULL,
  `url_summary` LONGTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_project_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_project_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `AllSponsored`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`contract` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`contract` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_id` INT(11) NOT NULL,
  `club_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `url_contract` LONGTEXT NULL DEFAULT NULL,
  `url_signed_contract` LONGTEXT NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `project_id`, `club_id`),
  INDEX `fk_contract_project2_idx` (`project_id` ASC),
  INDEX `fk_contract_club1_idx` (`club_id` ASC),
  CONSTRAINT `fk_contract_club1`
    FOREIGN KEY (`club_id`)
    REFERENCES `AllSponsored`.`club` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contract_project2`
    FOREIGN KEY (`project_id`)
    REFERENCES `AllSponsored`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`action` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`action` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` LONGTEXT NULL DEFAULT NULL,
  `url_image` LONGTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contract_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `contract_id`),
  INDEX `fk_action_contract1_idx` (`contract_id` ASC),
  CONSTRAINT `fk_action_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `AllSponsored`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`product` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`contract_has_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`contract_has_product` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`contract_has_product` (
  `contract_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`contract_id`, `product_id`),
  INDEX `fk_contract_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_contract_has_product_contract1_idx` (`contract_id` ASC),
  CONSTRAINT `fk_contract_has_product_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `AllSponsored`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contract_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `AllSponsored`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`order` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`order` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `delivery_address` VARCHAR(400) NULL DEFAULT NULL,
  `reference` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `tracking_number` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contract_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `contract_id`),
  INDEX `fk_order_contract1_idx` (`contract_id` ASC),
  CONSTRAINT `fk_order_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `AllSponsored`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`order_has_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`order_has_product` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`order_has_product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `order_id`),
  INDEX `fk_product_has_order_order1_idx` (`order_id` ASC),
  INDEX `fk_product_has_order_product1_idx` (`id` ASC),
  CONSTRAINT `fk_product_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `AllSponsored`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`sponsor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`sponsor` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`sponsor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`project_has_sponsor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`project_has_sponsor` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`project_has_sponsor` (
  `project_id` INT(11) NOT NULL,
  `sponsor_id` INT(11) NOT NULL,
  PRIMARY KEY (`project_id`, `sponsor_id`),
  INDEX `fk_project_has_sponsor_sponsor1_idx` (`sponsor_id` ASC),
  INDEX `fk_project_has_sponsor_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_sponsor_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `AllSponsored`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_sponsor_sponsor1`
    FOREIGN KEY (`sponsor_id`)
    REFERENCES `AllSponsored`.`sponsor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`question` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`question` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `question` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`survey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`survey` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`survey` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL,
  `contract_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `contract_id`),
  INDEX `fk_survey_contract1_idx` (`contract_id` ASC),
  CONSTRAINT `fk_survey_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `AllSponsored`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `AllSponsored`.`survey_has_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AllSponsored`.`survey_has_question` ;

CREATE TABLE IF NOT EXISTS `AllSponsored`.`survey_has_question` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `survey_id` INT(11) NOT NULL,
  `question_id` INT(11) NOT NULL,
  `answer` INT(11) NULL DEFAULT NULL,
  `comment` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `survey_id`, `question_id`),
  INDEX `fk_survey_has_question_survey1_idx` (`survey_id` ASC),
  INDEX `fk_survey_has_question_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_survey_has_question_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `AllSponsored`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_survey_has_question_survey1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `AllSponsored`.`survey` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
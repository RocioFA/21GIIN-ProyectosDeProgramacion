-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8 ;
USE `proyecto` ;

-- -----------------------------------------------------
-- Table `proyecto`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`admin` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`admin` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(10) NULL,
  `clave` VARCHAR(8) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`municipio` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`municipio` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(30) NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`convocatoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`convocatoria` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`convocatoria` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `descrip` VARCHAR(2000) NULL,
  `fechaA` TIMESTAMP NOT NULL,
  `fechaC` TIMESTAMP NOT NULL,
  `estado` BINARY(1) NULL,
  `documentos` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`fiscalGeneral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`fiscalGeneral` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`fiscalGeneral` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(10) NULL,
  `clave` VARCHAR(8) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`fiscal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`fiscal` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`fiscal` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(10) NULL,
  `clave` VARCHAR(8) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`cuentadante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`cuentadante` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`cuentadante` (
  `id` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(10) NULL,
  `clave` VARCHAR(8) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`presentaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`presentaciones` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`presentaciones` (
  `id` VARCHAR(45) NOT NULL,
  `fechaP` TIMESTAMP NOT NULL,
  `estado` BINARY(1) NULL,
  `documentos` VARCHAR(2000) NULL,
  `convocatoria_id` VARCHAR(45) NOT NULL,
  `municipio_id` VARCHAR(45) NOT NULL,
  `fiscalGeneral_id` VARCHAR(45) NOT NULL,
  `fiscal_id` VARCHAR(45) NOT NULL,
  `cuentadante_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `convocatoria_id`, `municipio_id`, `fiscalGeneral_id`, `fiscal_id`, `cuentadante_id`),
  INDEX `fk_presentaciones_convocatoria_idx` (`convocatoria_id` ASC),
  INDEX `fk_presentaciones_municipio1_idx` (`municipio_id` ASC),
  INDEX `fk_presentaciones_fiscalGeneral1_idx` (`fiscalGeneral_id` ASC),
  INDEX `fk_presentaciones_fiscal1_idx` (`fiscal_id` ASC),
  INDEX `fk_presentaciones_cuentadante1_idx` (`cuentadante_id` ASC),
  CONSTRAINT `fk_presentaciones_convocatoria`
    FOREIGN KEY (`convocatoria_id`)
    REFERENCES `proyecto`.`convocatoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_municipio1`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `proyecto`.`municipio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_fiscalGeneral1`
    FOREIGN KEY (`fiscalGeneral_id`)
    REFERENCES `proyecto`.`fiscalGeneral` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_fiscal1`
    FOREIGN KEY (`fiscal_id`)
    REFERENCES `proyecto`.`fiscal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_cuentadante1`
    FOREIGN KEY (`cuentadante_id`)
    REFERENCES `proyecto`.`cuentadante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE proyecto;
INSERT INTO `proyecto`.`usuarios` 
(`id`, `nombre`, `clave`, `tipo`) VALUES ('1', 'admin', 'admin', 'superuser');
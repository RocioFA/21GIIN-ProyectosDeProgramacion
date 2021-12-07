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
-- Table `proyecto`.`municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`municipio` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`municipio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`convocatoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`convocatoria` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`convocatoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `descrip` VARCHAR(2000) NULL,
  `fechaA` TIMESTAMP NULL,
  `fechaC` TIMESTAMP NULL,
  `estado` BINARY(1) NULL,
  `documentos` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `proyecto`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `fechaP` TIMESTAMP NULL,
  `estado` BINARY(1) NULL,
  `documentos` VARCHAR(2000) NULL,
  `municipio_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  `convocatoria_id` INT NOT NULL,
  PRIMARY KEY (`id`, `municipio_id`, `usuarios_id`, `convocatoria_id`),
  INDEX `fk_presentaciones_municipio1_idx` (`municipio_id` ASC),
  INDEX `fk_presentaciones_usuarios1_idx` (`usuarios_id` ASC),
  INDEX `fk_presentaciones_convocatoria1_idx` (`convocatoria_id` ASC),
  CONSTRAINT `fk_presentaciones_municipio1`
    FOREIGN KEY (`municipio_id`)
    REFERENCES `proyecto`.`municipio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `proyecto`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentaciones_convocatoria1`
    FOREIGN KEY (`convocatoria_id`)
    REFERENCES `proyecto`.`convocatoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE `proyecto`;
INSERT INTO `usuarios`(`id`, `nombre`, `clave`, `tipo`) VALUES (null,'admin','admin','superusuario');
INSERT INTO `usuarios`(`id`, `nombre`, `clave`, `tipo`) VALUES (null,'Mary','1234','Fiscal General');
INSERT INTO `usuarios`(`id`, `nombre`, `clave`, `tipo`) VALUES (null,'Andrea','1234','Cuentadante');
INSERT INTO `usuarios`(`id`, `nombre`, `clave`, `tipo`) VALUES (null,'Flor','1234','Administrador');
INSERT INTO `usuarios`(`id`, `nombre`, `clave`, `tipo`) VALUES (null,'Tomas','1234','Fiscal');
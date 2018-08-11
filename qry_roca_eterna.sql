CREATE DATABASE RocaEterna;
USE RocaEterna;

CREATE TABLE AreaDeServicio (
  ID int not null auto_increment primary key,
  Nombre varchar(30)
);
CREATE TABLE `Privilegio` (
  `ID` int not null auto_increment Primary Key,
  `ID_AreaDeServicio` int,
  `ID_Privilegio` int not null,
  `Nombre` varchar(30),
  FOREIGN KEY (`ID_AreaDeServicio`) REFERENCES AreaDeServicio(ID)
);
CREATE TABLE `Pais` (
  `ID` int not null primary key,
  `Pais` varchar(30),
  `Nacionalidad` varchar(30)
);
CREATE TABLE `Departamento` (
	`ID` int not null primary key,
    `nombre` varchar(30) not null
);
CREATE TABLE `Municipio` (
	`ID` int not null auto_increment primary key,
    `ID_Departamento` int not null,
    `ID_Municipio` int not null,
    `nombre` varchar(50),
    UNIQUE  KEY (ID_Departamento, ID_Municipio),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID)
);
CREATE TABLE `Colonia` (
	`ID` int not null auto_increment primary key,
    `nombre` varchar(75)
);
CREATE TABLE `Persona` (
  `ID` int not null auto_increment primary key,
  `nombre` varchar(30),
  `apellido` varchar(30),
  `apellido_casada` varchar(30),
  `fecha_nacimeinto` date,
  `fecha_nuevo_nacimiento` date,
  `fecha_bautismo_agua` date,
  `fecha_bautismo_ES` date,
  `fecha_solicitud_membresia` date,
  `fecha_retiro` date,
  `Nacionalidad` int,
  `residencia_depto` int,
  `residencia_municipio` int,
  `residencia_colonia` int,
  `residencia_zona` int,
  `residencia_direccion` varchar(50),
  `DPI` int,
  `ocupacion` varchar(100),
  `email` varchar(100),
  `numero_telefono_casa` int(8),
  `numero_celular` int(8),
  `discipulador` int,
  FOREIGN KEY (`Nacionalidad`) 			REFERENCES Pais(ID),
  FOREIGN KEY (`residencia_depto`) 		REFERENCES Departamento(ID),
  FOREIGN KEY (`residencia_municipio`)	REFERENCES Municipio(ID),
  FOREIGN KEY (`residencia_colonia`)	REFERENCES Colonia(ID)
);
CREATE TABLE `REL_Persona_Privilegio` (
  `ID` int not null auto_increment primary key,
  `ID_Persona` int,
  `ID_Privilegio` int,
  FOREIGN KEY (`ID_Persona`) 	REFERENCES Persona(ID),
  FOREIGN KEY (`ID_Privilegio`)	REFERENCES Privilegio(ID)
);


SELECT * FROM AreaDeServicio;
SELECT * FROM Privilegio;
SELECT * FROM Pais;
SELECT * FROM Departamento;
SELECT * FROM Municipio;
SELECT * FROM Colonia;
SELECT * FROM Persona;

USE Billionaires_LW;
DROP TRIGGER  tr_before_update_comments;
DROP TABLE new_location;

######################################################################################
			-- CREO LOS PRIMEROS DOS TRIGGERS PARA LA TABLA  BILLIONAIRES
#######################################################################################

/*PRIMER TRIGGER RELACIONADO A LOS UPDATES DE LA TABLA BILLIONAIRES */
-- PRIMERO CREO LA TABLA  DONDE VOY A GUARDAR LA INFORMACION QUE VOY A INSERTAR EN EL TRIGGER
CREATE TABLE IF NOT EXISTS updated_fields(
	id INT PRIMARY KEY,
	id_location INT DEFAULT NULL,
	placement INT,
	fullname VARCHAR(60),
	firstName VARCHAR(30),
	lastName VARCHAR(30),
	gender VARCHAR(25),
	age INT,
	DOB DATE,
	birthYear INT,
	birthMonth INT,
	birthDay INT,
	resCountry VARCHAR(50),
	industry VARCHAR(45),
	organization VARCHAR(45),
	status enum('d','u'),
	source VARCHAR(50),
	selfMade tinyint(1),
	finalWorth INT,
	commentary VARCHAR(100),
	fecha_hora DATETIME,
	usuario VARCHAR(60)
);



-- CREO EL TRIGGER DONDE VOY A INSERTAR LOS VALORES VIEJOS DE LA TABLA BILLIONAIRES, UN COMENTARIO, 
-- LA FECHA EN LA QUE FUE MODIFICADO Y EL USUARIO QUE LO MODIFICO
CREATE TRIGGER tr_before_update_comments
BEFORE UPDATE ON billionaires
FOR EACH ROW
INSERT INTO updated_fields VALUES (
	OLD.id,
	OLD.id_location,
	OLD.placement,
	OLD.fullname,
	OLD.firstName, 
	OLD.lastName,
	OLD.gender,
	OLD.age,
	OLD.DOB, 
	OLD.birthYear, 
	OLD.birthMonth, 
	OLD.birthDay, 
	OLD.resCountry, 
	OLD.industry, 
	OLD.organization, 
	OLD.status,
	OLD.source, 
	OLD.selfMade, 
	OLD.finalWorth,
	'Los datos de un billonario han sido modificado',
	NOW(), 
	USER()
    );


-- UPDATE LOS VALORES EN LA TABLA BILLIONAIRES
UPDATE billionaires  SET age = 12 WHERE id=1;


-- SELECCIONO LAS TABLAS  PARA VER SI SE INSERTARON LOS DATOS
SELECT * FROM updated_fields;
SELECT * FROM billionaires;




/*SEGUNDO TRIGGER RELACIONADO A LOS INSERT DE LA TABLA BILLIONAIRES */
-- PRIMERO CREO LA TABLA  DONDE VOY A GUARDAR LA INFORMACION QUE VOY A INSERTAR EN EL TRIGGER
CREATE TABLE IF NOT EXISTS new_billionaire(
	id INT PRIMARY KEY,
	id_location INT DEFAULT NULL,
	placement INT,
	fullname VARCHAR(60),
	firstName VARCHAR(30),
	lastName VARCHAR(30),
	gender VARCHAR(25),
	age INT,
	DOB DATE,
	birthYear INT,
	birthMonth INT,
	birthDay INT,
	resCountry VARCHAR(50),
	industry VARCHAR(45),
	organization VARCHAR(45),
	status enum('d','u'),
	source VARCHAR(50),
	selfMade tinyint(1),
	finalWorth INT,
	commentary VARCHAR(100),
	fecha_hora DATETIME,
	usuario VARCHAR(60)
);


-- CREO EL TRIGGER
-- CREO EL TRIGGER DONDE VOY A INSERTAR LOS VALORES NUEVOS DE LA TABLA BILLIONAIRES, UN COMENTARIO, 
-- LA FECHA EN LA QUE FUE CREADO Y EL USUARIO QUE LO CREO
CREATE TRIGGER tr_after_creation_comments
AFTER INSERT ON billionaires
FOR EACH ROW
INSERT INTO new_billionaire VALUES 
	(NEW.id,
	NEW.id_location,
	NEW.placement,
	NEW.fullname,
	NEW.firstName, 
	NEW.lastName,
	NEW.gender,
	NEW.age,
	NEW.DOB, 
	NEW.birthYear, 
	NEW.birthMonth, 
	NEW.birthDay, 
	NEW.resCountry, 
	NEW.industry, 
	NEW.organization, 
	NEW.status,
	NEW.source, 
	NEW.selfMade, 
	NEW.finalWorth,
	'Se ingreso un nuevo billonario',
	NOW(), 
	USER()
    );



-- INSERTO LOS REGISTROS NUEVOS EN LA TABLA BILLIONAIRES
INSERT INTO billionaires (
	id,
    id_location,
    placement,
    fullname,
    firstName,
    lastName,
    gender,
    age,
    DOB,
    birthYear,
    birthMonth,
    birthDay,
    resCountry,
    industry,
    organization,
    status, 
    source,
    selfMade,
    finalWorth
) VALUES (
	NULL,
    2,
    26,
    'Marcos Galperin',
    'Marcos',
    'Galperin',
    'M',
    52,
    '1971-10-31',
    1971,
    10,
    31,
    'Argentina',
    'Technology',
    'Mercado Libre',
    'd', 
    'MELI',
    1,
    670000
);


-- SELECCIONO LAS TABLAS  PARA VER SI SE INSERTARON LOS DATOS
SELECT * FROM billionaires;
SELECT * FROM new_billionaire;


######################################################################################
			-- CREO LOS PRIMEROS DOS TRIGGERS PARA LA TABLA ECONOMICS
#######################################################################################

/*PRIMER TRIGGER RELACIONADO A LOS INGRESOS DE LA TABLA LOCATIONS */
-- PRIMERO CREO LA TABLA  DONDE VOY A GUARDAR LA INFORMACION QUE VOY A INSERTAR EN EL TRIGGER
CREATE TABLE IF NOT EXISTS new_location(
id INT AUTO_INCREMENT PRIMARY KEY,
citiCountry VARCHAR(50),
state VARCHAR(50),
region VARCHAR(35),
city VARCHAR(60),
latitude DECIMAL(10,6),
longitude DECIMAL(10,6),
commentary VARCHAR(50),
fecha_hora DATETIME,
usuario VARCHAR(60)
);

-- CREO EL TRIGGER DONDE VOY A INSERTAR LOS VALORES NUEVOS DE LA TABLA LOCATIONS, UN COMENTARIO, 
-- LA FECHA EN LA QUE FUE CREADO Y EL USUARIO QUE LO CREO
CREATE TRIGGER tr_after_creation_location
AFTER INSERT ON locations
FOR EACH ROW
INSERT INTO new_location  VALUES(
	NEW.id,
    NEW.citiCountry,
    NEW.state,
    NEW.region,
    NEW.city,
    NEW.latitude,
    NEW.longitude,
    'Se ingreso una nueva locacion',
    NOW(),
    USER()
);

-- INSERTO LOS REGISTROS NUEVOS EN LA TABLA LOCATIONS
INSERT INTO locations(
	id,
	citiCountry, 
	state, 
	region, 
	city, 
	latitude, 
	longitude) 
 VALUES (
	NULL,
   'Argentina',
   'Buenos Aires',
   'South',
   'CABA',
   34.6037,
   58.3816
);

-- SELECCIONO LAS TABLAS  PARA VER SI SE INSERTARON LOS DATOS
SELECT * FROM locations;
SELECT * FROM new_location;




/*SEGUNDO TRIGGER RELACIONADO A LOS DELETES DE LA TABLA LOCATIONS */
-- PRIMERO CREO LA TABLA DONDE VOY A GUARDAR LOS REGISTROS ELIMINADOS
CREATE TABLE IF NOT EXISTS delete_locations(
id INT,
citiCountry VARCHAR(50),
state VARCHAR(50),
region VARCHAR(35),
city VARCHAR(60),
latitude DECIMAL(10,6),
longitude DECIMAL(10,6),
commentary VARCHAR(50),
fecha_hora DATETIME,
usuario VARCHAR(60)
);


-- CREO EL TRIGGER
CREATE TRIGGER tr_after_delete_location
AFTER DELETE ON locations
FOR EACH ROW
INSERT INTO delete_locations
VALUES 
	(OLD.id, 
	OLD.citiCountry, 
	OLD.state, 
	OLD.region, 
	OLD.city, 
	OLD.latitude, 
	OLD.longitude, 
	'se elimina una location', 
	NOW(), 
	USER()
);


-- ELIMINO EL REGISTRO
DELETE FROM locations WHERE id = 681;

-- MUESTRA LOS REGISTROS ELIMINADOS 
SELECT * FROM delete_locations;

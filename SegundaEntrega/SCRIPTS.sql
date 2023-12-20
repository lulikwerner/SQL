###################################################################################
					-- CREO LA BASE DE DATOS
###################################################################################
CREATE DATABASE Billionaires_LW;
USE Billionaires_LW;

###################################################################################
					-- CREO LAS TABLAS
###################################################################################
-- CREO TABLA LOCATIONS
CREATE TABLE IF NOT EXISTS locations(
	ID INT AUTO_INCREMENT,
	citiCountry VARCHAR (50),
	region VARCHAR(35),
	state VARCHAR(50),
	city VARCHAR(60),
	latitude DECIMAL(9,6),
	longitude DECIMAL(9,6),
	PRIMARY KEY (ID)
);

-- CREO TABLA BILLIONAIRES
CREATE TABLE IF NOT EXISTS billionaires (
    ID INT AUTO_INCREMENT,
    ID_location INT NOT NULL,
    placement INT,
    fullname VARCHAR(60) NOT NULL,
    firstName VARCHAR(30),
    lastName VARCHAR(30),
    gender VARCHAR(25),
    age INT,
    DOB DATE,
    BirthYear INT,
    BirthMonth INT,
    BirthDay INT,
    resCountry VARCHAR(50),
    industry VARCHAR (45),
    organization VARCHAR (45),
    status ENUM('d', 'u') DEFAULT 'd',
    source VARCHAR(50),
    selfMade BOOLEAN,
    finalWorth INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_billionaire FOREIGN KEY(ID_location) REFERENCES locations(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA ECONOMICS
CREATE TABLE IF NOT EXISTS economics (
	ID INT AUTO_INCREMENT,
	ID_location INT NOT NULL,
	CPI DECIMAL(3,1),
	CPIChanges DECIMAL(3,1),
    GDP DECIMAL(3,1),
    tertiaryEducation DECIMAL(4,1),
    primaryEducation DECIMAL(3,1),
    lifeExpectancy DECIMAL(3,1),
    population INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_economics_billionaire FOREIGN KEY(ID_location) REFERENCES locations(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA TAXES
CREATE TABLE IF NOT EXISTS taxes(
	ID INT AUTO_INCREMENT,
	ID_economic INT NOT NULL,
    totalTaxRate DECIMAL(3,1),
    taxRevenue DECIMAL(3,1),
	PRIMARY KEY (id),
    CONSTRAINT fk_taxes_economics FOREIGN KEY(ID_economic) REFERENCES economics(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA BUSINESSES
CREATE TABLE IF NOT EXISTS businesses(
	ID INT AUTO_INCREMENT,
	ID_billionaire INT NOT NULL,
    organization VARCHAR(60),
    category VARCHAR(40),
    industry VARCHAR(30),
    title VARCHAR(60),
	PRIMARY KEY (ID),
    CONSTRAINT fk_businesses_billionaire FOREIGN KEY(ID_billionaire) REFERENCES billionaires(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CREO TABLA WEALTHS
CREATE TABLE IF NOT EXISTS wealths(
	ID INT AUTO_INCREMENT,
	ID_business INT NOT NULL,
    industry VARCHAR(30),
    source VARCHAR(50),
	PRIMARY KEY (id),
    CONSTRAINT fk_wealth_business FOREIGN KEY(ID_business) REFERENCES businesses(ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

###################################################################################
					-- CREO LAS VISTAS
###################################################################################
USE Billionaires_LW;
-- CREO LA VISTA Billionaires_USA (BILLONARIOS QUE VIVEN EN USA)
CREATE VIEW Billionaires_USA AS 
SELECT 
id, 
id_location, 
firstName, 
lastName, 
gender, 
age, 
resCountry
FROM billionaires
WHERE resCountry = 'United States';

-- LA UTILICE PARA BORRAR UNA VISTA
DROP VIEW Tax_Economics;

-- CREO LA VISTA Billionaires_rest (BILLONARIOS QUE NO VIVEN EN USA)
CREATE VIEW Billionaires_rest AS 
SELECT 
id,
id_location, 
firstName, 
lastName, 
gender, 
age, 
resCountry
FROM billionaires
WHERE resCountry <> 'United States';

-- CREO LA VISTA GDP_Rich (MUESTRA LA RELACION ENTRE EL GDP/PBI Y EL SELFWORTH DEL BILLONARIO QUE VIVE ALLI)
CREATE VIEW GDP_Rich AS 
SELECT DISTINCT 
b.id, 
b.id_location,
b.firstName,
b.lastName,
b.gender,
b.age,
b.resCountry,
b.finalWorth,
e.GDP
FROM billionaires b
JOIN economics e ON b.id_location = e.id_location;

-- CREO LA VISTA Business_Billionaire (RELACION ENTRE TIPO DE NEGOCIO Y BILLONARIO)
CREATE VIEW Business_Billionaire  AS 
SELECT DISTINCT   
b.id AS businessrank,
b.firstName,
b.lastName,
b.gender,
b.age,
b.resCountry,
b.finalWorth,
b.selfMade,
bu.organization,
bu.industry
FROM billionaires b
JOIN businesses bu ON b.id = bu.id_Billionaire;

-- CREO LA VISTA Wealth_Billionaire (RELACION ENTRE TIPO DE NEGOCIO, BILLONARIO Y FUENTE DE RIQUEZA)
CREATE VIEW Wealth_Billionaire AS 
SELECT DISTINCT   
bu.id AS billionaire_id,
b.firstName AS billionaire_firstName,
b.lastName AS billionaire_lastName,
bu.title,
bu.organization,
bu.category,
bu.industry,
w.source
FROM businesses bu
JOIN wealths w ON bu.id = w.id_business
JOIN billionaires b ON bu.id_billionaire = b.id;

-- CREO LA VISTA Tax_Economics (RELACION ENTRE IMPUESTOS, LOCACION Y FACTORES ECONOMICOS )
CREATE VIEW Tax_Economics AS 
SELECT DISTINCT   
l.citiCountry,
l.city,
t.totalTaxRate,
t.taxRevenue,
e.CPI,
e.CPIChanges,
e.GDP,
e.tertiaryEducation,
e.primaryEducation,
e.lifeExpectancy,
e.population
FROM economics e
JOIN taxes t ON e.id = t.id_economic
JOIN locations l ON l.id = e.id_location;

###################################################################################
					-- CREO LAS FUNCIONES
###################################################################################

/*CREO LA PRIMERA FUNCION*/


-- CREO UNA FUNCION QUE ME VA A MOSTRAR LA CANTIDAD DE BILLONARIOS POR PAIS
DELIMITER $$
CREATE FUNCTION f_get_Billionaires_Distribution(country VARCHAR(60)) RETURNS VARCHAR(60)
READS SQL DATA
BEGIN
	DECLARE total_countries INT;

    SET total_countries = (
        SELECT COUNT( citiCountry) 
        FROM locations l
        WHERE l.citiCountry = country
    );
    -- Return the count of distinct citiCountry values
    RETURN total_countries;
END $$ 
DELIMITER 

-- LE PASO PARAMETROS PARA TESTEAR LA FUNCION
SELECT f_get_Billionaires_Distribution('ARGENTINA');

/*CREO LA SEGUNDA FUNCION*/

-- CREO UNA FUNCION PARA BUSCAR SI EL BILLONARIO SE ENCUENTRA EN EL TOP 10 DEL RANK
DELIMITER $$
CREATE FUNCTION f_top_ten(first_name VARCHAR(50), last_name VARCHAR(50)) RETURNS BOOLEAN
READS SQL DATA
BEGIN
	DECLARE exist_in_top_ten BOOLEAN;
    
  SET exist_in_top_ten = (
        SELECT COUNT(*)
        FROM billionaires b
        WHERE b.firstName = first_name AND b.lastName = last_name 
	AND b.finalWorth >= (
            SELECT MIN(finalWorth)
            FROM (
                SELECT finalWorth
                FROM billionaires
                ORDER BY finalWorth DESC
                LIMIT 10
            ) AS top_10
          )
    ) > 0;
    RETURN exist_in_top_ten;
END $$ 
DELIMITER 

-- LE PASO PARAMETROS PARA TESTEAR LA FUNCION
SElECT f_top_ten('MICHAEL','DELL');
SElECT f_top_ten('ELON','MUSK');
SElECT f_top_ten('LUIS','MUSK');

###################################################################################
					-- CREO LAS FUNCIONES
###################################################################################

/*CREO EL PRIMER STORED PROCEDURE. DONDE ORDENO POR ASC O DESC*/

  -- CREO EL STORED PROCEDURE PARA QUE SE ORDENE LA TABLA EN ASC O DESC
	DELIMITER $$
    CREATE PROCEDURE sp_order_table (IN tableName VARCHAR(30),IN field VARCHAR(30), in sort varchar(4))
    BEGIN
    -- VERIFICAMOS SI EL PARAMETRO DE ORDEN ES  VALIDO
    IF (sort<> 'ASC' AND sort <> 'DESC') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL PARAMETRO DEBE SER ASC O DESC';
    ELSE
    -- CONSTRUYO Y EJECUTO LA CONSULTA
    SET @sort = CONCAT('SELECT * FROM ', tableName, ' ORDER BY ', field, ' ', sort);
    END IF;
    PREPARE quest FROM @sort;
    EXECUTE quest;
    -- LIMPIO EL QUEST
    DEALLOCATE PREPARE quest;
    END
    $$
    DELIMITER
    
    -- HAGO LAS PRUEBAS DONDE UTILIZO EL STORED PROCEDURE
    
    -- EN EL PRIMER CASO VA A TIRAR MENSAJE DE ERROR
    call SP_ORDER_TABLE('billionaires','fullName','not');alter
    -- EN EL SEGUNDO CASO VA A ORDENAR LA COLUMNA ORGANIZATION DE LA TABLA BUSINESSES DE FORMA DESC
    call SP_ORDER_TABLE('businesses','organization', 'desc');
	-- EN EL TERCER CASO VA A ORDENAR LA COLUMNA FULLNAME DE LA TABLA BILLIONAIRES DE FORMA ASC
    CALL sp_order_table('billionaires', 'fullName', 'ASC');
    
    
/*CREO EL SEGUNDO STORED PROCEDURE. DONDE PUEDO INGRESAR O ELIMINAR DATOS DE LAS TABLAS*/
DELIMITER //
CREATE PROCEDURE sp_insert_or_delete_data(
    IN actionChosen VARCHAR(10),
    IN tableName VARCHAR(30),
    IN id INT,
    IN field1 VARCHAR(50),
    IN dataInsert VARCHAR(100)
)
BEGIN
-- CREO UN CONDICIONAL SI ELIJE DE ACTIONCHOSEN INSERT 
 IF actionChosen = 'INSERT' THEN 
        -- INSERTAR DATOS EN LA TABLA. CREO UN UNICO STATEMENT CONCATENANDOLO. LE DIGO QUE
        -- EN LA TABLENAME QUE ENVIO QUE INSERTE EN EL ID Y EL FIELD 1 LOS VALUES QUE LE VOY A PASAR
        SET @T1 = CONCAT('INSERT INTO ', tableName, ' (id, ', field1, ') VALUES (?, ?)');
        -- PREPARO EL STATEMENT PARA EJECUTARLO
        PREPARE param_stmt FROM @T1;
        -- SETEO LAS VARIABLES ID Y DATAINSERTE
        SET @id = id;
        SET @dataInsert = dataInsert;
        -- EJECUTO EL STATEMENT  USANDO LAS VARIABLES DECLARADAS
        EXECUTE param_stmt USING @id, @dataInsert;
        -- LIMPIO EL STATEMENT
        DEALLOCATE PREPARE param_stmt;
        
  -- SI ELIJE COMO ACTIONCHOSEN DELETE
  ELSEIF actionChosen = 'DELETE' THEN
        -- DELETE DATOS EN LA TABLA.CREO UN UNICO STATEMENT CONCATENANDOLO.
        -- DONDE LE PASO ELTABLENAME Y DONDE EL ID VA A SER EL QUE LE ENVIE
        SET @T1 = CONCAT('DELETE FROM ', tableName, ' WHERE id = ?');
         -- PREPARO EL STATEMENT PARA EJECUTARLO
        PREPARE param_stmt FROM @T1;
        -- SETEO LAS VARIABLE ID
        SET @id = id;
        -- EJECUTO EL STATEMENT  USANDO LA VARIABLE DECLARADA
        EXECUTE param_stmt USING @id;
		-- LIMPIO EL STATEMENT
        DEALLOCATE PREPARE param_stmt;
   -- SI EL ACTION CHOSEN ES DISTINTO DE DELETE O INSERT TIRO MENSAJE DE ERROR     
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INGRESE UNA ACCION VALIDA. LA ACCION DEBE SER INSERT O DELETE.';
    END IF;
END //
DELIMITER ;


	-- HAGO LAS PRUEBAS DONDE UTILIZO EL STORED PROCEDURE

	-- EN EL PRIMER CASO VA A INSERTAR DE LA TABLA LOCATIONS EN LA COLUMNA CITICOUNTRY EL ID 50 EL VALUE VALOR 
   CALL sp_insert_or_delete_data('insert', 'locations', 50,'citiCountry', 'valor');
	-- EN EL SEGUNDO CASO VA A DELETE DE LA TABLA LOCATIONS LA FILA CON EL ID 50
   CALL sp_insert_or_delete_data('delete', 'locations', 50, NULL,NULL);
	-- EN EL TERCER CASO VA A A PASAR UN ACTIONCHOSEN NO VALIDO Y LE VA A TIRAR MENSAJE DE ERROR
   CALL sp_insert_or_delete_data('otra', 'locations', 50, NULL,NULL);
   
###################################################################################
					-- CREO LOS TRIGGERS
###################################################################################
/* CREO LOS PRIMEROS DOS TRIGGERS PARA LA TABLA  BILLIONAIRES*/

/*PRIMER TRIGGER RELACIONADO A LOS UPDATES DE LA TABLA BILLIONAIRES */
-- PRIMERO CREO LA TABLA  DONDE VOY A GUARDAR LA INFORMACION QUE VOY A INSERTAR EN EL TRIGGER
CREATE TABLE IF NOT EXISTS updated_fields(
	id INT AUTO_INCREMENT PRIMARY KEY,
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
	date_time DATETIME,
	user VARCHAR(60)
);


-- CREO EL TRIGGER DONDE VOY A INSERTAR LOS VALORES VIEJOS DE LA TABLA BILLIONAIRES, UN COMENTARIO, 
-- LA FECHA EN LA QUE FUE MODIFICADO Y EL USUARIO QUE LO MODIFICO
CREATE TRIGGER tr_before_update_comments
BEFORE UPDATE ON billionaires
FOR EACH ROW
INSERT INTO updated_fields(
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
    finalWorth,
    commentary,
    date_time,
    user
)	VALUES (
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
UPDATE billionaires  SET age = 12 WHERE id=30;


-- SELECCIONO LAS TABLAS  PARA VER SI SE INSERTARON LOS DATOS
SELECT * FROM updated_fields;
SELECT * FROM billionaires;




/*SEGUNDO TRIGGER RELACIONADO A LOS INSERT DE LA TABLA BILLIONAIRES */

-- CREO EL TRIGGER
-- CREO EL TRIGGER DONDE VOY A INSERTAR LOS VALORES NUEVOS DE LA TABLA BILLIONAIRES, UN COMENTARIO, 
-- LA FECHA EN LA QUE FUE CREADO Y EL USUARIO QUE LO CREO. VOY A AGUARDAR LA INFO EN LA TABLA UPDATED FIELDS
CREATE TRIGGER tr_after_creation_comments
AFTER INSERT ON billionaires
FOR EACH ROW
INSERT INTO updated_fields VALUES 
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
SELECT * FROM updated_fields;


/*CREO LOS PRIMEROS DOS TRIGGERS PARA LA TABLA LOCATIONS*/


/*PRIMER TRIGGER RELACIONADO A LOS INGRESOS DE LA TABLA LOCATIONS */
-- PRIMERO CREO LA TABLA  DONDE VOY A GUARDAR LA INFORMACION QUE VOY A INSERTAR EN EL TRIGGER
CREATE TABLE IF NOT EXISTS updated_location(
id INT AUTO_INCREMENT PRIMARY KEY,
old_id INT,
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
INSERT INTO updated_location VALUES(
	NEW.id,
    NULL,
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
SELECT * FROM updated_location;




/*SEGUNDO TRIGGER RELACIONADO A LOS DELETES DE LA TABLA LOCATIONS */
-- PRIMERO CREO LA TABLA DONDE VOY A GUARDAR LOS REGISTROS ELIMINADOS


-- CREO EL TRIGGER
CREATE TRIGGER tr_after_delete_location
AFTER DELETE ON locations
FOR EACH ROW
INSERT INTO updated_location
VALUES 
	(NULL,
    OLD.id, 
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
DELETE FROM locations WHERE id = 695;

-- MUESTRA LOS REGISTROS ELIMINADOS 
SELECT * FROM updated_location;

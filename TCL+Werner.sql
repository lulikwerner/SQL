/* Elige dos tablas de las presentadas en tu proyecto. Realizarás una serie de modificaciones
 en los registros, controladas por transacciones.
 1. En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
 2. Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.Si eliminas registros importantes, deja comentadas las sentencias para re-insertarlos.
*/

-- SETEO LA VARIABLE AUTOCOMMIT EN 0 ASI PUEDO HACER EL ROLLBACK
SELECT @@autocommit;
SET @@autocommit=0;

USE Billionaires_LW;
SELECT * FROM billionaires;

-- INICIALIZO LA PRIMERA TRANSACCION PARA REALIZAR UN BORRADO Y DESPUES PODES DESHACER LOS CAMBIOS O GUARDARLOS
-- EN LA TABLA BILLIONAIRES

START TRANSACTION;
DELETE FROM billionaires WHERE id >= 31;

-- DESHACE LOS CAMBIOS DEL DELETE
-- ROLLBACK; 
-- GUARDA LOS CAMBIOS DEFINITIVAMENTE
COMMIT; 



 /* 
 3. En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 
 4. Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
 5. Agrega en una línea comentada la sentencia de eliminación del savepoint de los primeros 4 registros insertados.
 */

SELECT * FROM businesses;
-- COMIENZO LA TRANSACCION
START TRANSACTION;

-- REALIZO LAS PRIMERAS CUATRO INSERCIONES EN LA TABLA BUSINESSES
INSERT INTO businesses (id_billionaire, organization, category, industry, title) VALUES 
    (1, 'LV', 'Fashion & Retail', 'Fashion & Retail', 'CEO'),
    (5, 'Adidas', 'Fashion & Retail', 'Fashion & Retail', 'CFO'),
    (8, 'Telecom', 'Technology', 'Technology', 'Founder'),
    (12, 'Alpha', 'Technology', 'Technology',  'CEO');

-- REALIZO EL PRIMER SAVEPOINT
SAVEPOINT savepoint_1;

-- REALIZO LAS SIGUIENTES 4 INSERCIONES EN LA TABLA BUSINESSES
INSERT INTO businesses (id_billionaire, organization, category, industry, title) VALUES
	(15, 'BurgerKing', 'Food', 'Food', 'CEO'),
    (18, 'Zuribu', 'Fashion & Retail', 'Fashion & Retail', 'CoFounder'),
    (20, 'SuperWalmart', 'Fashion & Retail', 'Fashion & Retail', 'Founder'),
    (23, 'DellInspire', 'Technology', 'Technology',  'CEO');

-- REALIZO EL SEGUNDO SAVEPOINT
SAVEPOINT savepoint_2;

-- MUESTRO TODA LA TABLA DE BUSINESSES
SELECT * FROM businesses;

-- VUELVO HACIA ATRAS HASTA EL SAVEPOINT 1
ROLLBACK TO  savepoint_1;

-- VUELVO HACIA ANTES DE CREAR EL PRIMER SAVEPOINT
--  ROLLBACK;
 
 -- BORRO EL SAVEPOINT_1
 -- RELEASE SAVEPOINT savepoint_1;

-- Guardo los cambios
COMMIT;



############################################################################################
								-- CON CONDICIONAL
############################################################################################
DELIMITER //

CREATE PROCEDURE DeleteOrInsertBillionaires()
BEGIN
    DECLARE rowCount INT;
    DECLARE isError INT DEFAULT 0; -- SETEO EL ISERROR EN FALSO

    -- EMPIEZO LA TRANSACCION
    START TRANSACTION;

    -- CHEQUEO QUE LA TABLA NO ESTE VACIA
    SELECT COUNT(*) INTO rowCount FROM billionaires;


    -- SI NO ESTA VACIA ENTONCES BORRO LOS ID MAYOR IGUAL A 31
    IF rowCount > 0 THEN
        DELETE FROM billionaires WHERE id >= 31;
    ELSE
        -- SI ESTA VACIA ENTONCES INSERTO UN VALOR
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
        ) 
        VALUES (
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

        -- CUANDO INSERTO VALORES CHEQUEO LOS ERRORES. SI HAY, SETEO EL ISERROR EN VERDADERO
        IF ROW_COUNT() = 0 THEN
            SET isError = 1;
        END IF;
    END IF;

    -- SI OCURRIO UN ERROR ENTONCES HAGO UN ROLLEBACK
    IF isError = 1 THEN
        ROLLBACK;
    ELSE
        -- SI NO HAY NINGUN ERROR ENTONCES HAGO COMMIT 
        COMMIT;
    END IF;
END //

DELIMITER ;


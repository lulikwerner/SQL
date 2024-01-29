###################################################################################
					-- ME PARO EN LA BASE DE DATOS
###################################################################################
USE billionaires_lkw;

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
SELECT f_get_Billionaires_Distribution('UNITED STATES');

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

USE Billionaires_LW;
-- BORRO LOS PROCEDURES POR SI EXISTEN
DROP PROCEDURE  sp_order_table;
DROP PROCEDURE sp_insert_or_delete_data;

###############################################################################
			-- CREO EL PRIMER STORED PROCEDURE. DONDE ORDENO POR ASC O DESC
###############################################################################

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
    
    

###############################################################################
			-- CREO EL SEGUNDO STORED PROCEDURE. DONDE PUEDO INGRESAR 
            -- O ELIMINAR DATOS DE LAS TABLAS
###############################################################################



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
    

    
    






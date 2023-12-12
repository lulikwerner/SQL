USE Billionaires_LW;

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
    call SP_ORDER_TABLE('billionaires','fullName','not');
    call SP_ORDER_TABLE('businesses','organization', 'desc');
    CALL sp_order_table('billionaires', 'fullName', 'ASC');
    
    DROP PROCEDURE sp_insert_or_delete_data;
    

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
 IF actionChosen = 'INSERT' THEN 
        -- INSERTAR DATOS EN LA TABLA 
        SET @T1 = CONCAT('INSERT INTO ', tableName, ' (id, ', field1, ') VALUES (?, ?)');
        PREPARE param_stmt FROM @T1;
        SET @id = id;
        SET @dataInsert = dataInsert;
        EXECUTE param_stmt USING @id, @dataInsert;
        DEALLOCATE PREPARE param_stmt;
        
  ELSEIF actionChosen = 'DELETE' THEN
        -- DELETE DATOS EN LA TABLA 
        SET @T1 = CONCAT('DELETE FROM ', tableName, ' WHERE id = ?');
        PREPARE param_stmt FROM @T1;
        SET @id = id;
        EXECUTE param_stmt USING @id;
        DEALLOCATE PREPARE param_stmt;
        
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INGRESE UNA ACCION VALIDA. LA ACCION DEBE SER INSERT O DELETE.';
    END IF;
END //
DELIMITER ;


    
   CALL sp_insert_or_delete_data('insert', 'locations', 50,'citiCountry', 'valor');
   CALL sp_insert_or_delete_data('delete', 'locations', 50, NULL,NULL);
    

    
    






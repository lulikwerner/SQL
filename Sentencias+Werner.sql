/* 
1.Uno de los usuarios creados debera tener permisos de solo lectura cobre todas las tablas.
2. El otro usuario debera tener permisos de Lectura, Insercion y Modificacion de datos.
3. Ninguno de ellos podra eliminar registros de ninguna tabla.
4. Cada sentencia GRANT y CREATE USER debera estar comentada con lo que realiza la misma
*/

#########################################################################################
					-- CREO EL PRIMER USUARIO
#########################################################################################

-- CREO EL PRIMER USUARIO CON PERMISO DE LECTURA SOBRE TODAS LAS TABLAS.
CREATE USER 'user1@dominio' IDENTIFIED BY '1234';

-- VERIFICAR LOS PERMISOS DE USER user1@dominio
SELECT * FROM mysql.user WHERE user LIKE 'user1@dominio';

-- REVOCO UPDATE, INSERT, DELETE DE LOS PERMISOS DEL USER user1@dominio
REVOKE UPDATE, INSERT, DELETE ON *.* FROM 'user1@dominio';

-- OTORGO PERMISO DE LECTURA SOBRE EL database Billionaires_LW AL USER user1@dominio
GRANT SELECT ON Billionaires_LW.* TO 'user1@dominio';

-- MUESTRO LOS PERMISOS QUE FUERON DADOS AL USER user1@dominio
SHOW GRANTS FOR 'user1@dominio';


#########################################################################################
					-- CREO EL SEGUNDO USUARIO
#########################################################################################


-- CREO EL SEGUNDO USUARIO CON PERMISO DE MODIFICACION, INSERCION Y LECTURA.
CREATE USER 'user2@dominio' IDENTIFIED BY '123';

-- VERIFICAR LOS PERMISOS DE USER user2@dominio
SELECT * FROM mysql.user WHERE user LIKE 'user2@dominio';

-- REVOCO DELETE DE LOS PERMISOS DEL USER user2@dominio
REVOKE DELETE ON *.* FROM 'user2@dominio';

-- OTORGO PERMISO DE LECTURA SOBRE EL database Billionaires_LW AL USER user2@dominio
GRANT SELECT, UPDATE, INSERT ON Billionaires_LW.* TO 'user2@dominio';

-- MUESTRO LOS PERMISOS QUE FUERON DADOS AL USER user2@dominio
SHOW GRANTS FOR 'user2@dominio';

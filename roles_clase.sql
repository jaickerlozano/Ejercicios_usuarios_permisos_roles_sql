/*
	ROLES 
		- Crear el rol
        - dar permisos al rol
        - Asignar el rol a los usuarios
*/


create user 'desa1'@'%' identified by 'password';
create user 'desa2'@'%' identified by 'password';
create user 'desa3'@'%' identified by 'password';


CREATE ROLE DEVELOPMENT;

GRANT SELECT ON ACADEMIA.NOTAS_ALUMNOS TO DEVELOPMENT;


GRANT DEVELOPMENT TO 'desa1'@'%';


SELECT * FROM MYSQL.USER ;


-- DESASINGAR Y BORRAR ROLES

REVOKE SELECT ON  ACADEMIA.NOTAS_ALUMNOS FROM DEVELOPMENT;
SHOW GRANTS FOR DEVELOPMENT;


REVOKE DEVELOPMENT FROM 'desa1'@'%';


DROP ROLE DEVELOPMENT;

-- PRIVILEGIOS Y PERMISOS

/*
	Un privilegio es un permiso que se le puede asignar a un rol o usuario para llevar a cabo algunas operaciones
		- GLOBALES 
        - BASE DE DATOS 
        - TABLA
        - COLUMNA
        - PROCEDIMIENTOS Y FUNCIONES ALMACENADAS 
        
	COMANDOS BÁSICOS
    - GRANT: permite dar permisos a usuarios y roles
    - REVOKE: elimina permisos
    
    ROLES
    Conjunto de permisos
    Facilitar la gestión de permisos
*/

/* PRIVILEGIOS A NIVEL DE TABLA*/

GRANT SELECT ON ACADEMIA.CURSOS TO 'usuario1'@'%';

GRANT UPDATE, INSERT ON ACADEMIA.CURSOS TO 'usuario1'@'%';


/*PRIVILEGIOS A NIVEL GLOBAL Y DE BASE DE DATOS*/

GRANT ALL ON *.* TO 'usuario1'@'%'; -- GLOBAL

GRANT ALL ON academia.* TO 'usuario1'@'%';


/* PRIVILEGIOS A NIVEL DE COLUMNA

GRANT PRIVILEGIO(COL1), PRIVILEGIO(COL1, COL2) ON TABLA TO USUARIO;
*/

GRANT SELECT(NOMBRE, DURACION) ON ACADEMIA.ASIGNATURAS TO 'usuario2'@'%';

DESC ALUMNOS;


GRANT INSERT(COD_ALUMNO, NOMBRE, APELLIDOS) ON ACADEMIA.ALUMNOS TO 'usuario2'@'%';

SELECT * FROM ACADEMIA.ALUMNOS;


GRANT INSERT(COD_ALUMNO, NOMBRE) ON ACADEMIA.ALUMNOS TO 'usuario1'@'%';

SHOW GRANTS FOR 'usuario1'@'%';
SHOW GRANTS FOR 'usuario2'@'%';

SELECT * FROM information_schema.table_privileges WHERE TABLE_NAME = 'asignaturas' and table_schema='academia';

SELECT * FROM information_schema.column_privileges WHERE TABLE_NAME = 'asignaturas' and table_schema='academia';


/*REVOKE - Quitar privilegios


REVOKE PRIVILEGIO ON OBJETO FROM USUARIO;

REVOKE ALL, GRANT OPTION FROM USUARIO;

*/

REVOKE SELECT ON ACADEMIA.CURSOS FROM 'usuario1'@'%';

REVOKE SELECT(DURACION) ON ACADEMIA.ASIGNATURAS FROM 'usuario2'@'%';







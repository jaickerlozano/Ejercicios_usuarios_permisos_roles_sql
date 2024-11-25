/*
USUARIOS, PERMISOS Y ROLES
 Dentro de la base de datos academia:
B. PERMISOS
*/
/*
1. Trabajamos con el usuario “usu1” que hemos creado en el apartado anterior y
 vamos a tener 2 sesiones abiertas, una como usuario de tipo root y el otro con
 el usuario “usu1”. Desde “usu1”, intentar leer la tabla cursos de la base de
 datos “academia”.
*/
select * from mysql.user;
show processlist;
select * from cursos;
/*mysql> select * from cursos;
ERROR 1046 (3D000): No database selected

mysql> use academia;
ERROR 1044 (42000): Access denied for user 'usu1'@'%' to database 'academia'

mysql> select * from academia.cursos;
ERROR 1142 (42000): SELECT command denied to user 'usu1'@'localhost' for table '
cursos'
Me arroja estos errores y es debido a que el usu1 no tiene permisos para acceder a las tablas ni a nada por ahora.
*/

-- 2. Dar permisos de SELECT sobre la tabla al usu1. Comprobar que ahora puede hacer una SELECT.
grant select on academia.cursos to 'usu1'@'%';
-- Ahora si puedo acceder a la tabla de cursos con el usu1

-- 3. Intentar hacer un delete del curso12. En mi caso lo intentaré con el curso13 porque no tengo el curso12 creado.
/*
mysql> delete from academia.cursos where cod_curso=13;
ERROR 1142 (42000): DELETE command denied to user 'usu1'@'localhost' for table '
cursos
Me arroja este error porque el usu1 no tiene permisos para borrar filas de la tabla cursos.
*/

-- 4. Dar permisos para que lo pueda hacer.
grant delete on academia.cursos to 'usu1'@'%';
/*
mysql> delete from academia.cursos where cod_curso=13;
Query OK, 1 row affected (0.03 sec)
Permiso otorgado y fila eliminada por el usu1
*/

-- 5. Dar permisos de SELECT sobre las columnas nombre y apellidos de la tabla
-- ALUMNOSal usuario “usu1” . Comprobar que solo puede leer esas columnas.
grant select(nombre, apellidos) on academia.alumnos to 'usu1'@'%';
/*
mysql> select * from academia.alumnos;
ERROR 1143 (42000): SELECT command denied to user 'usu1'@'localhost' for column
'cod_alumno' in table 'alumnos'
Me aparece el error anterior si intento acceder a todas las columnas de la tabla alumnos.

mysql> select nombre, apellidos from academia.alumnos;
102 rows in set (0.00 sec)
Ahora, si intento acceder solo a la columna nombre y apellidos de la tabla alumnos, si me permite
acceder a su información para visualizarla
*/

-- 6. Comprobar los permisos que tiene usu1.
show grants for 'usu1'@'%';
select * from information_schema.table_privileges where table_schema='academia';

-- 7. Dar todos los permisos sobre la base de datos academia a “usu1”. Comprobar los permisos.
grant all on academia.* to 'usu1'@'%';
show grants for 'usu1'@'%';

-- 8. Ahora, quitar solo el permiso de SELECT sobre la columna nombre de la tabla ALUMNOS. ¿Qué ocurre?
revoke select(nombre) on academia.alumnos from 'usu1'@'%';
show grants for 'usu1'@'%';
-- A pesar de que hemos quitado los permisos para esa columna, aún así, el usu1 puede 
-- consultar esa tabla y esa columna porque tiene all privileges sobre la base de datos academia.

-- Quitamos all privileges
revoke all on academia.* from 'usu1'@'%';
/*
mysql> select nombre from academia.alumnos;
ERROR 1143 (42000): SELECT command denied to user 'usu1'@'localhost' for column
'nombre' in table 'alumnos'
Ahora si hemos quitado todos los permisos sobre academia y ya no puede acceder a la 
columna nombre, solo a las que aun tiene permisos particulares.
*/

show grants for 'usu1'@'%';
/*
Permisos que aún posee usu1
'GRANT USAGE ON *.* TO `usu1`@`%`'
'GRANT SELECT (`apellidos`) ON `academia`.`alumnos` TO `usu1`@`%`'
'GRANT SELECT, DELETE ON `academia`.`cursos` TO `usu1`@`%`'
*/

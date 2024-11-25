/*
USUARIOS, PERMISOS Y ROLES
 Dentro de la base de datos academia:
C. ROLES
*/

-- 1. Crear dos usuarios (‘Test1’@’%’, ‘Test2’@’%’)con la password de vuestra
-- preferencia y comprobar que se han creado.
create user 'test1'@'%' identified by 'password';
create user 'test2'@'%' identified by 'password';

-- 2. Abrir una sesión en el terminal con el usuario Test1 e intentar entrar en la base
-- de datos academia.
/*Desde test1
mysql> use academia;
ERROR 1044 (42000): Access denied for user 'test1'@'%' to database 'academia'
*/

-- 3. Crear un rol llamado: testing
create role testing;

-- 4. Crear el privilegio para hacer SELECT sobre la tabla CURSOS y asignarlo al
-- rol. Visualizar estos permisos.
grant select on academia.cursos to testing;
show grants for testing;

-- 5. Asignar el rol a los usuarios creados.
grant testing to 'test1'@'%';
grant testing to 'test2'@'%';
/*
mysql> select current_role();
+----------------+
| current_role() |
+----------------+
| NONE           |
+----------------+
1 row in set (0.01 sec)
*/

-- 6. Activar los roles y comprobar si se puede acceder a la tabla cursos.
set default role all to 'test1'@'%';
/*
mysql> use academia;
Database changed
*/
/*
mysql> select current_role();
+----------------+
| current_role() |
+----------------+
| `testing`@`%`  |
+----------------+
1 row in set (0.00 sec)
*/
set default role all to 'test2'@'%';

-- 7. Ver los roles existentes.
select * from mysql.user;
select * from mysql.user where authentication_string='' and password_expired='Y' and account_locked='Y';
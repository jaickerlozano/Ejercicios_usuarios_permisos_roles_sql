/*
 USUARIOS, PERMISOS Y ROLES
 Dentro de la base de datos academia:
 A. USUARIOS
*/
/*
 1. Conectarse desde el usuario root desde el terminal. Crear un usuario llamado
 “usu1” que pueda conectarse desde cualquier host. Comprobar después que
 el usuario se ha creado correctamente.
*/
use academia;
create user 'usu1'@'%' identified by 'password';
select * from mysql.user;

-- COMANDO PARA VER USUARIOS CONECTADOS
show processlist;

-- 2. Abrir una segunda sesión de mysql y conectarnos con el usuario recién creado.
/*
Listo!! pude ingresar. Desde mi caso, estoy utilizando la git bash ya que se me hace más fácil utilizar esta terminal
que la cmd de windows porque al ser una terminal unix se puede utilizar los mismos comando de ubuntu y se facilita mucho
el poder trabajar con ella.alter
Para ingresar a mysql con la git bash, debemos colocar "winpty mysql -u usuario -p"" donde usuario iría el usuario que desea
ingresar. En este caso, ingresamos con usu1.
*/

-- 3. Crear un usuario llamado “usu2” sin ningún host asociado. Comprobar que se
-- ha creado correctamente. ¿Qué host le ha puesto por defecto?
create user 'usu2' identified by 'password';
select * from mysql.user;

/*
El usuario fue creado de todas formas y, como no se le colocó ningún host, automáticamente al crearse el sistema 
le coloca % como host por defecto, lo que le permite poder conectarse desde cualquier host.
*/

-- 4. Cambiar la password al usu1.
set password for 'usu1'@'%' = 'prueba';

-- 5. Cambia de diferente forma la password al usu2.
alter user 'usu2'@'%' identified by 'prueba';

-- 6. Borra el usu2.
drop user 'usu2'@'%';
select * from mysql.user;



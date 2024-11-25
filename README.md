## Usuarios

- En este repositorio estoy practicando la creación de usuarios, permisos y roles que se le pueden dar a un usuario en mysql. Este script tiene información
importante que se debe tener en cuenta la hora de trabajar con la creación de usuarios, permisos y roles. Mi intención es ir actualizando este script
cada vez que encuentre algo importante que debamos saber para mejorar nuestros códigos en esta sección.
  
- Tenemos este comando --> show processlist; para ver los usuarios conectados
  
- Con este comando --> select * from mysql.user; podemos ver los usuarios del sistema y mucha más información de estos.
  
- Cuando creamos un usuario, si no le asignamos un host, el sistema al crear el usuario le asigna por defecto el símbolo de % que le da permiso para 
conectarse desde cualquier host.

## Permisos

- Se puede cambiar la clave de un usuario de dos formas: 1) set password for 'usuario'@'host' = 'new_password'; 2) alter user 'usuario'@'host' identified by 'new_password';

- Para ver los permisos que tiene un usuario, podemos utilizar el siguiente comando --> show grants for usuario; con este comando podemos ver permisos por usuario.
  
- Los privilegios que tienen los usuarios también los podemos ver con los siguientes códigos:

SELECT * FROM information_schema.table_privileges WHERE TABLE_NAME = 'asignaturas' and table_schema='academia';

SELECT * FROM information_schema.column_privileges WHERE TABLE_NAME = 'asignaturas' and table_schema='academia';

Con el primer código podemos ver la información de los privilegios que tienen los usuarios a nivel de tablas, mientras en el segundo código, podemos ver los privilegios que
tienen los usuarios a nivel de columnas.

- Debemos tener en cuenta que si un usuario tiene permisos para particulares en una tabla, y luego se le otorga persimos globales de toda la base de datos, aunque luego le
quitemos los permisos particulares, si no se le quita los permisos globales, él puede seguir accediendo a estos permisos particulares a pesar de que se los hayamos quitado.
Se le debe retirar los permisos globales para que los permisos revocados tengan efectos.

## Roles

- En los roles, debemos tener en cuenta que siempre que creemos un rol y se lo asignemos a un usuario, no basta con que solo se asigne, también debemos activarlo, de lo contrario,
no vamos a poder hacer nada con el usuario.

Los roles se activan con el comando: set default role all to usuario;

- Con el comando "current_role();" podemos ver que rol tenemos asignado en nuestro usuario.

## Notas:
- Podemos acceder a mysql desde cualquier terminal. Sin embargo, trabajar desde la terminal de windows no siempre es la mejor opción, ya que esta terminal no es tan friendly
como lo puede ser ubuntu, o una terminal de linux. En mi caso, para no trabajar con una terminal de wsl, que puede ser una buena opción para trabajar con terminales ubuntu en
windows, utilizo más bien la terminal de git, que sería git bash. Es una terminal que me permite trabajar en el entorno windows pero con una experiencia similar a la de Unix.

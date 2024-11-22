- En este repositorio estoy practicando la creación de usuarios, permisos y roles que se le pueden dar a un usuario en mysql.
- Tenemos este comando --> show processlist; para ver los usuarios conectados
- Con este comando --> select * from mysql.user; podemos ver los usuarios del sistema y mucha más información de estos.
- Cuando creamos un usuario, si no le asignamos un host, el sistema al crear el usuario le asigna por defecto el símbolo de % que le da permiso para 
conectarse desde cualquier host.
- Se puede cambiar la clave de un usuario de dos formas: 1) set password for 'usuario'@'host' = 'new_password'; 2) alter user 'usuario'@'host' identified by 'new_password';

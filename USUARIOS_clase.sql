/*
	CREACIÓN DE USUARIO
    
		usuario@host
        'usuario'@'host'
        
        'usuario1'@'190.168.10.1'
        'usuario1'@'190.168.10.12'
        
        'usuario'@'%' -- permite conectar desde cualquier maquina
        'usuario'@'190.168.10.%' -- Permite conectar con un rango de direcciones IP
        
        CREATE USER USUARIO IDENTIFIED BY 'PASSWORD';
*/

CREATE USER 'USER1'@'%' IDENTIFIED BY 'prueba';

CREATE USER 'USER2'@'190.168.10.12' IDENTIFIED BY 'prueba';

select * from mysql.user;

SET PASSWORD FOR 'USER1'@'%' = 'password';
-- SET PASSWORD FOR 'USER1'@'%' = PASSWORD('password');
ALTER USER 'USER1'@'%' IDENTIFIED BY 'prueba2';













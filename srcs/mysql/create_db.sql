CREATE DATABASE wordpress;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
USE wordpress;
FLUSH PRIVILEGES;
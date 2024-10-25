CREATE DATABASE bd2_clientes_1e;
use bd2_clientes_1e;

CREATE TABLE tbl_clientes2(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
sexo CHAR(1) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(15) NOT NULL,
endereco VARCHAR(255) NOT NULL
);

INSERT INTO tbl_clientes2(nome,idade,sexo,email,telefone,endereco)
VALUES("HuanPablo",19,"M","HuanPablo@Hotmail.com",1599999999,"Rua do HuanPablo"),
	  ("Smague",14,"M","Smague@Hotmail.com",1588888888,"Rua do Smague"),
      ("Dimas",16,"M","Dimas@Hotmail.com",1577777777,"Rua do Dimas"),
      ("Vitoria",22,"F","Vitoria@Hotmail.com",1566666666,"Rua do Vitoria");
      
SELECT * FROM tbl_clientes2;

DELIMITER $$
CREATE PROCEDURE sp_maiores_de_18_anos(IN idadem INT)
BEGIN
	IF idadem >= 18 THEN
		SELECT * FROM tbl_clientes2 WHERE idade >=18;
    ELSEIF idadem < 18 THEN
		SELECT * FROM tbl_clientes2 WHERE idade < 18;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE sp_maiores_de_18_anos;

CALL sp_maiores_de_18_anos (22);

CALL sp_maiores_de_18_anos (14);
	
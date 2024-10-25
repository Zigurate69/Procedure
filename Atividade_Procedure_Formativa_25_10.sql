CREATE DATABASE bd_clientes_1e; #DDL
use bd_clientes_1e;

CREATE TABLE tbl_clientes( #DDL
codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
sexo CHAR(1) NOT NULL
);

INSERT INTO tbl_clientes(nome,sexo) #DML
VALUES("Humberto","M"),("Ayrton Senna","M"),("Xuxa","F");

SELECT * FROM tbl_clientes; #DML

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN
	IF opcao = 0 THEN
		SELECT * FROM tbl_clientes WHERE sexo = 'F';
    ELSEIF opcao = 1 THEN
		SELECT * FROM tbl_clientes WHERE sexo = 'M';
    ELSE
		SELECT * FROM tbl_clientes;
    END IF;
END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

#Lista sexo Feminino:
CALL sp_lista_clientes(0);

#Lista sexo Masculino:
CALL sp_lista_clientes(1);

#Lista todos:
CALL sp_lista_clientes(2);

#EXEMPLO 2 STORED PROCEDURE
DELIMITER $$

CREATE PROCEDURE sp_busca_cliente_por_nome(IN nome_parcial VARCHAR(100))
BEGIN
	SELECT * FROM tbl_clientes
    WHERE nome LIKE CONCAT('%', nome_parcial, '%');
END $$
DELIMITER ;

CALL sp_busca_cliente_por_nome('Ayrton'); -- Retorna o cliente 'Ayrton Senna'   
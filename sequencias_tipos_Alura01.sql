CREATE SEQUENCE eu_criei;
SELECT CURRVAL('eu_criei');
SELECT NEXTVAL('eu_criei');

DROP TABLE auto;
CREATE TEMPORARY TABLE auto (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('eu_criei'),
	nome VARCHAR(30) NOT NULL);

INSERT INTO auto (nome)
VALUES ('Vinicius Dias');
INSERT INTO auto (id, nome)
VALUES (8, 'Vinicius Dias');
INSERT INTO auto (nome)
VALUES ('Outro nome');
SELECT * FROM auto;
----------------------------------------------------------
CREATE TYPE CLASSIFICACAO AS ENUM ('LIVRE', '12_ANOS', '16_ANOS', '18_ANOS')
CREATE TEMPORARY TABLE filme (
	id serial PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	classificacao CLASSIFICACAO);
	
INSERT INTO filme (nome, classificacao) 
VALUES('Um filme qualquer', '18_ANOS')
SELECT * FROM filme;
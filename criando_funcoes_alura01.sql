CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
	SELECT (5 - 3) * 2 ' LANGUAGE SQL;
	
SELECT * FROM primeira_funcao() AS numero

DROP FUNCTION soma_dois_numeros;
CREATE FUNCTION soma_dois_numeros(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS '
	SELECT numero_1 + numero_2;
' LANGUAGE SQL;

--CREATE FUNCTION soma_dois_numeros(INTEGER,INTEGER) RETURNS INTEGER AS '
--	SELECT $1 + $2;
--' LANGUAGE SQL;

SELECT soma_dois_numeros(2, 2)
-------------------------------------------------------------------------------------------------
CREATE TABLE a(nome VARCHAR(255) NOT NULL);
DROP FUNCTION cria_a
CREATE OR REPLACE FUNCTION cria_a(nome VARCHAR) RETURNS VOID AS $$
	INSERT INTO a (nome) VALUES (cria_a.nome);
$$ LANGUAGE SQL;

SELECT cria_a('Vinicius Dias')
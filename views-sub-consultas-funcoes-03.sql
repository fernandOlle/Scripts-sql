SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo
FROM
	aluno;
	
SELECT
	CONCAT('Vinicius', NULL, ' ', 'Dias') AS "Concatenar strings, espaços em brancos e ignorar NULL";

SELECT
	UPPER(CONCAT('Vinicius', NULL, ' ', 'Dias')) AS "UPPER deixa tudo maiusculo";

SELECT
	TRIM(UPPER(CONCAT(' ', 'Vinicius', NULL, ' ', 'Dias', ' '))) AS "Trim Remove espaço do inicio e do fim";

-- SELECT
--	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
--		(now()::DATE - data_nascimento) / 365 AS idade         Existe uma função AGE(DATANASCIMENTO) para calcular a data de nascimento
--	FROM
--	aluno;
SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
-- EXTRACT (YEAR FROM AGE()) para extrair apenas os anos da função AGE que retorna os anos, meses e dias
FROM
	aluno;

SELECT pi(); --função valor pi
SELECT @ -15163215161; -- @ devolve o valor absoluto

-- função TO_CHAR(  , )converte o que for passado por parametro no formato passado por parametro
SELECT TO_CHAR (NOW(), 'DD/MM/YYYY');
SELECT TO_CHAR (NOW(), 'DD, MONTH, YYYY');
SELECT TO_CHAR(128.3::REAL, '999D99');



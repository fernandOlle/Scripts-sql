--Apostila 5
-- Exercicio 1
SELECT LOCALTIMESTAMP;
-- ou 
SELECT now() ;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 2
SELECT
	EXTRACT (dow FROM now()) AS dia,
SELECT	to_char(CURRENT_TIMESTAMP, 'Day') AS "Nome do Dia"
	
SELECT CASE EXTRACT (dow FROM now())
	WHEN 1 THEN 'Segunda'
	WHEN 2 THEN 'Terça'
	WHEN 3 THEN 'Quarta'
	WHEN 4 THEN 'Quinta'
	WHEN 5 THEN 'Sexta'
	WHEN 6 THEN 'Sabado'
	WHEN 7 THEN 'Domingo'
END AS dia;

SELECT CASE
WHEN EXTRACT (dow FROM now()) = 1 THEN 'Segunda'
WHEN EXTRACT (dow FROM now()) = 2 THEN 'Terça'
WHEN EXTRACT (dow FROM now()) = 3 THEN 'Quarta'
WHEN EXTRACT (dow FROM now()) = 4 THEN 'Quinta'
WHEN EXTRACT (dow FROM now()) = 5 THEN 'Sexta'
WHEN EXTRACT (dow FROM now()) = 6 THEN 'Sabado'
WHEN EXTRACT (dow FROM now()) = 7 THEN 'Domingo'
END AS dia;

-- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
SELECT
	funcionario.cod AS "Cod. Funcionário",
	funcionario.nome AS "Nome",
	funcionario.salario AS "Salário",
	CEIL(funcionario.salario * 1.15) AS "Salário Atualizado"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 4
SELECT
	funcionario.cod AS "Cod. Funcionário",
	funcionario.nome AS "Nome",
	funcionario.salario AS "Salário",
	CEIL(funcionario.salario * 1.15) AS "Salário Atualizado",
	ABS(funcionario.salario - (funcionario.salario * 1.15)) AS "Diferença do Salário"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 5
SELECT
	funcionario.nome AS "Nome",
	TO_CHAR(funcionario.dt_contratacao, 'DD/MM/YYYY') AS "Data Admissão",
	TO_CHAR(dt_contratacao + INTERVAL '6 months', 'DD/MM/YYYY') AS "Data Efetivação"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 6
SELECT funcionario.nome AS nome, EXTRACT(YEAR FROM age(now(), funcionario.dt_contratacao)) * 12 AS diferenca 
FROM funcionario 
ORDER BY 2 DESC;

-- -----------------------------------------------------------------------------------------------------
-- Exercicio 7
SELECT
	('O ' || 
	INITCAP(funcionario.nome) || 
	' recebe R$ ' || 
	funcionario.salario || 
	' mensalmente, mas deseja receber ' 
	|| funcionario.salario * 4) AS "Sonho"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 8
SELECT
	funcionario.nome AS "Nome",
	INITCAP(SUBSTRING(funcionario.nome FOR 1)) AS "Inicial",
	CHAR_LENGTH(REPLACE(funcionario.nome, ' ', '')) AS "Quantidade de Letras"
FROM
	funcionario
WHERE
	funcionario.nome LIKE 'J%'
	OR
	funcionario.nome LIKE 'M%'
ORDER BY "Quantidade de Letras" DESC;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 9
SELECT
	funcionario.nome AS "Nome",
	TO_CHAR(funcionario.dt_contratacao, 'DD/MM/YYYY') AS "Data de Admissão",
	TO_CHAR(funcionario.dt_contratacao, 'Day') AS "Nome do Dia"
FROM
	funcionario
WHERE
	funcionario.dt_contratacao NOTNULL
ORDER BY
	EXTRACT(dow FROM funcionario.dt_contratacao);
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 10
SELECT
	aluno.nome AS "Nome do Aluno",
	CASE
		WHEN telefone IS NULL THEN 'Sem Telefone'
		ELSE aluno.telefone
	END AS telefone
FROM
	aluno;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 11
SELECT
	funcionario.nome,
	funcionario.salario,
	REPEAT('*', (funcionario.salario / 100)) AS Salario
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 12
SELECT 
	aluno.nome,
	CASE 
		WHEN aluno.idade BETWEEN 0 AND 18 THEN 'Categoria A'
		WHEN aluno.idade BETWEEN 19 AND 30 THEN 'Categoria B'
		WHEN aluno.idade BETWEEN 31 AND 61 THEN 'Categoria C'
		WHEN aluno.idade > 61 THEN 'Categoria D'
		ELSE 'Idade nao informada!'
	END AS "Faixa de Idade"
FROM aluno;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 13
SELECT nome, salario FROM funcionario;
SELECT
	MAX(funcionario.salario) AS "Maior Salario",
	AVG(funcionario.salario) AS "Salario Medio",
	MIN(funcionario.salario) AS "Menor Salario",
	SUM(funcionario.salario) AS "Soma dos Salarios"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 14
SELECT
	MAX(funcionario.salario)::INTEGER AS "Maior Salario",
	AVG(funcionario.salario)::INTEGER AS "Salario Medio",
	MIN(funcionario.salario)::INTEGER AS "Menor Salario",
	SUM(funcionario.salario)::INTEGER AS "Soma dos Salarios"
FROM
	funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 15
SELECT * FROM funcionario;
SELECT 
	COUNT(*) AS "Qtd Funcionarios",
	COUNT(cod_gerente) AS "Qtd gerentes"
FROM funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 16
SELECT
	MAX(funcionario.salario)::INTEGER AS "Máximo",
	AVG(funcionario.salario)::INTEGER AS "Médio",
	MIN(funcionario.salario)::INTEGER AS "Menor",
	SUM(funcionario.salario)::INTEGER AS "Soma"
FROM
	funcionario
GROUP BY funcionario.cargo;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 17
SELECT
	funcionario.cargo,
	COUNT(funcionario.cargo) AS "Numero de funcionarios por cargo"
FROM
	funcionario
GROUP BY
	funcionario.cargo
ORDER BY
	"Numero de funcionarios por cargo" DESC;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 18
SELECT
	funcionario.cod_gerente,
	MIN(funcionario.salario) AS "Menor Pagamento"
FROM
	funcionario
WHERE funcionario.cod_gerente IS NOT NULL 
GROUP BY
	funcionario.cod_gerente;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 19
SELECT * FROM funcionario;
SELECT
	EXTRACT(YEAR FROM funcionario.dt_contratacao) AS "Ano",
	COUNT(funcionario.dt_contratacao) AS "Contratados"
FROM
	funcionario
WHERE
	funcionario.dt_contratacao >= '01-01-2005'
GROUP BY
	funcionario.dt_contratacao;




	



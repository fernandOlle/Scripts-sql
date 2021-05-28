-- -----------------------------------------------------------------------------------------------------
-- Exercicio 1

--Crie uma consulta para exibir o nome e a data de admiss�o de todos os funcion�rios no mesmo departamento que
--Maria, excluindo Maria. (Fa�a de duas formas, uma usando o IN e outra usando EXISTS)
SELECT * FROM funcionario;
SELECT f.nome, f.dt_contratacao
FROM funcionario f
WHERE f.id_departamento IN ( SELECT f2.id_departamento FROM funcionario f2 WHERE UPPER(f2.nome) = 'MARADONA')
AND UPPER(f.nome) != 'MARADONA';
----------------------------------------
SELECT * FROM funcionario
SELECT f.nome, f.dt_contratacao
FROM funcionario f
WHERE EXISTS ( SELECT f2.id_departamento FROM funcionario f2 
WHERE f2.id_departamento = f.id_departamento AND UPPER(f2.nome) = 'MARADONA')
AND UPPER(f.nome) != 'MARADONA';
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 2

--Crie uma consulta para exibir o c�digo e o nome de todos os funcion�rios que recebem mais que o sal�rio m�dio.
--Classifique os resultados, por sal�rio, em ordem decrescente.
SELECT * FROM funcionario;
SELECT f.id_departamento, f.nome, f.salario
FROM funcionario f WHERE salario > ( SELECT AVG(f1.salario) AS "Salario M�dio"
FROM funcionario f1);
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
--Crie uma consulta que exiba o c�digo e o nome de todos os funcion�rios que trabalhem em um departamento,
--onde exista um funcion�rio que possua a letra 'W' no nome.
SELECT * FROM funcionario;
SELECT
	f.id,
	f.nome,
	f.id_departamento
FROM
	funcionario f
WHERE
	EXISTS (
	SELECT
		*
	FROM
		funcionario f2
	WHERE
		f2.id_departamento = f.id_departamento
		AND UPPER(f2.nome) LIKE '%M%');
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 4
--Crie uma consulta para exibir o nome, a data de admiss�o e o sal�rio de todos os funcion�rios que ganhem mais
--que a m�dia de sal�rio de todos os departamentos
SELECT * FROM departamento 
SELECT
	f.nome AS "Nome",
	f.dt_contratacao AS "Data de Admiss�o",
	f.salario AS "Sal�rio"
FROM
	funcionario f
WHERE
	f.salario > (
	SELECT
		AVG(f2.salario)
	FROM
		funcionario f2);
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 5
--Selecione todos os gerentes que possuem efetivamente subordinados
SELECT * FROM funcionario;
SELECT
	*
FROM
	funcionario f
WHERE
	EXISTS (
	SELECT
		*
	FROM
		funcionario f2
	WHERE
		f2.cod_gerente = f.id);
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 6
--Selecione todos os colegas de 'MARIA' em todas as disciplinas que ela esta matriculada, de acordo com a
--�matricula� realizada na tabela aluno_disciplina. (Fa�a de duas formas, uma usando o IN e outra usando EXISTS)
SELECT DISTINCT a.nome
FROM aluno a JOIN aluno_disciplina ON a.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON disciplina.id = aluno_disciplina.id_disciplina
WHERE disciplina.id IN (
SELECT disciplina.id
FROM aluno JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON disciplina.id = aluno_disciplina.id_disciplina
WHERE UPPER(aluno.nome) = 'CARA TEC') AND UPPER(a.nome) != 'CARA TEC';
-------------------------------------------------------
SELECT DISTINCT a1.nome
FROM aluno a1 JOIN aluno_disciplina AS ad1 ON a1.matricula = ad1.id_matricula
JOIN disciplina ON disciplina.id = ad1.id_disciplina
WHERE EXISTS (
SELECT 0
FROM aluno a2 JOIN aluno_disciplina AS ad2 ON a2.matricula = ad2.id_matricula
JOIN disciplina ON disciplina.id = ad2.id_disciplina
WHERE UPPER(a2.nome) = 'CARA TEC' AND ad2.id_disciplina = ad1.id_disciplina) AND UPPER(a1.nome) != 'CARA TEC';



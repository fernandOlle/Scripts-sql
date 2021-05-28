-- Exercicio 1
SELECT
	funcionario.nome,
	departamento.id,
	departamento.sigla
FROM
	funcionario
JOIN departamento ON
	departamento.id = funcionario.id_departamento;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 2
SELECT
	funcionario.nome,
	funcionario.cargo
FROM funcionario
JOIN departamento ON 
	 departamento.id = funcionario.id_departamento
WHERE departamento.sigla = 'D1';
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
SELECT * FROM aluno;
SELECT
	disciplina.nome AS "Disciplina",
	COUNT(aluno.matricula) AS "Quantidade de Matriculas"
FROM
	aluno
JOIN aluno_disciplina ON
	aluno.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON
	disciplina.id = aluno_disciplina.id_disciplina
GROUP BY disciplina.nome
ORDER BY "Quantidade de Matriculas" DESC;

-- -----------------------------------------------------------------------------------------------------
-- Exercicio 4
SELECT * FROM funcionario f2 ;
SELECT * FROM departamento d2;
SELECT
	funcionario.nome,
	departamento.nome
FROM
	funcionario
JOIN departamento ON
	departamento.id = funcionario.id_departamento
WHERE
	UPPER(funcionario.nome) LIKE '%A%';
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 5
SELECT * FROM funcionario;
ALTER TABLE funcionario ADD COLUMN cidade varchar(255) DEFAULT 'Lugar Nenhum';
UPDATE funcionario SET cidade = 'Mexico' WHERE id = 4;
UPDATE funcionario SET cidade = 'Rio de Janeiro' WHERE id = 3;
UPDATE funcionario SET cidade = 'Pelotas' WHERE id = 1;
UPDATE funcionario SET cidade = 'Pelotas' WHERE id = 5;
SELECT
	funcionario.nome,
	departamento.nome AS nome_departamento,
	funcionario.cidade,
	funcionario.salario
FROM
	funcionario
JOIN departamento ON
	departamento.id = funcionario.id_departamento
WHERE
	UPPER(funcionario.cidade) = 'RIO DE JANEIRO' AND funcionario.salario >= 1500.00;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 6
SELECT * FROM aluno;
SELECT
	aluno.nome,
	SUM(disciplina.carga_horaria) AS "Horas totais das disciplinas matriculadas"
FROM
	aluno
JOIN aluno_disciplina ON
	aluno.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON
	disciplina.id = aluno_disciplina.id_disciplina
GROUP BY
	aluno.nome
ORDER BY
	aluno.nome;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 7
SELECT * FROM funcionario f2 
UPDATE funcionario SET salario = 1800.00 WHERE funcionario.id = 1;
SELECT
	departamento.nome AS "Departamento",
	departamento.sigla,
	COUNT(funcionario.id) AS "Qtd Funcionarios",
	TO_CHAR(AVG(funcionario.salario), 'L9G999G990D99') AS "Media"
FROM
	funcionario
JOIN departamento ON
	departamento.id = funcionario.id_departamento
WHERE departamento.nome IS NOT NULL
GROUP BY
	departamento.nome, departamento.sigla
ORDER BY 
	2;

-- -----------------------------------------------------------------------------------------------------
-- Exercicio 8
SELECT
	aluno.nome,
	sum(disciplina.carga_horaria) AS "Horas das disciplinas matriculadas"
FROM
	aluno
JOIN aluno_disciplina ON
	aluno.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON
	disciplina.id  = aluno_disciplina.id_disciplina
GROUP BY aluno.nome
ORDER BY "Horas das disciplinas matriculadas" DESC;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 9
CREATE TABLE categoria_salario (
	cod SERIAL PRIMARY KEY,
	menor NUMERIC(12,2),
	maior NUMERIC(12,2),
	categoria CHAR(1))
INSERT INTO categoria_salario(menor, maior, categoria)
	VALUES (450.00, 999.00, 'A'),
		   (1000.00, 1999.99, 'B'),
		   (2000.00, 2999.99, 'C'),
		   (3000.00, 3999.99, 'D'),
		   (4000.00, 4999.99, 'E'),
		   (5000.00, 999999.00, 'F');
		  
SELECT
	categoria_salario.categoria,
	COUNT(categoria_salario.cod) AS "Qtd p/faixa"
FROM
	funcionario,
	categoria_salario
WHERE
	funcionario.salario BETWEEN categoria_salario.menor AND categoria_salario.maior
GROUP BY
	categoria_salario.categoria;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 10
DROP TABLE faixaNivel;
CREATE TABLE faixa_nivel (
	id SERIAL PRIMARY KEY,
	idade_min INTEGER,
	idade_max INTEGER,
	categoria char(1)
	)
INSERT INTO faixa_nivel(idade_min, idade_max, categoria)
	VALUES (15, 20, 'A'),
		   (21, 24, 'B'),
		   (25, 30, 'C'),
		   (26, 10000, 'D');

SELECT
	aluno.nome,
	aluno.idade,
	faixa_nivel.categoria
FROM
	aluno,
	faixa_nivel
WHERE
	aluno.idade BETWEEN faixa_nivel.idade_min AND faixa_nivel.idade_max;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 11	
SELECT
	disciplina.nome,
	COUNT(aluno.matricula) AS "Qtd matriculas"
FROM
	aluno
RIGHT JOIN aluno_disciplina ON
	aluno.matricula = aluno_disciplina.id_matricula
RIGHT JOIN disciplina ON
	disciplina.id = aluno_disciplina.id_disciplina
GROUP BY
	disciplina.nome
ORDER BY "Qtd matriculas" DESC;

INSERT INTO disciplina(nome, turma, num_alunos, carga_horaria)
	VALUES ('Artes Satanicas', 666, 666, 666);
SELECT * FROM disciplina;
SELECT * FROM aluno;	
SELECT * FROM aluno_disciplina;	
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 12
SELECT
	aluno.nome AS aluno,
	disciplina.nome AS disciplina
FROM
	aluno
LEFT JOIN aluno_disciplina ON
	aluno.matricula = aluno_disciplina.id_matricula
LEFT JOIN disciplina ON
	disciplina.id = aluno_disciplina.id_disciplina
ORDER BY
	1;
	
INSERT INTO aluno (nome, idade, dt_nascimento, cidade)
	VALUES ('Jesus Amado', '66', '01-01-1901', 'São Jose dos Campos')
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 13
SELECT
	funcionario.cod_gerente,
	funcionario.nome
FROM funcionario;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 14
CREATE TABLE conjunto1 (
	cod INTEGER,
	valor CHAR(1))
INSERT INTO conjunto1
	VALUES (1, 'a'), (3, 'b');

DROP TABLE conjunto2
CREATE TABLE conjunto2 (
	codigo INTEGER,
	descricao CHAR(1));
INSERT INTO conjunto2
	VALUES (12, 'a'), (1, 'c'), (5, 'd');	
-------------------
--UNION - remove as linhas duplicadas
SELECT valor
FROM conjunto1
UNION SELECT descricao
FROM conjunto2;
-------------------
SELECT cod, valor
FROM conjunto1
UNION SELECT codigo, descricao
FROM conjunto2;
-------------------	
--UNION ALL - não remove as linhas duplicadas
SELECT valor
FROM conjunto1
UNION ALL
SELECT descricao
FROM conjunto2;
-------------------
--Intersect Retorna apenas os elementos idênticos
SELECT valor
FROM conjunto1
INTERSECT SELECT descricao
FROM conjunto2;
-------------------
SELECT cod,valor
FROM conjunto1
INTERSECT
SELECT codigo,descricao
FROM conjunto2;
-------------------
SELECT * FROM conjunto1
INSERT INTO conjunto1 VALUES (6, 'd'), (8, 'c'), (9, 'e');
INSERT INTO conjunto2 VALUES (12, 'a'), (5, 'd'), (56, 'b'), (7, 'f'), (78, 'g');
--Except Elimina do primeiro conjunto, os valores também existentes no segundo conjunto
SELECT valor
FROM conjunto1
EXCEPT SELECT descricao
FROM conjunto2;
-------------------
SELECT cod, valor
FROM conjunto1
EXCEPT SELECT codigo, descricao
FROM conjunto2;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 15
SELECT *
FROM ( SELECT funcionario.nome AS nome FROM funcionario
UNION ALL SELECT aluno.nome
FROM aluno) AS a
ORDER BY 1 DESC;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 16
SELECT *
FROM ( SELECT funcionario.nome AS "Nome do Funcionario" FROM funcionario
UNION SELECT aluno.nome FROM aluno) AS a
ORDER BY "Nome do Funcionario" DESC;

-- -----------------------------------------------------------------------------------------------------
-- Exercicio 17
SELECT DISTINCT aluno.nome || ' / ' || disciplina.nome AS "Nome / Disciplina"
FROM aluno JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.id_matricula
JOIN disciplina ON disciplina.id = aluno_disciplina.id_disciplina
ORDER BY "Nome / Disciplina" DESC;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 18

SELECT * FROM ( SELECT
'INSERT INTO funcionario (id_departamento, nome, cargo, cod_gerente, dt_contratacao, cod_gerente, salario) VALUES (' 
|| f.id_departamento || ', ''' || f.nome || ''' , ''' || f.cargo || ''' , ' || f.cod_gerente || ' , '''
|| f.dt_contratacao || ''' , ' || f.cod_gerente || ' , ' || f.salario || ');' AS comando
FROM funcionario f
UNION ALL
SELECT 'INSERT INTO aluno (nome, email, telefone, idade, dt_nascimento, cidade) VALUES (''' 
|| a.nome || ''', ''' || a.email || ''', ''' || a.telefone || ''' , ' || a.idade || ' , ''' || a.dt_nascimento || ''' , ''' || a.cidade || ''');'
FROM
aluno a) AS c;






























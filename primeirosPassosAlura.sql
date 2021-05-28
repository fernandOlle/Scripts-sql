integer
real
serial
numeric

varchar(n)
char(n)
text

boolean

date
time
timestamp

CREATE TABLE aluno (
    id SERIAL,
    nome VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro numeric(10,2),
    altura real,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em timestamp);

SELECT * FROM aluno;

INSERT INTO aluno (nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, matriculado_em) 
	VALUES ('Ervandil', 
			'12345678901', 
			'texto enorme de milhares de caracteres', 
			35, 
			100.50,
			1.81,
			TRUE,
			'1995-10-18',
			'17:30:00',
			'2021-02-18 14:14:45');
		
SELECT * FROM aluno WHERE id = 1;
UPDATE
	aluno
SET
	nome = 'Nico',
	cpf = '05400408040',
	observacao = 'teste',
	idade = 38,
	dinheiro = 15.23,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'
WHERE
	id = 1;
SELECT * FROM aluno WHERE nome = 'Nico';
DELETE FROM aluno WHERE nome = 'Nico';
SELECT
	nome AS "Nome do Aluno",
	idade,
	matriculado_em AS quando_se_matriculou
FROM
	aluno;

INSERT
	INTO
	aluno (nome)
VALUES ('Vinicius Dias');
INSERT
	INTO
	aluno (nome)
VALUES ('Nico Stepat');
INSERT
	INTO
	aluno (nome)
VALUES ('João Roberto');
INSERT
	INTO
	aluno (nome)
VALUES ('Diego');

SELECT
	*
FROM
	aluno
WHERE
	nome = 'Diego';

SELECT
	*
FROM
	aluno
WHERE
	nome != 'Diego';

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE '_iego';

SELECT
	*
FROM
	aluno
WHERE
	nome NOT LIKE 'Di_go';

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE '%s';

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE '% %';

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE '%i%a%';

SELECT
	*
FROM
	aluno
WHERE
	cpf IS NULL;

SELECT
	*
FROM
	aluno
WHERE
	cpf IS NOT NULL;

SELECT
	*
FROM
	aluno
WHERE
	idade <> 36;

SELECT
	*
FROM
	aluno
WHERE
	idade <= 35;

SELECT
	*
FROM
	aluno
WHERE
	idade > 36;

SELECT
	*
FROM
	aluno
WHERE
	idade < 36;

SELECT
	*
FROM
	aluno
WHERE
	idade BETWEEN 10 AND 35;

SELECT
	*
FROM
	aluno
WHERE
	idade BETWEEN 10 AND 35;

SELECT
	*
FROM
	aluno
WHERE
	ativo = TRUE;

SELECT
	*
FROM
	aluno
WHERE
	ativo IS NULL;

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE 'D%'
	AND cpf IS NOT NULL ;

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE 'Diego'
	OR nome LIKE 'Ervandil'
	OR nome LIKE 'Rodrigo';

SELECT
	*
FROM
	aluno
WHERE
	nome LIKE '%Stepat'
	AND nome LIKE 'Nico%';

DROP TABLE curso;
CREATE TABLE curso ( 
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL);

INSERT
	INTO
	curso(id, nome)
VALUES( 1, 'HTML');
INSERT
	INTO
	curso(id, nome)
VALUES( 2, 'JavaScript');

SELECT * FROM curso;

SELECT
	*
FROM
	aluno;

DROP TABLE aluno;
CREATE TABLE aluno( id SERIAL PRIMARY KEY,
nome VARCHAR(255)NOT NULL);

INSERT
	INTO
	aluno (nome)
VALUES ('Diogo');
INSERT
	INTO
	aluno (nome)
VALUES ('Vinicius');

SELECT
	*
FROM
	aluno;
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso( 
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) 
		REFERENCES aluno(id),
	FOREIGN KEY(curso_id) 
		REFERENCES curso(id));

INSERT
	INTO
	aluno_curso (aluno_id, curso_id)
	VALUES(1, 1);
INSERT
	INTO
	aluno_curso (aluno_id, curso_id)
	VALUES(2, 1);
INSERT
	INTO
	aluno_curso (aluno_id, curso_id)
	VALUES(1, 3);
INSERT
	INTO
	aluno_curso (aluno_id, curso_id)
	VALUES(3, 1);

SELECT * FROM aluno WHERE id = 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 3;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno;
SELECT * FROM curso;

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
JOIN curso ON
	curso.id = aluno_curso.curso_id;

INSERT
	INTO
	aluno_curso (aluno_id,
	curso_id)
VALUES(2,
2);

INSERT INTO aluno (nome) VALUES ('Nico');
INSERT INTO curso (id, nome) VALUES (3, 'CSS');

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
LEFT JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON
	curso.id = aluno_curso.curso_id;

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
RIGHT JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON
	curso.id = aluno_curso.curso_id;

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
FULL JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON
	curso.id = aluno_curso.curso_id;

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
CROSS JOIN curso;

INSERT
	INTO
	aluno (nome)
VALUES ('João');

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

DROP TABLE aluno_curso;
CREATE TABLE aluno_curso( 
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	FOREIGN KEY(aluno_id) 
		REFERENCES aluno(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(curso_id) 
		REFERENCES curso(id));
	
INSERT
	INTO
	aluno_curso (aluno_id,
	curso_id)
VALUES(1,
1);

INSERT
	INTO
	aluno_curso (aluno_id,
	curso_id)
VALUES(2,
1);

INSERT
	INTO
	aluno_curso (aluno_id,
	curso_id)
VALUES(1,
3);

SELECT * FROM aluno_curso;

SELECT
	aluno.nome AS "Nome do Aluno",
	curso.nome AS "Nome do curso"
FROM
	aluno
JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
JOIN curso ON
	curso.id = aluno_curso.curso_id;

DELETE
FROM
	aluno
WHERE
	id = 1;

SELECT
	*
FROM
	aluno;

UPDATE
	aluno
SET
	id = 20
WHERE
	id = 4;

SELECT
	aluno.id AS aluno_id,
	aluno.nome AS "Nome do Aluno",
	curso.id AS curso_id,
	curso.nome AS "Nome do curso"
FROM
	aluno
JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
JOIN curso ON
	curso.id = aluno_curso.curso_id;

UPDATE
	aluno
SET
	id = 10
WHERE
	id = 2;

SELECT
	*
FROM
	aluno_curso;


CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255));

INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M002', 'Vinicius', 'Dias');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M003', 'Nico', 'Steppat');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M004', 'João', 'Roberto');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M006', 'Alberto', 'Martins');
INSERT
	INTO funcionarios (matricula, nome, sobrenome)
VALUES ('M007', 'Diogo', 'Oliveira');

DELETE FROM funcionarios
WHERE matricula = 'M007' AND sobrenome = 'Mascarenhas';

SELECT
	*
FROM
	funcionarios
ORDER BY 4 DESC, nome DESC, 2 ASC;

SELECT
	*
FROM
	funcionarios
ORDER BY
	id
LIMIT 5
OFFSET 0;

SELECT
	*
FROM
	funcionarios
ORDER BY
	id
LIMIT 5
OFFSET 3;

-- COUNT - RETORNA A QUANTIDADE DE REGISTROS
-- SUM 	 - RETORNA A SOMA DOS REGISTROS
-- MAX 	 - RETORNA O MAIOR VALOR DOS REGISTROS
-- MIN 	 - RETORNA O MENOR VALOR DOS REGISTROS
-- AVG 	 - RETORNA A MÉDIA DOS REGISTROS

SELECT
	COUNT(id),
	SUM(id),
	MAX(id),
	MIN(id),
	ROUND(AVG(id),0)
FROM
	funcionarios;

SELECT DISTINCT
	nome,
	sobrenome
FROM
	funcionarios
ORDER BY
	nome;

SELECT
	nome,
	sobrenome,
	COUNT(*)
FROM
	funcionarios
GROUP BY
	1,
	2
ORDER BY
	nome;



	
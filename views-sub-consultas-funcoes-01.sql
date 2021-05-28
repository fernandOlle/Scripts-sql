
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento)
	VALUES ('Ervandil', 'Martins', '18-10-1995');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento)
	VALUES ('Morgana', 'Souza', '01-01-2001');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento)
	VALUES ('Guilherme', 'Leivas', '02-10-1997');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento)
	VALUES (
		'Vinicius', 'Dias', '1997-10-15'
	), (
		'Patricia', 'Freitas', '1986-10-25'
	), (
		'Diogo', 'Oliveira', '1984-08-27'
	), (
		'Maria', 'Rosa', '1985-01-01');
SELECT * FROM aluno;

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');
SELECT * FROM categoria;

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

INSERT INTO curso (nome, categoria_id)
	VALUES ('HTML', 1);
INSERT INTO curso (nome, categoria_id)
	VALUES ('PostgreSql', 2);
INSERT INTO curso (nome, categoria_id)
	VALUES ('JAVA', 3);
INSERT INTO curso (nome, categoria_id) VALUES
	('CSS', 1),
	('JS', 1),
	('PHP', 3),
	('C++', 3),
	('MySQL', 2),
	('Oracle', 2),
	('SQL Server', 2),
	('SQLite', 2),
	('Pandas', 5),
	('Machine Learning', 5),
	('Power BI', 5);
SELECT * FROM curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno_curso(aluno_id, curso_id)
	VALUES (1, 2);
INSERT INTO aluno_curso(aluno_id, curso_id)
	VALUES (2, 1);
INSERT INTO aluno_curso(aluno_id, curso_id)
	VALUES (3, 3);
INSERT INTO aluno_curso VALUES (8, 15), (8, 16), (9, 17), (9, 18), (10, 19), (10, 20), (11, 21), (11, 22), (11, 23), (1, 24), (3, 25);
SELECT * FROM aluno_curso;

SELECT
	aluno.id AS aluno_id,
	aluno.primeiro_nome AS "Nome do Aluno",
	categoria.nome AS "Categoria",
	curso.id AS curso_id,
	curso.nome AS "Nome do curso"
FROM
	aluno
INNER JOIN aluno_curso ON
	aluno.id = aluno_curso.aluno_id
INNER JOIN curso ON
	curso.id = aluno_curso.curso_id
INNER JOIN categoria ON 
	categoria.id = curso.categoria_id
ORDER BY categoria, primeiro_nome;


SELECT
	categoria.nome AS "Categoria",
	count(categoria.id) "Quantidade de cursos"
FROM
	categoria
JOIN curso ON
	curso.categoria_id = categoria.id
GROUP BY categoria.nome
ORDER BY "Quantidade de cursos" DESC;


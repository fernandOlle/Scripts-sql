CREATE SCHEMAS academico;

CREATE TABLE academico.aluno (
	id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL);

CREATE TABLE academico.categoria(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE);
	
CREATE TABLE academico.curso(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id));

CREATE TABLE academico.aluno_curso(
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id));
-------------------------------------------------------------------------------
CREATE TEMPORARY TABLE a (
	coluna1 VARCHAR(255) NOT NULL CHECK (coluna1 <> ''),
	coluna2 VARCHAR(250) NOT NULL,
	UNIQUE (coluna1, coluna2));

INSERT INTO a VALUES ('a', 'b')
SELECT * FROM a;

ALTER TABLE a RENAME TO teste;
SELECT * FROM teste;

ALTER TABLE teste RENAME coluna1 TO primeira_coluna;
ALTER TABLE teste RENAME coluna2 TO segunda_coluna;

-------------------------------------------------------------------------------
INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) 
	VALUES
		('Vinicius', 'Dias', '1997-10-15'),
		('Patricia', 'Freitas', '1986-10-25'),
		('Diogo', 'Oliveira', '1984-08-27'),
		('Maria', 'Rosa', '1985-01-01');
INSERT INTO academico.categoria (nome)
	VALUES
		('Front-end'),
		('Programação'),
		('Banco de Dados'),
		('Data Science');
INSERT INTO academico.curso (nome, categoria_id)
	VALUES
		('HTML', 1),
		('CSS', 1),
		('JS', 1),
		('PHP', 2),
		('JAVA', 2),
		('C++', 2),
		('PostegreSQL', 3),
		('MySQL', 3),
		('Oracle', 3),
		('SQL Server', 3),
		('SQLite', 3),
		('Pandas', 4),
		('Machine Lerning', 4),
		('Power BI', 4);
INSERT INTO academico.aluno_curso
	VALUES
		(1, 4),
		(1, 11),
		(2, 1),
		(2, 2),
		(3, 4),
		(3, 3),
		(4, 4),
		(4, 6),
		(4, 5);
-------------------------------------------------------------------------------
CREATE TEMPORARY TABLE cursos_programacao (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL);

INSERT INTO cursos_programacao 
SELECT
	academico.curso.id,
	academico.curso.nome
FROM
	academico.curso
WHERE
	categoria_id = 2;
	
SELECT * FROM cursos_programacao;
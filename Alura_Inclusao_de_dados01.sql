CREATE SCHEMA teste;
CREATE TABLE teste.cursos_programacao (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL);

INSERT INTO teste.cursos_programacao
SELECT
	academico.curso.id,
	academico.curso.nome
FROM
	academico.curso
WHERE
	categoria_id = 2;
	
SELECT * FROM teste.cursos_programacao;
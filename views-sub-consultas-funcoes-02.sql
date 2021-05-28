SELECT id FROM categoria WHERE nome NOT LIKE '% %';

SELECT curso.nome FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome LIKE '% de %');

SELECT
	*
FROM
	aluno
JOIN aluno_curso ON
	aluno_curso.aluno_id = aluno.id
JOIN curso ON
	aluno_curso.curso_id = curso.id;

SELECT
	categoria.nome AS categoria,
	count(curso.id) AS numero_cursos
FROM
	categoria
JOIN curso ON
	curso.categoria_id = categoria.id
GROUP BY
	categoria;

SELECT
	categoria,
	numero_cursos
FROM
	(
	SELECT
		categoria.nome AS categoria,
		count(curso.id) AS numero_cursos
	FROM
		categoria
	JOIN curso ON
		curso.categoria_id = categoria.id
	GROUP BY
		categoria) AS categoria_cursos
WHERE
	numero_cursos >= 3;

SELECT
	*
FROM
	(
	SELECT
		curso.nome,
		COUNT(aluno_curso.aluno_id) numero_alunos
	FROM
		curso
	JOIN aluno_curso ON
		aluno_curso.curso_id = curso.id
	GROUP BY
		1) AS t
WHERE
	t.numero_alunos >= 2
ORDER BY
	t.numero_alunos DESC;



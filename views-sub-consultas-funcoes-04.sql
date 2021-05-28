-- CRIANDO VIEW:
CREATE VIEW vw_cursos_por_categoria AS
SELECT
	categoria.nome AS categoria,
	count(curso.id) AS numero_cursos
FROM
	categoria
JOIN curso ON
	curso.categoria_id = categoria.id
GROUP BY
	categoria;
-- -------------------------------------------------------------------------------------------
CREATE VIEW vw_cursos_programacao AS
SELECT
	nome
FROM
	curso
WHERE
	categoria_id = 2;
-- -------------------------------------------------------------------------------------------
--DELETANDO VIEW:
--DROP VIEW [ IF EXISTS ] nome [, ...] [ CASCADE | RESTRICT ]
--IF EXISTS Não lança um erro se a visão não existir. Neste caso é emitida uma notificação.
--O nome (opcionalmente qualificado pelo esquema) da visão a ser removida.
--CASCADE remove automaticamente os objetos que dependem da visão (como outras visões).
--RESTRICT recusa remover a visão se existirem objetos que dependem da mesma. Este é o padrão.
-- EX: DROP VIEW IF EXISTS vw_cursos_por_categoria;
-- -------------------------------------------------------------------------------------------
SELECT
	*
FROM
	vw_cursos_por_categoria AS categoria_cursos
WHERE numero_cursos > 3;

SELECT
	*
FROM
	vw_cursos_programacao;

SELECT
	*
FROM
	vw_cursos_programacao
WHERE
	nome = 'PostgreSql';
-- -------------------------------------------------------------------------------------------

SELECT
	*
FROM
	vw_cursos_por_categoria
JOIN categoria ON
	categoria.nome = vw_cursos_por_categoria.categoria;
-- -------------------------------------------------------------------------------------------

SELECT
	categoria.id AS categoria_id,
	vw_cursos_por_categoria.*
FROM
	vw_cursos_por_categoria
JOIN categoria ON
	categoria.nome = vw_cursos_por_categoria.categoria;



















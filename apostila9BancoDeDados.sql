-- Exercicio 1
CREATE VIEW vw_categoria_alunos AS
SELECT a.matricula, a.nome, fn.categoria
FROM aluno a, faixa_nivel fn
WHERE a.idade BETWEEN fn.idade_min AND fn.idade_max
ORDER BY a.matricula

SELECT * FROM vw_categoria_alunos;
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 2
SELECT vwca.nome, d.nome, vwca.categoria
FROM vw_categoria_alunos vwca JOIN aluno_disciplina ON vwca.matricula = aluno_disciplina.id_matricula
JOIN disciplina d ON d.id = aluno_disciplina.id_disciplina
-- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
SELECT d.nome AS disciplina, count(d.nome) AS "NºAlunos", vwca.categoria
FROM vw_categoria_alunos vwca JOIN aluno_disciplina ON vwca.matricula = aluno_disciplina.id_matricula
JOIN disciplina d ON d.id = aluno_disciplina.id_disciplina
GROUP BY 3, 1
ORDER BY 1, 3;
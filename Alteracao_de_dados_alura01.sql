SELECT * FROM cursos_programacao ORDER BY 1
UPDATE teste.cursos_programacao SET nome_curso = nome
FROM academico.curso 
WHERE teste.cursos_programacao.id_curso = academico.curso.id AND academico.curso.id < 10 ;
--------------------------------------- ou ----------------------------------------------------
UPDATE teste.cursos_programacao SET nome_curso = nome
FROM academico.curso WHERE teste.cursos_programacao.id_curso = academico.curso.id
AND academico.curso.id < 10 ;
-----------------------------------------------------------------------------------------------
DELETE FROM teste.cursos_programacao WHERE  id_curso = 10;

--para excluir todos os cursos da categoria com nome “Teste”, podemos fazer
DELETE FROM curso
      USING categoria
      WHERE categoria.id = curso.categoria_id
        AND categoria.nome = 'Teste';

SELECT * FROM academico.curso ORDER BY 1
UPDATE academico.curso SET nome = 'C++ Básico' WHERE id = 6;
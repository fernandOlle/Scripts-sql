BEGIN;
DELETE FROM teste.cursos_programacao cursos_programacao;
ROLLBACK;
DELETE FROM teste.cursos_programacao cursos_programacao WHERE id_curso = 60;
COMMIT;
SELECT * FROM teste.cursos_programacao;


-- se tiver uma transa��o em aberto ou seja, nao foi realizado commit e nem o rollback
-- e se desconectar do banco servidor do banco de dados o postgresql vai dar erro e 
-- por baixo dos panos ele faz o rollback

/*O uso de transa��es n�o � apenas para desfazer poss�veis erros.
Na verdade, o principal uso de transa��es � a execu��o de comandos �dependentes� entre si.
Ex.:

Imagine que vamos realizar uma transfer�ncia banc�ria entre 2 contas. 
Imagine que a atualiza��o do saldo na conta de origem funcione mas a atualiza��o do saldo na conta de destino falhe. Isso seria um grande problema.
 Ent�o nesse caso, os 2 comandos UPDATE estariam em uma �nica transa��o.

Para entender com mais detalhes esse conceito t�o importante, vale a pena uma r�pida leitura na documenta��o oficial:
*/ 
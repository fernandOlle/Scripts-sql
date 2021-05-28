BEGIN;
DELETE FROM teste.cursos_programacao cursos_programacao;
ROLLBACK;
DELETE FROM teste.cursos_programacao cursos_programacao WHERE id_curso = 60;
COMMIT;
SELECT * FROM teste.cursos_programacao;


-- se tiver uma transação em aberto ou seja, nao foi realizado commit e nem o rollback
-- e se desconectar do banco servidor do banco de dados o postgresql vai dar erro e 
-- por baixo dos panos ele faz o rollback

/*O uso de transações não é apenas para desfazer possíveis erros.
Na verdade, o principal uso de transações é a execução de comandos “dependentes” entre si.
Ex.:

Imagine que vamos realizar uma transferência bancária entre 2 contas. 
Imagine que a atualização do saldo na conta de origem funcione mas a atualização do saldo na conta de destino falhe. Isso seria um grande problema.
 Então nesse caso, os 2 comandos UPDATE estariam em uma única transação.

Para entender com mais detalhes esse conceito tão importante, vale a pena uma rápida leitura na documentação oficial:
*/ 
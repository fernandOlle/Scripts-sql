-- Exercicio 1
INSERT INTO departamento(id, descricao, localizacao)
 VALUES (20, 'ALMOXARIFADO','CURITIBA');
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1000, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);
 
BEGIN;
INSERT INTO departamento(id, descricao, localizacao)
 VALUES (20, 'ALMOXARIFADO','CURITIBA');
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1000, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);
 COMMIT;
 
BEGIN;
INSERT INTO departamento(id, descricao, localizacao)
 VALUES (20, 'ALMOXARIFADO','CURITIBA');
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(id, nome, cargo, dt_contratacao, cod_gerente, salario, id_departamento)
 VALUES (1001, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);
 ROLLBACK;
 -- -----------------------------------------------------------------------------------------------------
-- Exercicio 2
BEGIN;
insert into departamento (id,descricao,localizacao)
values (1000,'CONTROLADORIA','PELOTAS');
commit;
 -- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
BEGIN;
Select * from departamento;
update departamento set descricao='VENDAS'
where id=1000;
select * from departamento;
insert into departamento (id,descricao,localizacao)
Values (1001,'RH','PELOTAS');
commit;
--Para saber o número atual de conexões feitas no Postgresql:
SELECT * FROM pg_stat_activity;


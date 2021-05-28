-- Exercicio 2
begin;
Select * from departamento;
Select count(*) from departamento;
Select * from departamento;
Select count(*) from departamento;
Select * from departamento;
commit;
ROLLBACK;
 -- -----------------------------------------------------------------------------------------------------
-- Exercicio 3
begin;
Select count(*) from departamento;
update departamento set localizacao='RIO GRANDE'
where id=1000;
Select count(*) from departamento;
commit;

Select * from departamento;


CREATE TABLE instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10,2));
	

INSERT INTO instrutor (nome, salario) VALUES ('Vinicius Dias', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Diogo Mascarenhas', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Nico Steppat', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Juliana', 400);
INSERT INTO instrutor (nome, salario) VALUES ('Priscila', 500);

CREATE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$ 
	SELECT $1.salario * 2 AS dobro;
$$LANGUAGE SQL;

SELECT nome, dobro_do_salario(instrutor.*) FROM instrutor;

SELECT nome, dobro_do_salario(instrutor.*) FROM instrutor;

CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
	SELECT 22, 'Nome falso', 200.00;
$$ LANGUAGE SQL;

SELECT cria_instrutor_falso();
SELECT * FROM  cria_instrutor_falso();
SELECT id, salario FROM cria_instrutor_falso();

--------------------------------------------------------------------------------------------------------------
DROP FUNCTION instrutores_bem_pagos;
CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(300);
--------------------------------------------------------------------------------------------------------------
/* create type dois_valores as (soma integer, produto integer);
CREATE FUNCTION soma_e_produto(numero_1 INTEGER, numero_2 INTEGER) RETURNS dois_valores AS $$
	SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;
$$ LANGUAGE SQL;
*/
CREATE FUNCTION soma_e_produto(numero_1 INTEGER, numero_2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS $$
	SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3);




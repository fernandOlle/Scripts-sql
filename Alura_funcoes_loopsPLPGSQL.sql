DROP FUNCTION tabuada;
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
DECLARE
	multiplicador INTEGER DEFAULT 1;
BEGIN
	WHILE multiplicador <= 10 LOOP
		RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
		multiplicador := multiplicador + 1;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;
------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
DECLARE
	multiplicador INTEGER DEFAULT 1;
BEGIN
	FOR multiplicador IN 1..10 LOOP
		RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT tabuada(9);
-------------------------------------------------------------------------------------------------------------
CREATE FUNCTION instrutor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		FOR instrutor IN SELECT * FROM instrutor LOOP
			nome := instrutor.nome;
			salario_ok = salario_ok(instrutor.id);
			RETURN NEXT;
		END LOOP;
	END;
$$ LANGUAGE PLPGSQL; 



















CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$
DECLARE
	media_salarial DECIMAL;
	instrutores_recebem_menos INTEGER DEFAULT 0;
	total_instrutores INTEGER DEFAULT 0;
	salario DECIMAL;
	percentual DECIMAL(5, 2);
BEGIN 
SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;
IF NEW.salario > media_salarial THEN
	INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
END IF;
FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
	total_instrutores := total_instrutores + 1;
	IF NEW.salario > salario THEN 
		instrutores_recebem_menos := instrutores_recebem_menos + 1;
	END IF;
END LOOP;
percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
INSERT INTO log_instrutores(informacao, teste) 
VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores', '');
RETURN NEW;
EXCEPTION
	WHEN undefined_column THEN
		RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER cria_log_instrutores AFTER INSERT ON instrutor 
FOR EACH ROW EXECUTE PROCEDURE cria_instrutor();

SELECT * FROM instrutor;
SELECT * FROM log_instrutores li;
INSERT INTO instrutor (nome, salario)
VALUES ('Outra Pessoa de novo', 600);
INSERT INTO instrutor (nome, salario)
VALUES ('Joao', 650);
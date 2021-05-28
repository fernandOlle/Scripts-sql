DROP TABLE aluno;
DROP TABLE disciplina;
DROP TABLE departamento;
DROP TABLE funcionario;

CREATE TABLE aluno (
	matricula SERIAL,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) DEFAULT 'Não possui EMAIL',
	telefone VARCHAR(11) DEFAULT 'Não possui',
	idade NUMERIC(3) NOT NULL,
	dt_nascimento DATE,
	cidade VARCHAR(255),
	PRIMARY KEY(matricula));

INSERT INTO aluno (nome, idade, dt_nascimento, cidade)
	VALUES('Ervandil', 25, '18-10-1995', 'Pelotas'),
		  ('Maradona', 32, '24-02-1990', 'Porto Alegre'),
		  ('Kaka', 20, '01-01-1979', 'Cristal'),
		  ('Aleatorio', 33, '24-12-1979', 'Lugar Nenhum'),
		  ('Piruleta', 15, '24-12-2004', 'Santa Rita'),
		  ('Cara Tec', 103, '24-12-1921', 'Tao Tao Distante');
 
CREATE TABLE disciplina (
	id serial PRIMARY KEY,
	nome varchar(255) NOT NULL,
	turma numeric(4),
	num_alunos numeric(4) DEFAULT 50,
	carga_horaria numeric(3)DEFAULT 60);

INSERT INTO disciplina (nome, turma, num_alunos)
	VALUES('JAVA', 101, 20),
		  ('POSTGRESQL', 101, 30),
		  ('JAVASCRIPT', 102, 40),
		  ('HTML', 102, 50);		
		 
CREATE TABLE aluno_disciplina(
	id_matricula INTEGER,
	id_disciplina INTEGER,
	PRIMARY KEY (id_matricula, id_disciplina),
	FOREIGN KEY (id_matricula) REFERENCES aluno(matricula),
	FOREIGN KEY (id_disciplina) REFERENCES disciplina(id));

INSERT
	INTO aluno_disciplina
	VALUES (1, 1), (1, 2),(2, 3), (3, 4), (4, 3), (5, 4), (6, 1), (6, 2);
INSERT 
	INTO aluno_disciplina 
	VALUES (1, 3), (1, 4), (6, 4);
	
CREATE TABLE funcionario (
	id SERIAL PRIMARY KEY,
	id_departamento INTEGER,
	nome VARCHAR(255) NOT NULL,
	cargo VARCHAR(255),
	dt_contratacao DATE DEFAULT CURRENT_DATE,
	cod_gerente INTEGER,
	salario NUMERIC(10,2) DEFAULT 1500.00,
	FOREIGN KEY (id_departamento) REFERENCES departamento(id),
	FOREIGN KEY (cod_gerente) REFERENCES funcionario(id));

INSERT INTO funcionario (id_departamento, nome, cargo, cod_gerente)
	VALUES(1, 'Ervandil', 'Desenvolvedor Java', NULL),
		  (2, 'Ronaldinho', 'Deus Bruxo', NULL),
		  (3, 'Pelé', 'Lenda', 2),
		  (4, 'Maradona', 'Rei do Pó', NULL),
		  (1, 'Morgana', 'Num Sei', 1);
INSERT INTO funcionario (id_departamento, nome, cargo, cod_gerente)
	VALUES (4, 'Nariz Nervoso', 'Controle de qualidade', 4);
INSERT INTO funcionario (id_departamento, nome, cargo, cod_gerente)
	VALUES (4, 'Nariz_Potente', 'Controle de qualidade', 4);

CREATE TABLE departamento (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	descricao TEXT,
	sigla VARCHAR(255));

INSERT INTO departamento (nome, descricao, sigla)
	VALUES('WTF', 'Departamento um', 'D1'),
		  ('DIBRADORES', 'Departamento dois', 'D2'),
		  ('OLD SCHOOL', 'Departamento três', 'D3'),
		  ('DEAD', 'Departamento quatro', 'D4');


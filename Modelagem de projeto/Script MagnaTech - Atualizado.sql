CREATE DATABASE magnatech;

USE magnatech;

CREATE TABLE fazenda (
	idFazenda INT AUTO_INCREMENT,
	nome VARCHAR(40),
	razaoSocial VARCHAR(40),
	cnpj CHAR(14),
	email VARCHAR(45) UNIQUE,
	senha VARCHAR(45),
	PRIMARY KEY (idFazenda)
);

CREATE TABLE especieCogumelo (
	idCogumelo INT,
	especie VARCHAR(45) NOT NULL,
	tempIdeal DECIMAL(4,2),
	umidIdeal DECIMAL(3,1),
	PRIMARY KEY (idCogumelo)
);

CREATE TABLE nicho (
	fkFazenda INT,
	idNicho INT,
	coluna VARCHAR(5),
	prateleira VARCHAR(5),
	fkCogumelo INT,
	PRIMARY KEY (idNicho, fkFazenda),
	FOREIGN KEY (fkFazenda) 
		REFERENCES fazenda(idFazenda),
	FOREIGN KEY (fkCogumelo) 
		REFERENCES especieCogumelo(idCogumelo)
);

CREATE TABLE Funcionario (
	fkFazenda INT,
	idFuncionario INT AUTO_INCREMENT,
	PRIMARY KEY (idFuncionario, fkFazenda),
	FOREIGN KEY (fkFazenda) 
		REFERENCES fazenda(idFazenda),
	senha VARCHAR(20),
	nome VARCHAR(60),
	celular CHAR(11),
	email VARCHAR(60)
)AUTO_INCREMENT = 25220;

CREATE TABLE arduino (
	idSensor INT PRIMARY KEY,
	fkNicho INT,
	fkFazenda INT,
	sensor VARCHAR(3),
	FOREIGN KEY (fkNicho, fkFazenda) 
		REFERENCES nicho(idNicho, fkFazenda)
);

CREATE TABLE Captura (
	idCaptura INT AUTO_INCREMENT,
	fkSensor INT,
	FOREIGN KEY (fkSensor) 
		REFERENCES arduino(idSensor),
	PRIMARY KEY (idCaptura, fkSensor),
	umidade DECIMAL(4,2),
	temperatura DECIMAL(4,2),
	momento DATETIME
);

CREATE TABLE agendamento (
	idAgendamento INT AUTO_INCREMENT,
	fkFazenda INT,
	nomeRepresentante VARCHAR(45),
	telefone CHAR(11),
	email VARCHAR(40),
	agendamentoData DATE,
	nomeEmpresa VARCHAR(40),
	cnpj CHAR(14),
	rua VARCHAR(40),
	bairro VARCHAR(40),
	complemento VARCHAR(40),
	PRIMARY KEY (idAgendamento)
)AUTO_INCREMENT= 10000;

INSERT INTO arduino VALUES (1, null, null, '101');

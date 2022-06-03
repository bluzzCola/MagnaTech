create database magnatech;

use magnatech;


CREATE TABLE fazenda (
  idFazenda INT,
  nome VARCHAR(40),
  razaoSocial VARCHAR(40) ,
  cnpj CHAR(14) ,
  email VARCHAR(45) ,
  telefoneCel CHAR(11) ,
  telefoneFixo char (10),
  rua VARCHAR(40) ,
  numero VARCHAR(40) ,
  bairro VARCHAR(40) ,
  cep CHAR(8) ,
  cidade VARCHAR(40) ,
  estado VARCHAR(40) ,
  PRIMARY KEY (idFazenda)
  );




CREATE TABLE especieCogumelo (
  idCogumelo INT  ,
  especie VARCHAR(45) not null,
  tempIdeal DECIMAL(4,2) ,
  umidIdeal DECIMAL(3,1) ,
  PRIMARY KEY (idCogumelo))
  ;




CREATE TABLE nicho (
  fkFazenda INT,
  idNicho INT,
  coluna VARCHAR(5),
  prateleira VARCHAR(5),
  fkCogumelo INT,
  PRIMARY KEY (idNicho, fkFazenda),
    FOREIGN KEY (fkFazenda)
    REFERENCES fazenda (idFazenda),
    FOREIGN KEY (fkCogumelo)
    REFERENCES especieCogumelo (idCogumelo)
    );


CREATE TABLE Funcionario(
fkFazenda INT,
idFuncionario INT AUTO_INCREMENT,
PRIMARY KEY (idFuncionario, fkFazenda),
FOREIGN KEY (fkFazenda) REFERENCES fazenda(idFazenda),
senha VARCHAR(20),
nome VARCHAR(60),
celular CHAR(11),
email VARCHAR(60)
)AUTO_INCREMENT = 25220;




CREATE TABLE arduino (
  idSensor INT PRIMARY KEY ,
  fkNicho INT,
  fkFazenda INT,
  sensor varchar(3),
    FOREIGN KEY (fkNicho , fkFazenda)
    REFERENCES nicho (idNicho , fkFazenda)
    );


    CREATE TABLE Captura(
    idCaptura INT AUTO_INCREMENT,
   fkSensor INT,
   FOREIGN KEY (fkSensor) REFERENCES arduino(idSensor),
   PRIMARY KEY (idCaptura, fkSensor ),
   umidade DECIMAL(4,2),
	temperatura DECIMAL(4,2),
    momento DATETIME
    );
    
    


CREATE TABLE agendamento (
  idagendamento INT AUTO_INCREMENT,
  fkFazenda INT,
  nomeRepresentante VARCHAR(45) ,
  telefone CHAR(11) ,
  email VARCHAR(40) ,
  agendamentoData DATE ,
  nomeEmpresa VARCHAR(40) ,
  cnpj CHAR(14) ,
  rua VARCHAR(40) ,
  bairro VARCHAR(40) ,
  complemento VARCHAR(40) ,
  PRIMARY KEY (idagendamento)
  )AUTO_INCREMENT= 10000;



INSERT INTO agendamento ( nomeRepresentante, telefone, email,  agendamentoData, nomeEmpresa, cnpj, rua, bairro, complemento ) VALUES
('João Gomes','11968188554','fazenda1@gmail.com','2022-05-12','Nome fazenda1','07258852000118','Rua 1','Bairro 1','Em Frente a ultra gas'),
('Rafael Gonçalves','21955354585','fazenda2@gmail.com','2020-04-25','Nome fazenda2','08258852000220','Rua 2','Bairro 2','No estacionamento do carrefour');


INSERT INTO fazenda (idFazenda, nome, razaoSocial, cnpj, email, telefoneCel, telefoneFixo, rua, numero, bairro, cep, cidade, estado) VALUES
(1,'nome Fazenda1','Razão Social fazenda1','07258852000118','fazenda1@gmail.com','11968188554','1168188554','rua 1','212','bairro 1','04455220','São Roque','São Paulo'),
(2,'nome Fazenda2','Razão Social fazenda2','08258852000220','fazenda2@gmail.com','21955354585','2155127864','rua 2','415','bairro 2','03312550','são João de Mereti','Rio de Janeiro');



INSERT INTO Funcionario (fkFazenda, senha, nome, celular, email) VALUES
(1,'senha11',' funcionario1 Fazenda1','11968488554','funcionario1@fazenda1.com'),
(2,'senha22',' Funcionario1 Fazenda2','21954525451','funcionario1@fazenda2.com'),
(1,'senha33',' Funcionario2 Fazenda1','11111111111','funcionario2@fazenda1.com'),
(2,'senha44',' Funcionario2 Fazenda2','22222222222','funcionario2@fazenda2.com');


INSERT INTO especieCogumelo ( idCogumelo, especie, tempIdeal, umidIdeal) VALUES
(11,'Shimeji','19.00','75.00'),
(12,'Champignon','15.00','80.00'),
(13,'Trufa','22.00','55.00'),
(14,'Ostra Rosa','25.00','85.00'),
(15,'Shitake','19.00','69.00');

INSERT INTO nicho (idNicho, fkFazenda, coluna, prateleira, fkCogumelo) VALUES
 (10,1, 'A','1',11 ),
 (11,1, 'A','2',12 ),
 (12,1, 'A','3',13 ),
 (13,1, 'A','4',14 ),
 (14,1, 'A','5',15 ),
 (15,2, 'B','1',11 ),
 (16,2, 'B','2',12 ),
 (17,2, 'B','3',13 ),
 (18,2, 'B','4',14 ),
 (19,2, 'B','5',15 );


INSERT INTO arduino (idSensor, sensor, fkNicho, fkFazenda ) VALUES 
(5052201,'A1',10,1),
(5052202,'A2',11,1),
(5052203,'A3',12,1),
(5052204,'A4',13,1),
(5052205,'A5',14,1),
(5052206,'B1',15,2),
(5052207,'B2',16,2),
(5052208,'B3',17,2),
(5052209,'B4',18,2),
(5052210,'B5',19,2);
 
 

INSERT INTO captura( fkSensor, umidade, temperatura, momento) VALUES 
(5052201,80.5,25.55, '11-11-11 12-25-12'),
(5052201,80.5,25.55, '11-11-11 13-25-12'),
(5052201,80.5,25.55, '11-11-11 14-25-25'),
(5052201,80.5,25.55, '11-11-11 15-25-25'),
(5052201,80.5,25.55, '11-11-11 16-25-25'),
(5052201,80.5,25.55, '11-11-11 17-25-25'),
(5052201,80.5,25.55, '11-11-11 18-25-25'),
(5052201,80.5,25.55, '11-11-11 19-25-25'),
(5052202,80.5,25.55, '11-11-11 12-25-12'),
(5052202,80.5,25.55, '11-11-11 13-25-12'),
(5052202,80.5,25.55, '11-11-11 14-25-25'),
(5052202,80.5,25.55, '11-11-11 15-25-25'),
(5052202,80.5,25.55, '11-11-11 16-25-25'),
(5052202,80.5,25.55, '11-11-11 17-25-25'),
(5052202,80.5,25.55, '11-11-11 18-25-25');



create database contaBancaria;
use contaBancaria;

create table banco(
	codigo int not null primary key auto_increment,
    nome varchar(45)

);

create table agencia(
	numero_agencia int not null,
    cod_banco int  not null,
    endereco varchar(100),
    primary key (numero_agencia,cod_banco),
    foreign key (cod_banco) references banco (codigo)
);

create table conta(
	num_conta varchar(7) not null primary key,
    saldo float not null,
    tipo_conta int,
    num_agencia int,
    foreign key (num_agencia) references agencia (numero_agencia)
);

create table cliente(
	cpf varchar(14) not null primary key,
    nome varchar (45) not null,
    endereco varchar(100),
    sexo char(1)

);

create table historico (
	cpf varchar(14) not null,
    num_conta varchar(7) not null,
    data_inicio date,
    primary key (cpf, num_conta),
    foreign key (cpf) references cliente(cpf),
    foreign key (num_conta) references conta (num_conta)

);

create table telefone_cliente(
	cpf varchar(14) not null,
    telefone varchar(20),
    primary key (cpf, telefone),
    foreign key (cpf) references cliente (cpf)

);

/*****************************************************************************************************/

/*Parte 2 (Inserção dos dados)*/

/*inserindo dados na tabela*/
insert into banco (codigo, nome) 
values (1, "Banco do Brasil"), 
	   (4,"CEF"); 

insert agencia (numero_agencia, endereco, cod_banco)
values (0562,"Rua Joaquim Teixeira Alves, 1555",4),
	   (3153,"AV. Marcelino Pires", 1);
       
insert into cliente (cpf, nome, sexo, endereco)
values ("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
	   ("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
       ("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos,735");
       
insert into conta (num_conta, saldo, tipo_conta,num_agencia) 
values ("86340-2",763.05,2,3153),
       ("23584-7",3879.12,1,0562);
       
insert into historico (cpf, num_conta, data_inicio)
values 
('111.222.333-44', '23584-7', '1997-12-17'),
('666.777.888-99', '23584-7', '1997-12-17'),
('555.444.777-33', '86340-2', '2010-11-29');

insert into telefone_cliente (cpf, telefone)
values ("111.222.333-44", "(67)3422-7788"),
       ("666.777.888-99", "(67)3423-9900"),
       ("666.777.888-99", "(67)8121-8833");





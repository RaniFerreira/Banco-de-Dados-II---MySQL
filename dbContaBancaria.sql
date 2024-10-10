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

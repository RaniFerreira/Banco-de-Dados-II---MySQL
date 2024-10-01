/*Ranielly Ferreira dos Santos - 3º Periodo*/

create database livraria; /*Criação do banco de dados*/
use livraria; /*codigo para usar o banco de dados*/

/*Criação de tabala com suas colunas e tipos de dados*/
create table editora(  
	cod_editora int primary key not null auto_increment,
    descricao varchar(45) not null,
    endereco varchar(45)
);  


/*Criação de tabala com sua colunas e tipos de dados*/
create table livro(
	cod_livro int primary key not null auto_increment,
    isbn varchar(45) not null,
    titulo varchar (45) not null,
    autor varchar (45) not null,
    num_edicao int,
    preco float not null,
	cod_editora int,
	foreign key (cod_editora) references editora(cod_editora) 
    /*chave estrangeira que esta refenciando a chave primaria de outra table*/
); 

create table autor(
	cod_autor int primary key not null auto_increment,
    nome varchar(45) not null,
    sexo varchar(45),
    data_nascimento date
); 

create table livro_autor(
	
    cod_livro int not null,
    cod_autor int not null,
	primary key (cod_livro,cod_autor),
    foreign key (cod_livro) references livro(cod_livro),
    foreign key (cod_autor) references autor(cod_autor)
	/*Chave composta(criação de chave primaria e estrangeira ao mesmo tempo)*/
);

alter table editora change descricao nome varchar(45);
alter table autor change sexo sexo varchar(1);
alter table livro add constraint isbn unique (isbn);
alter table livro alter column preco set default 10.00;
alter table livro drop column num_edicao;
alter table livro add column edicao int;


create table grupo(
	id_grupo int primary key not null auto_increment,
    nome varchar(45)
);
alter table editora add column id_grupo int;

alter table editora add constraint id_grupo foreign key(id_grupo) references grupo(id_grupo)
on delete set null on update cascade;

/*******************************COMENTÁRIOS***************************************************************/

/*alter table = alterar dados na table desejada*/
/*add constraint = definir restrições*/
/*alter column = amodifica a estrutura da culuna existente*/
/*set default = define um valor padrão*/
/*chance altera a sintaxe de um dado*/
/*drop column = deleta  coluna*/
/*add column = adiciona coluna*/
/*unique = definir que todos os dados da coluna seja distintos sendo assim cadas um unico*/

/*on delete set null = se uma linha na tabela pai (referenciada) for excluída, as colunas correspondentes 
na tabela filha (que faz referência à tabela pai) serão definidas como NULL.*/

/*on update cascade = Essa parte da cláusula define que, se uma linha na tabela pai for atualizada (ou seja, 
se a chave primária for alterada), 
as colunas correspondentes na tabela filha serão
 atualizadas automaticamente para refletir essa mudança*/
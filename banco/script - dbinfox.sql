SET FOREIGN_KEY_CHECKS=0;
-- comentários
-- a linha abaixo cria um banco de dados
create database dbinfox
default character set utf8
collate utf8_general_ci;

-- a linha abaixo escolhe o banco de dados
use dbinfox;

-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null)default charset utf8;

select * from tbusuarios;

alter table tbusuarios
add column perfil varchar(20) not null;

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- a linha abaixo insere dados na tabela (CRUD)
-- create -> insert
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1,'Lucas Lira', '98948-4832', 'lucaslira', '123456');

-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2,'Administrador', '98698-9236', 'admin', 'admin');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3,'Bill Gates', '99999-9999', 'bill', '123456');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='88888-8888' where iduser = 2;

-- a linha abaixo modifica dados na tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser = 3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
)default charset = utf8;

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Linus Torvalds', 'Rua Tux, 2015', '99999-9999', 'linus@linux.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
)default charset utf8;

describe tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Não liga', 'Troca da fonte', 'Zé', 87.50, 2);

update tbos set idcli = 1 where os = 1;

SET FOREIGN_KEY_CHECKS=1;

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,foneCli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);


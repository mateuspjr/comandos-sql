create database imoveisNet;
use imoveisNet;

create table vendedor(
cd_vendedor int primary key auto_increment,
nm_vendedor varchar(40),
nm_endereco varchar(40),
nr_cpf decimal(11),
nm_cidade varchar(20),
nm_bairro varchar(20),
sg_estado char(2),
telefone varchar(20),
email varchar(80)
);

create table faixa_imovel(
cd_faixa int primary key auto_increment,
nm_faixa varchar(30),
vl_minimo decimal (14,2),
vl_maximo decimal(14,2)
);

create table comprador(
cd_comprador int primary key auto_increment,
nm_comprador varchar(40),
nr_cpf decimal (11),
nm_cidade varchar(20),
nm_bairro varchar(20),
sg_estado char(2),
telefone varchar (20),
email varchar(80)
);

create table estado(
sg_estado char(2) primary key,
nm_estado varchar(20)
);

create table cidade(
cd_cidade int primary key auto_increment,
nm_cidade varchar(20),
sg_estado char(2),

foreign key (sg_estado) references estado(sg_estado)
);

create table bairro(
cd_bairro int primary key auto_increment,
nm_bairro varchar(20),
cd_cidade int,
sg_estado char(2),

foreign key (cd_cidade) references cidade(cd_cidade),
foreign key (sg_estado) references estado(sg_estado)
);

create table imovel(
cd_imovel integer primary key auto_increment,

cd_vendedor int,
cd_bairro int,
cd_cidade integer,
sg_estado char(2),
nm_endereco varchar(40),
nr_areautil decimal (10,2),
nr_areatotal decimal(10,2),
ds_imovel varchar(300),
vl_preco decimal (16,2),
nr_ofertas int,
st_vendido char(1),
dt_lancto date,
imovel_indicado int,


foreign key (cd_vendedor) references vendedor(cd_vendedor),
foreign key (cd_bairro) references bairro(cd_bairro),
foreign key (sg_estado) references estado(sg_estado)
);

create table oferta(
dt_oferta date primary key,
vl_oferta decimal(16,2),
cd_imovel int,
cd_comprador int,

foreign key (cd_imovel) references imovel(cd_imovel),
foreign key (cd_comprador) references comprador(cd_comprador)
);

insert into estado
(sg_estado, nm_estado)
values
('SP', 'SãoPaulo'),
('RJ', 'RiodeJaneiro');

insert into cidade
(cd_cidade, nm_cidade, sg_estado)
values
(1, 'SãoPaulo', 'SP'),
(2, 'Santo André', 'SP'),
(3, 'Campinas', 'SP'),
(4, 'Rio de Janeiro', 'RJ'),
(5, 'Niterói', 'RJ');

insert into bairro
(cd_bairro, nm_bairro, cd_cidade, sg_estado)
values
(1, 'Jardins', 1, 'SP'),
(2, 'Morumbi', 1, 'SP'),
(3, 'Aeroporto', 1, 'SP'),
(4, 'Aeroporto', 1, 'RJ'),
(5, 'Flamengo', 1, 'RJ');

insert into vendedor
(cd_vendedor, nm_vendedor, nm_endereco, email)
values
(1, 'Maria da Silva', 'Rua do Grito, 45', 'msilva@novatec.com.br'),
(2, 'Marcos Andrade', 'Av. da Saudade, 325', 'mandrade@novatec.com.br'),
(3, 'André Cardoso', 'Av. Brasil, 401', 'acardoso@novatec.com.br'),
(4, 'Tatiana Souza', 'Rua do Imperador, 778', 'tsouza@novatec.com.br');


insert into imovel (cd_imovel, cd_vendedor, cd_bairro, cd_cidade,
 sg_estado, nm_endereco, nr_areautil, nr_areatotal, ds_imovel,
 vl_preco, nr_ofertas, st_vendido, dt_lancto, imovel_indicado)
values
(1, 1, 1, 1, 'SP', 'Al Tiete, 3304 AP 101', 250, 400, '180000', null, 0, 'N', '2002-01-10', null),
(2, 1, 2, 1, 'SP', 'Av Morumbi, 2230', 150, 250, '135000', 1, 0, 'N', '2002-01-10', null),
(3, 2, 1, 1, 'RJ', 'R Gal Osorio, 445 AP 34', 250, 400, '185000', 2, 0, 'N', '2002-01-10', null),
(4, 2, 2, 1, 'RJ', 'R D Pedro I, 882', 120, 200, '110000', 1, 0, 'N', '2002-01-10', null),
(5, 3, 3, 1, 'SP', 'Av Ruben Berta, 2355', 1120, 200, '95000', 4, 0, 'N', '2002-01-10', null),
(6, 4, 1, 1, 'RJ', 'R Getúlio Vargas, 552', 200, 300, '99000', 5, 0, 'N', '2002-01-10', null);

  insert into comprador
  (cd_comprador, nm_comprador, nr_cpf, nm_cidade,
  nm_bairro, sg_estado, telefone, email)
values
(1, 'Emmanuel Antunes', 12345678901, 'SãoPaulo',
  'Jardins', 'SP', '11111111111', 'eantunes@novatec.com.br'),
(2, 'Joana Pereira', 23456789012, 'Rio de Janeiro',
  'Flamengo', 'RJ', '22222222222', 'jpereira@novatec.com.br'),
(3, 'Ronaldo Campelo', 34567890123, 'SãoPaulo',
  'Aeroporto', 'SP', '33333333333', 'rcampelo@novatec.com.br'),
(4, 'Manfred Autgusto', 45678901234, 'Rio de Janeiro',
  'Aeroporto', 'RJ', '44444444444', 'maugusto@novatec.com.br');

insert into oferta
(cd_comprador, cd_imovel, vl_oferta, dt_oferta)
values
(1, 1, 170000, '2002-01-10'),
(1, 3, 180000, '2002-01-11'),
(2, 2, 135000, '2002-02-15'),
(2, 4, 100000, '2002-02-16'),
(3, 1, 160000, '2002-01-05'),
(3, 2, 140000, '2002-02-02');

insert into faixa_imovel
(cd_faixa,nm_faixa,
vl_minimo,vl_maximo)
values
(1,'baixo',0,105000),
(2,'médio',105001,18000),
(3,'alto',180001,999999);

set SQL_SAFE_UPDATES = 0;

update imovel
set vl_preco = vl_preco * 1.1;

update imovel
set vl_preco = vl_preco * 0.95
where cd_vendedor = 1;

update comprador
set sg_estado = 'SP',
    sg_estado = 'RJ'
where cd_comprador = 3; 

update oferta
set vl_oferta = 101000
where cd_comprador = 2
and cd_imovel = 4;

delete from oferta
where cd_comprador = 3
and cd_imovel = 1;

delete from bairro
where cd_cidade = 3;

delete from cidade
where cd_cidade = 3;

select * from bairro;

select cd_comprador, nm_comprador, email from comprador;

select cd_vendedor, nm_vendedor, email from vendedor order by nm_vendedor;

select cd_vendedor, nm_vendedor, email from vendedor order by nm_vendedor desc;

select nm_bairro from bairro where sg_estado = 'SP';

select cd_imovel, cd_vendedor, vl_preco from imovel where cd_vendedor = 2;

select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel where vl_preco < 150000 and sg_estado = 'RJ';

select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel where vl_preco < 150000 or cd_vendedor = 1;

select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel where vl_preco < 150000 and cd_vendedor <> 2;

select cd_comprador, nm_comprador, sg_estado from comprador where sg_estado is null;

select cd_comprador, nm_comprador, sg_estado from comprador where sg_estado is not null;

select * from oferta where vl_oferta between 100000 and 150000;

select * from oferta where dt_oferta between '2002-02-01' and '2002-03-01';

select * from vendedor where nm_vendedor like 'M%';

select * from vendedor where nm_vendedor like 'M%';

select * from vendedor where nm_vendedor like '_A%';
 
select * from imovel where cd_imovel in (2, 3) order by nm_endereco;

select * from oferta where cd_imovel in (2, 3) and vl_oferta > 140000 order by dt_oferta desc;

select * from imovel where (vl_preco between 110000 and 200000) or cd_vendedor = 1 order by nr_areautil;

set SQL_SAFE_UPDATES = 1;
create DATABASE db_assembleia;
use db_assembleia;

create table tb_pauta (
id_pauta integer auto_increment primary key,
autor varchar(100),
titulo varchar(100),
texto varchar(4000),
qtd_respostas integer not null default 1,
dt_criacao TIMESTAMP
);

create table tb_resposta(
id_resposta integer auto_increment primary key,
id_pauta integer not null default 0,
texto varchar(100),
    foreign key (id_pauta) references tb_pauta (id_pauta)
);

create table tb_sessao(
id_sessao integer auto_increment primary key,
id_pauta integer not null default 0,
dt_inicio TIMESTAMP,
dt_fim TIMESTAMP
);

create user 'assembleia' identified by 'a55emble1a';
grant select, insert, update, delete on tb_pauta to assembleia;
grant select, insert, update, delete on tb_resposta to assembleia;
grant select, insert, update, delete on tb_sessao to assembleia;
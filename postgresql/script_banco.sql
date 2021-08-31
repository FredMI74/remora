CREATE TABLE remora.ativos (
    id     BIGSERIAL NOT NULL,
	ativo varchar(50) not null
);

insert into remora.ativos (ativo) values ('WDOZ19');
insert into remora.ativos (ativo) values ('PETR4');
insert into remora.ativos (ativo) values ('ITUB4');
insert into remora.ativos (ativo) values ('VALE5');
insert into remora.ativos (ativo) values ('GGBR4');
insert into remora.ativos (ativo) values ('BBAS3');
insert into remora.ativos (ativo) values ('BBDC4');
insert into remora.ativos (ativo) values ('ABEV3');


CREATE TABLE remora.livro_ofertas (
    id     BIGSERIAL NOT NULL,
	ativo varchar(50) not null,
    data_hora timestamp without time zone NOT NULL,
    corretora  VARCHAR(50) NOT NULL,
	operacao varchar(1) not null,
	qtd integer not null,
	preco decimal(15,2) NOT NULL,
	id_tt bigint
);

ALTER TABLE remora.livro_ofertas
    ADD CHECK ( operacao IN (
        'C',
        'V'
    ) );

CREATE INDEX livroofertas_ativo_idx ON
    remora.livro_ofertas (
        ativo
    ASC );
	
CREATE INDEX livro_ofertas_corretora_idx ON
    remora.livro_ofertas (
        corretora
    ASC );
	
CREATE INDEX livro_ofertas_operacao_idx ON
    remora.livro_ofertas (
        operacao
    ASC );	
	
	
CREATE INDEX livro_ofertas_data_idx ON
    remora.livro_ofertas (
        date(data_hora)
    ASC );	

CREATE INDEX livro_ofertas_id_tt_idx ON
    remora.livro_ofertas (
        id_tt
    ASC );	


ALTER TABLE remora.livro_ofertas ADD CONSTRAINT livro_ofertas_pk PRIMARY KEY ( id );


CREATE TABLE remora.times_trades (
    id     BIGSERIAL NOT NULL,
	ativo varchar(50) not null,
    data_hora timestamp without time zone NOT NULL,
    corretora_compra  VARCHAR(50) NOT NULL,
    corretora_venda  VARCHAR(50) NOT NULL,
	agressor varchar(1) not null,
	qtd integer not null,
	preco decimal(15,2) NOT NULL,
	variacao_abertura decimal(15,2)
);

ALTER TABLE remora.times_trades
    ADD CHECK ( agressor IN (
        'C',
        'V',
		'D'
    ) );
	
CREATE INDEX times_trades_ativo_idx ON
    remora.times_trades (
        ativo
    ASC );
	
CREATE INDEX times_trades_corretora_compra_idx ON
    remora.times_trades (
        corretora_compra
    ASC );

CREATE INDEX times_trades_corretora_venda_idx ON
    remora.times_trades (
        corretora_venda
    ASC );
	
CREATE INDEX timest_rades_agressor_idx ON
    remora.times_trades (
        agressor
    ASC );	
	
CREATE INDEX timest_rades_qtd_idx ON
    remora.times_trades (
        qtd
    ASC );	
	
CREATE INDEX timest_rades_data_hora_idx ON
    remora.times_trades (
        data_hora
    ASC );		
	
ALTER TABLE remora.times_trades ADD CONSTRAINT times_trades_pk PRIMARY KEY ( id );	

CREATE TABLE remora.log_analise (
    id     BIGSERIAL NOT NULL,
	ativo varchar(50) not null,
    data_hora timestamp without time zone NOT NULL,
    texto varchar(2000) 
);	

CREATE TABLE remora.resultados (
    id     BIGSERIAL NOT NULL,
	ativo varchar(50) not null,
    data timestamp without time zone NOT NULL,
  	op_positivas integer not null,
  	op_negativas integer not null,
	resultado decimal(15,2) NOT NULL
);

CREATE INDEX resultados_data_idx ON
    remora.resultados (
        data
    ASC );	
	

CREATE INDEX resultados_ativo_idx ON
    remora.resultados (
        ativo
    ASC );


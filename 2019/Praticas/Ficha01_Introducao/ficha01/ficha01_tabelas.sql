-- comando para criar a tabela T_LEITOR 

CREATE TABLE t_leitor(
	num_leitor	INTEGER		PRIMARY KEY,
	nome		VARCHAR2(20)	NOT NULL,
	morada		VARCHAR2(20)	NOT NULL,
	telefone	NUMBER(9)	NOT NULL,
	profissao	VARCHAR2(20)	NOT NULL,
	email		VARCHAR2(20),
	seguro		INTEGER 	CHECK (seguro<=10000)	NOT NULL,
	num_requisicoes	INTEGER		CHECK (num_requisicoes>=0) NOT NULL
);


-- comando para criar a tabela T_LIVRO

CREATE TABLE t_livro(
	cod_livro	CHAR(14),
	nome_livro	VARCHAR2(40)	NOT NULL,
	autor		VARCHAR2(50)	NOT NULL,
	editora		VARCHAR2(50)	NOT NULL,
	data_edicao	DATE		NOT NULL,
	edicao		NUMBER(2)	CHECK (edicao>0) NOT NULL,
	descricao	VARCHAR2(500),
	valor_seguro	NUMBER(5)	DEFAULT (0),
	CONSTRAINT	pk_livro 	PRIMARY KEY(cod_livro),
	CONSTRAINT	ck_livro_valor_seguro CHECK (valor_seguro>=0)
);


-- comando para criar a tabela T_REQUISICAO
CREATE TABLE t_requisicao(
	id_requisicao			INTEGER,
	cod_livro				CHAR(14)		NOT NULL,
	num_leitor				INTEGER			NOT NULL,
	nome_leitor				VARCHAR2(30)	NOT NULL,
	data_requisicao			DATE			NOT NULL,
	data_entrega_prevista	DATE			NOT NULL,
	data_entrega_real		DATE,
	coima					NUMBER(2,2),
	CONSTRAINT	pk_requisicao 	PRIMARY KEY(id_requisicao),
	CONSTRAINT	fk_requisicao_numLeitor FOREIGN KEY (num_leitor) REFERENCES t_leitor(num_leitor),
	CONSTRAINT	fk_requisicao_codLivro FOREIGN KEY (cod_livro) REFERENCES t_livro(cod_livro),
	CONSTRAINT	ck_requisicao_coima CHECK (coima>0),
	CONSTRAINT	ck_requisicao_data CHECK (data_entrega_prevista >= data_requisicao)
);

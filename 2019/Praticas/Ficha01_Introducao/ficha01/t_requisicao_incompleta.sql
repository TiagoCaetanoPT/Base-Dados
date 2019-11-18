-- comando para criar a tabela T_REQUISICAO, mas necessita de alterações
CREATE TABLE t_requisicao(
	cod_livro				CHAR(10),
	num_leitor				INTEGER,
	data_requisicao			DATE	NOT NULL,
	data_entrega_prevista	DATE	NOT NULL,
	data_entrega_real		DATE	NOT NULL,
	coima					NUMBER(2,2) NOT NULL,
	CONSTRAINT	pk_requisicao 	PRIMARY KEY(cod_livro),
	CONSTRAINT	fk_requisicao_numLeitor FOREIGN KEY (num_leitor) REFERENCES t_leitor(num_leitor),
	CONSTRAINT	ck_requisicao_coima CHECK (coima<>0)
);

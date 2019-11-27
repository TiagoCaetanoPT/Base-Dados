CREATE TABLE instituicao(
   id       NUMBER(3),
   nome		VARCHAR2(30)   NOT NULL,
   campus	CHAR(1)        NOT NULL,
   CONSTRAINT pk_instituicao_id PRIMARY KEY(id)
);


CREATE TABLE instituicao_ensino(
   id       NUMBER(3),
   CONSTRAINT pk_instituicaoensino_id PRIMARY KEY(id),
   CONSTRAINT fk_instituicaoensino_id FOREIGN KEY(id) REFERENCES instituicao(id)
);

CREATE TABLE pessoa(
   id			NUMBER(6),
   prim_nome	VARCHAR2(40) NOT NULL,
   ult_nome		VARCHAR2(20) NOT NULL,
   genero    	CHAR(1)      DEFAULT ('M') NOT NULL,
   nif       	CHAR(9)    	 NOT NULL,
   id_inst		NUMBER(3)    NOT NULL,
   CONSTRAINT pk_pessoa_id		PRIMARY KEY(id),
   CONSTRAINT fk_pessoa_idinst 	FOREIGN KEY(id_inst) REFERENCES instituicao_ensino(id),
   CONSTRAINT ck_pessoa_genero 	CHECK(genero in('F','M','O')),
   CONSTRAINT uq_pessoa_nif		UNIQUE(nif)
);

CREATE TABLE telefone(
   id_pessoa    NUMBER(6),
   num_telefone CHAR(9),
   CONSTRAINT pk_telefone	PRIMARY KEY (id_pessoa, num_telefone),
   CONSTRAINT fk_telefone_idpessoa FOREIGN KEY(id_pessoa) REFERENCES pessoa(id)
);

CREATE TABLE docente(
   id		NUMBER(6),
   area		VARCHAR2(20)	NOT NULL,
   grau		CHAR			NOT NULL,
   salario	NUMBER(7,2)		NOT NULL, 
   CONSTRAINT pk_docente_id	PRIMARY KEY(id),
   CONSTRAINT fk_docente_id FOREIGN KEY(id) REFERENCES pessoa(id),
   CONSTRAINT ck_docente_grau    CHECK(grau IN ('B', 'L', 'M', 'D')),
   CONSTRAINT ck_docente_salario CHECK(salario>=0)
);

CREATE TABLE aluno(
	id					      NUMBER(6),
	curso				      VARCHAR2(30)			   NOT NULL,
	ano_escolar			   CHAR(1) 	DEFAULT (1)    NOT NULL,
	ano_letivo_entrada   CHAR(9) 		   		   NOT NULL,
	tem_beneficios		   CHAR(1) 	DEFAULT('N')   NOT NULL,
	CONSTRAINT pk_aluno_id	PRIMARY KEY(id),
	CONSTRAINT fk_aluno_id	FOREIGN KEY(id) REFERENCES pessoa(id),
	CONSTRAINT ck_aluno_ano	CHECK(ano_escolar BETWEEN '1' AND '5'),
	CONSTRAINT ck_aluno_ben	CHECK(tem_beneficios IN ('N','S'))
);

CREATE TABLE cantina (
	numero		NUMBER(1),
	nome		VARCHAR2(40)	NOT NULL,
	total_mesas	NUMBER(3) 		NOT NULL,
	id_inst		NUMBER(3),
	CONSTRAINT pk_cantina PRIMARY KEY(numero,id_inst),
	CONSTRAINT fk_cantina_idinst FOREIGN KEY (id_inst) REFERENCES instituicao(id),
	CONSTRAINT ck_cantina_totalmesas CHECK (total_mesas>0)
);

CREATE TABLE docs_grau(
   grau    CHAR    NOT NULL,
   numDocs INTEGER NOT NULL,
   idInst  NUMBER(3) NOT NULL
);


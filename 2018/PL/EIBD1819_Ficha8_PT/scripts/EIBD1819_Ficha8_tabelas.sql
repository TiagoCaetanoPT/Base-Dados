CREATE TABLE t_instituicao(
   id       NUMBER(6),
   nome      VARCHAR2(15) NOT NULL,
   deEnsino   CHAR(1)	   DEFAULT('S') NOT NULL,  -- S=instituição de ensino; N=instituição administrativa
   numAlunos  NUMBER(5),
   numDocs    NUMBER(3),
   CONSTRAINT pk_instituicao_id PRIMARY KEY(id),
   CONSTRAINT ck_instituicao_numAlunos CHECK(numAlunos>=0),
   CONSTRAINT ck_instituicao_numDocs CHECK(numDocs>=0),
   CONSTRAINT ck_instituicao_deEnsino CHECK (UPPER(deEnsino) IN ('S','N'))
);

CREATE TABLE t_pessoa(
   id        NUMBER(6),
   nome      VARCHAR2(20) NOT NULL,
   genero    CHAR(1)      DEFAULT ('M'),
   nif       NUMBER(9)    NOT NULL,
   telefoneMaisUsado       CHAR(9),
   tipo      CHAR         NOT NULL,
   idInst    NUMBER(6)    NOT NULL,
   CONSTRAINT pk_pessoa_id  PRIMARY KEY(id),
   CONSTRAINT fk_pessoa_idInst FOREIGN KEY(idInst) REFERENCES t_instituicao(id),
   CONSTRAINT ck_pessoa_tipo CHECK(tipo in('A','D')),
   CONSTRAINT ck_pessoa_genero CHECK(genero in('F','M')),
   CONSTRAINT  uk_pessoa_nif  UNIQUE(nif),
   CONSTRAINT  ck_pessoa_nif  CHECK (nif>99999999)
);

CREATE TABLE t_telefone(
   idPessoa    NUMBER(6),
   numTelefone CHAR(9),
   CONSTRAINT pk_telefone  PRIMARY KEY (idPessoa, numTelefone),
   CONSTRAINT fk_telefone_idPessoa FOREIGN KEY(idPessoa)  REFERENCES t_pessoa(id)
);

CREATE TABLE t_docente(
   id         NUMBER(6),
   area       VARCHAR2(12) NOT NULL,
   grau       CHAR         NOT NULL,
   salario    NUMBER(7,2)  NOT NULL, 
   CONSTRAINT pk_docente_id PRIMARY KEY(id),
   CONSTRAINT fk_docente_id FOREIGN KEY(id) REFERENCES t_pessoa(id),
   CONSTRAINT ck_docente_grau    CHECK(grau in('B', 'L', 'M', 'D')),
   CONSTRAINT ck_docente_salario CHECK(salario>=0)
);

-- tabela ainda sem restrições de integridade
CREATE TABLE t_aluno(
   id        NUMBER(6),
   curso      VARCHAR2(30),
   ano        NUMBER(1)    DEFAULT (1),
   temBeneficios   CHAR(1) DEFAULT('N')
);

CREATE TABLE t_docs_grau(
   grau    CHAR    NOT NULL,
   numDocs INTEGER NOT NULL,
   idInst  NUMBER(6) NOT NULL
);

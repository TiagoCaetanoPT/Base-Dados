CREATE TABLE tipo_conta(
   id        NUMBER(3),
   tipo      VARCHAR2(30) NOT NULL,
   juro      NUMBER(4,2)  NOT NULL,
   CONSTRAINT pk_tipoConta_id PRIMARY KEY(id),
   CONSTRAINT uq_tipoConta_tipo UNIQUE(tipo)
);

CREATE TABLE agencia(
   id        NUMBER(3),
   nome      VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_agencia_id PRIMARY KEY(id),
   CONSTRAINT uq_agencia_nome UNIQUE(nome)
);

CREATE TABLE conta(
   id          NUMBER(7),
   iban        CHAR(24),
   saldo       NUMBER(10,2) NOT NULL,
   idTipoConta NUMBER(3) NOT NULL,
   idAgencia   NUMBER(3) NOT NULL,
   CONSTRAINT pk_conta_id PRIMARY KEY(id),
   CONSTRAINT uq_conta_iban UNIQUE(iban),
   CONSTRAINT fk_conta_idTipoConta FOREIGN KEY(idTipoConta) REFERENCES tipo_Conta(id),
   CONSTRAINT fk_conta_idAgencia FOREIGN KEY(idAgencia) REFERENCES agencia(id),
   CONSTRAINT ck_conta_iban CHECK (REGEXP_LIKE(iban,'(PT)[0-9]{22}'))
);

CREATE TABLE cliente(
   id        NUMBER(7),
   nome      VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_cliente_id  PRIMARY KEY(id)
);

CREATE TABLE conta_cliente(
   idCliente    NUMBER(7),
   idConta      NUMBER(7),
   titular      CHAR(1) NOT NULL,
   CONSTRAINT pk_contaCliente PRIMARY KEY(idCliente,idConta),
   CONSTRAINT fk_contaCliente_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(id),
   CONSTRAINT fk_contaCliente_idConta FOREIGN KEY(idConta) REFERENCES conta(id),
   CONSTRAINT ck_contaCliente_titular CHECK(titular IN ('S','N'))
);

CREATE TABLE operacao(
   idOperacao    NUMBER(7),
   data_operacao DATE NOT NULL,
   idCliente     NUMBER(7) NOT NULL,
   idConta       NUMBER(7) NOT NULL,   
   CONSTRAINT pk_Operacao PRIMARY KEY(idOperacao),
   CONSTRAINT fk_idCliente FOREIGN KEY(idCliente) REFERENCES cliente(id),
   CONSTRAINT fk_idConta FOREIGN KEY(idConta) REFERENCES conta(id)
);

CREATE TABLE operacao_fecho(
   idOpFecho     NUMBER(7),
   razao         VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_OperacaoFecho PRIMARY KEY(idOpFecho),
   CONSTRAINT fk_idOperacaoFecho FOREIGN KEY(idOpFecho) REFERENCES operacao(idOperacao)
);

CREATE TABLE operacao_dep_lev(
   idOpDL        NUMBER(7),
   quantia       NUMBER(10,2) NOT NULL,
   CONSTRAINT pk_OperacaoDepLev PRIMARY KEY(idOpDL),
   CONSTRAINT fk_idOperacaoDepLev FOREIGN KEY(idOpDL) REFERENCES operacao(idOperacao)
);


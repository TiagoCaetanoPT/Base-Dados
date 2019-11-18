CREATE TABLE departamento(
	numdep		INTEGER		PRIMARY KEY,
	nomedep		VARCHAR2(20),
	localizacao	VARCHAR2(20)
);

CREATE TABLE empregado(
	numemp		INTEGER		PRIMARY KEY,
	nomeemp		VARCHAR2(20),
	funcao		VARCHAR2(20),
	chefe		INTEGER REFERENCES empregado(numemp),
	dtaContratacao	DATE,
	salario		INTEGER,
	comissao	INTEGER,
	numdep		INTEGER REFERENCES departamento(numdep)
);

CREATE TABLE escala_salarial(
	escala		INTEGER		PRIMARY KEY,
	minsal		NUMBER(5),
	maxsal		NUMBER(5)
);

CREATE TABLE historico_funcao (
	IDhist		INTEGER		PRIMARY KEY, 
	numemp		INTEGER		REFERENCES empregado(numemp),
	funcao		VARCHAR2(20),
	dtaInicio	DATE,
	dtaFim		DATE,
	numdep		INTEGER		REFERENCES departamento(numdep)
);


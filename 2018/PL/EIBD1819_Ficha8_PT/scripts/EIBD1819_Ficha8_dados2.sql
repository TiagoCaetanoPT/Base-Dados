-- insere docentes
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Carlos Manuel','M',210456789,'D',2);
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Carlos Paredes','M',267654312,'D',2);
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Sousa Cintra','M',211991837,'D',3);
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Rita Seabra','F',264213897,'D', 2);
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Ana Silva','F',211007682,'D', 2);
INSERT INTO t_pessoa (nome,genero,nif,tipo,idInst) VALUES ('Jos� Dam�sio','M',219009878,'D', 3);

INSERT INTO t_docente (id,area,grau,salario) VALUES (1,'Inform�tica','L',1300);
INSERT INTO t_docente (id,area,grau,salario) VALUES (2,'Mec�nica','M',1500);
INSERT INTO t_docente (id,area,grau,salario) VALUES (3,'L�nguas','M',1500);
INSERT INTO t_docente (id,area,grau,salario) VALUES (4,'Inform�tica','L',1200);
INSERT INTO t_docente (id,area,grau,salario) VALUES (5,'Gest�o','D',1800);
INSERT INTO t_docente (id,area,grau,salario) VALUES (6,'Gest�o','D',1800);

INSERT INTO t_telefone (numTelefone, idPessoa) VALUES (244009586, 2);
INSERT INTO t_telefone (numTelefone, idPessoa) VALUES (966525772, 2);

COMMIT;

/
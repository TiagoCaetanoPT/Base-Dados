-- Dados de LEITORES 

INSERT INTO t_leitor (num_leitor, nome, morada, telefone, email, profissao, SEGURO, num_requisicoes) 
VALUES (3, 'Pedro Mendes', 'Leiria', 253699653, 'mendes77@gmail.pt', 'Cabeleireiro',0,0);
INSERT INTO t_leitor (num_leitor, nome, morada, telefone, email, profissao, seguro, num_requisicoes) 
VALUES (4, 'Carla Sousa', 'Lisboa', 965555555, NULL, 'Gestora',100,0);
INSERT INTO t_leitor (num_leitor, nome, morada, telefone, email, profissao, seguro, num_requisicoes) 
VALUES (6, 'Ana Brites','Coimbra', 325669966, 'didi@hotmail.com', 'Professor',10000,0);


-- Dados de LIVROS

INSERT INTO t_livro (cod_livro, nome_livro, autor, editora, data_edicao, edicao, descricao) 
VALUES ('11-11-11-INFOR', 'Bases de Dados para EI', 'Antoine Figueirinha', 'Abril Editora', TO_DATE('12-12-1999','dd-mm-yyyy'), 1, NULL);
INSERT INTO t_livro (cod_livro, nome_livro, autor, editora, data_edicao, edicao, descricao, valor_seguro) 
VALUES ('22-22-22-MATEM', 'Fun Mathematics', 'Brian Bolt', 'Bertrand', TO_DATE('10-10-1980','dd-mm-yyyy'), 3, 'Para todas as idades', 200);
INSERT INTO t_livro (cod_livro, nome_livro, autor, editora, data_edicao, edicao, descricao, valor_seguro) 
VALUES ('33-33-33-FILOS', 'Filosofia Grega', 'Completeu', 'Abril Jornal', TO_DATE('10-10-2000','dd-mm-yyyy'), 1, 'Para coleccionadores', 8000);
INSERT INTO t_livro (cod_livro, nome_livro, autor, editora, data_edicao, edicao, descricao) 
VALUES ('44-44-44-INFOR', 'Bases de Dados para EI', 'Filipe Pedro', 'Abril Jornal', TO_DATE('01-01-2001','dd-mm-yyyy'), 2, 'Excelente');

--  CONFIRMA AS INSERÇÕES REALIZADAS
COMMIT;


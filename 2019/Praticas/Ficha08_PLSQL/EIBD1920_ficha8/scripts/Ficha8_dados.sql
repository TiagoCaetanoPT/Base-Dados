-- Inserir institui��es 
INSERT INTO instituicao (id,nome,campus) VALUES (1,'SAS-IPL',0);
-- 1� institui��o de ensino
INSERT INTO instituicao (id,nome,campus) VALUES (2,'ESTG',2);
INSERT INTO instituicao_ensino (id) VALUES (2);
-- 2� institui��o de ensino
INSERT INTO instituicao (id,nome,campus) VALUES (3,'ESEL',1);
INSERT INTO instituicao_ensino (id) VALUES (3);
-- 3� institui��o de ensino
INSERT INTO instituicao (id,nome,campus) VALUES (4,'ESSLEI',2);
INSERT INTO instituicao_ensino (id) VALUES (4);

-- 1� docente
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (1,'Charles', 'Babbage', 'M', 210056789, 2);
INSERT INTO docente (id, area, grau, salario) VALUES (1, 'Inform�tica', 'L', 1900);
-- 2� docente
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (2,'Alan Mathinson', 'Turing', 'M', 209837664, 2);
INSERT INTO docente (id, area, grau, salario) VALUES (2, 'Inform�tica', 'D', 2150);
-- 3� docente
INSERT INTO pessoa (id, prim_nome, ult_nome, nif, id_inst) VALUES (3,'Steven Paul', 'Jobs', 220091281, 2);
INSERT INTO docente (id, area, grau, salario) VALUES (3, 'Inform�tica', 'B', 1700);
-- 4� docente
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (4,'Grace Murray', 'Hopper', 'F', 254040495, 2);
INSERT INTO docente (id, area, grau, salario) VALUES (4, 'Inform�tica', 'D', 2200);
-- 5� docente
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (5,'Ada', '"Lovelace"', 'F', 200986751, 2);
INSERT INTO docente (id, area, grau, salario) VALUES (5, 'Inform�tica', 'L', 1900);
-- 1� aluno
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (6,'William "Bill" Henry', 'Gates', 'M', 198274653, 2);
INSERT INTO aluno (id, curso, ano_escolar, ano_letivo_entrada, tem_beneficios) VALUES (6, 'Engenharia Inform�tica', 2, '2018/2019', 'N');
-- 2� aluno
INSERT INTO pessoa (id, prim_nome, ult_nome, genero, nif, id_inst) VALUES (7,'Jean William Fritz', 'Piaget', 'M', 198775683, 3);
INSERT INTO aluno (id, curso, ano_escolar, ano_letivo_entrada, tem_beneficios) VALUES (7, 'Psicologia', 2, '2018/2019', 'S');

-- Associar contatos telef�nicos a pessoas
INSERT INTO telefone (num_telefone, id_pessoa) VALUES (244009586, 2);
INSERT INTO telefone (num_telefone, id_pessoa) VALUES (966525772, 2);
INSERT INTO telefone (num_telefone, id_pessoa) VALUES (244001927, 3);
INSERT INTO telefone (num_telefone, id_pessoa) VALUES (914425356, 4);
INSERT INTO telefone (num_telefone, id_pessoa) VALUES (967748574, 4);

-- Inserir cantinas
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (1,'Cantina 1', 120, 2);
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (2,'Cantina 2', 110, 2);
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (3,'Snack-bar', 40, 2);
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (4,'Bar', 20, 2);
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (1,'Cantina 1', 90, 3);
INSERT INTO cantina (numero, nome, total_mesas, id_inst) VALUES (2,'Bar', 30, 3);

COMMIT;
-- Na conta SYS (apenas se trabalhar na m�quina virtual das aulas)
-- Cria��o de contas
CREATE USER presidente IDENTIFIED BY p;
CREATE USER coordenador IDENTIFIED BY c;

-- Atribui��o de privil�gios �s contas
GRANT CREATE SESSION TO presidente, coordenador;



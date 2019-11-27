-- Na conta SYS (apenas se trabalhar na máquina virtual das aulas)
-- Criação de contas
CREATE USER presidente IDENTIFIED BY p;
CREATE USER coordenador IDENTIFIED BY c;

-- Atribuição de privilégios às contas
GRANT CREATE SESSION TO presidente, coordenador;



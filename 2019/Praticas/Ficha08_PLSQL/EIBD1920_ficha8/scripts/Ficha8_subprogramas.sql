CREATE OR REPLACE FUNCTION f_nomeCompleto
(p_idP pessoa.id%TYPE,p_formato CHAR)
RETURN VARCHAR2
IS
	primeiroNome pessoa.prim_nome%TYPE;
	ultimoNome pessoa.ult_nome%TYPE;

BEGIN
	SELECT prim_nome,ULT_NOME INTO primeiroNome,ultimoNome
	FROM pessoa
  WHERE id = p_idP;

  IF p_formato = 'A' THEN
    RETURN primeiroNome || ' ' || ultimoNome;
  ELSIF p_formato = 'B' THEN
    RETURN ultimoNome || ' ' || primeiroNome;
  ELSE
    RETURN NULL;
  END IF;
END f_nomeCompleto;
/

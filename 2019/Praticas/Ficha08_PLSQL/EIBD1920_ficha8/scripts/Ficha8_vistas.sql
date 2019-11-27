CREATE OR REPLACE VIEW v_total_doutorados
AS
	SELECT p.id_inst AS instituicao, COUNT(*) AS total_doutorados 
	FROM pessoa p JOIN docente d
		ON p.id = d.id
	WHERE d.grau = 'D'
	GROUP BY p.id_inst
;

-- OU 

CREATE OR REPLACE VIEW v_total_doutorados
(instituicao, total_doutorados)
AS
	SELECT p.id_inst, COUNT(*)
	FROM pessoa p JOIN docente d
		ON p.id = d.id
	WHERE d.grau = 'D'
	GROUP BY p.id_inst
;


DELIMITER //
DROP FUNCTION IF EXISTS DBSPJC.proxHorarioDisponivel //

DELIMITER //
CREATE FUNCTION DBSPJC.proxHorarioDisponivel(dataPauta VARCHAR(20), juizado int)
RETURNS INT
NOT DETERMINISTIC
BEGIN 
	declare proximaHora int;
	set proximaHora= 0;
    
	SELECT MAX(HOUR(hora)) into proximaHora 
	FROM DBSPJC.Pauta p
		INNER JOIN DBSPJC.Audiencia au ON au.pauta= p.id 
	WHERE p.juizado = juizado AND p.dataAgendamento = dataPauta;
	
	if ( proximaHora > 18 ) then
		set proximaHora= 0;
	else 
		set proximaHora= (proximaHora + 1);
	end if;

	return proximaHora;
end //
			
-- SELECT DBSPJC.proxHorarioDisponivel('2019-06-10', 2);

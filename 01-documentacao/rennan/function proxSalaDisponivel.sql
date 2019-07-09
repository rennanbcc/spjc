USE DBSPJC;


delimiter //
DROP FUNCTION IF EXISTS DBSPJC.proxSalaDisponivel //

delimiter :
create function DBSPJC.proxSalaDisponivel(npu VARCHAR(20)) 
returns varchar(20)
deterministic
begin
	declare proxSala varchar(20);
	set proxSala = '';
    
    select sala INTO proxSala
	from DBSPJC.Processo ps JOIN DBSPJC.Audiencia aud ON ps.npu = aud.processo
	where (aud.hora= '13:00:00' OR aud.hora = '14:00:00' OR aud.hora = '15:00:00' OR aud.hora= '16:00:00' OR aud.hora = '17:00:00' OR aud.hora = '18:00:00');
	   
	return proxSala;

end; :

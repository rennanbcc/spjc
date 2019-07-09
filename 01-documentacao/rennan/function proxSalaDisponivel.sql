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
	where (DATEDIFF(HOUR,current_time(),aud.hora));
	   
	return proxSala;

end; :

USE DBSPJC;


delimiter //
DROP FUNCTION IF EXISTS DBSPJC.proxSalaDisponivel //

delimiter :
create function DBSPJC.proxSalaDisponivel(npu VARCHAR(20)) 
returns varchar(20)
begin
	declare currentt time;
	declare proxSala varchar(20);
	set proxSala = '';
    set currentt = STR_TO_DATE(current_time(),'%h%m%s');
    
    select sala INTO proxSala
	from DBSPJC.Processo ps JOIN DBSPJC.Audiencia aud ON ps.npu = aud.processo
	where (TIMEDIFF(HOUR,currentt,aud.hora));
	   
	return proxSala;

end; :

USE DBSPJC;


delimiter //
DROP FUNCTION IF EXISTS DBSPJC.proxSalaDisponivel //

delimiter :
create function DBSPJC.proxSalaDisponivel(id INTEGER) 
returns varchar(20)
deterministic
begin
	declare proxSala varchar(20);
	set proxSala = '';
    
    select sala INTO proxSala
	from DBSPJC.Audiencia ps
	where ps.id = id
		and (ps.hora= '13:00:00' OR ps.hora = '14:00:00' OR ps.hora = '15:00:00' OR ps.hora= '16:00:00' OR ps.hora = '17:00:00' OR ps.hora = '18:00:00');
	   
	return proxSala;

end; :

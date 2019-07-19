delimiter //
DROP TRIGGER IF EXISTS DBSPJC.idadeInsert; //

create trigger DBSPJC.idadeInsert
before INSERT on DBSPJC.ProcessoTestemunha
for each row
begin
	update DBSPJC.Testemunha ex
    set idade = (
		 if(MONTH(CURDATE()) > MONTH(ex.dataNascimento) OR (MONTH(CURDATE()) = MONTH(ex.dataNascimento) AND DAY(CURDATE()) >= DAY(ex.dataNascimento)),(YEAR(CURDATE())-YEAR(ex.dataNascimento)), ((YEAR(CURDATE())-YEAR(ex.dataNascimento))-1)));
       
end; //

delimiter //
DROP TRIGGER IF EXISTS DBSPJC.idadeInsert; //

create trigger DBSPJC.idadeInsert
before insert on DBSPJC.Testemunha
for each row
begin
	update DBSPJC.Testemunha
    set idade = (
    CASE 
        WHEN 
        MONTH(GETDATE()) > MONTH(dataNascimento) -- *1
        OR
        -- *2
        (
            MONTH(GETDATE()) = MONTH(dataNascimento) 
            AND DAY(GETDATE()) >= DAY(dataNascimento) 
        )
    THEN DATEDIFF(YEAR, dataNascimento, GETDATE()) 
    ELSE DATEDIFF(YEAR, dataNascimento, GETDATE()) -1 END
);
end; //

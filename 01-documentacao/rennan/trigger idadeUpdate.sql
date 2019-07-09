delimiter //
DROP TRIGGER IF EXISTS DBSPJC.idadeUpdate; //

create trigger DBSPJC.idadeUpdate
before update on DBSPJC.Testemunha
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

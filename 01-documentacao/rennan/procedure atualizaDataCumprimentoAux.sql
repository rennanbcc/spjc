delimiter //
DROP PROCEDURE IF EXISTS DBSPJC.atualizarDataCumprimento //
delimiter $
create procedure DBSPJC.atualizarDataCumprimento(IN pNpu varchar(20))
begin
	declare nNumeroParcelas INTEGER;
    declare nNumeroParcelasPagas INTEGER;
    select numeroParcelas, numeroParcelasPagas into nNumeroParcelas,nNumeroParcelasPagas
    from DBSPJC.Execucao ex
    where ex.id = pNpu;
    
    
	if (nNumeroParcelas = nNumeroParcelasPagas) then 
	update DBSPJC.Execucao ex
    set ex.pago = true
    where ex.id = pNpu;
    end if;
end $
delimiter ;

delimiter //
DROP PROCEDURE IF EXISTS DBSPJC.atualizarDataCumprimento //
delimiter $
create procedure DBSPJC.atualizarDataCumprimento(IN pNpu varchar(20))
begin
	declare nNumeroParcelas INTEGER;
    declare nNumeroParcelasPagas INTEGER;
    declare npago BOOLEAN;
    select numeroParcelas, numeroParcelasPagas, pago into nNumeroParcelas,nNumeroParcelasPagas,npago
    from DBSPJC.Execucao ex
    where ex.id = pNpu;
    
	if (nNumeroParcelas = nNumeroParcelasPagas AND npago = FALSE) then 
	update DBSPJC.Execucao ex
    set ex.pago = true , ex.dataCumprimento = curdate()
    where ex.id = pNpu;
    end if;
end $
delimiter ;

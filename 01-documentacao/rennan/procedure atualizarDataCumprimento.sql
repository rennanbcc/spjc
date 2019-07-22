delimiter //
DROP PROCEDURE IF EXISTS DBSPJC.atualizarDataCumprimento //

create procedure DBSPJC.atualizarDataCumprimento(IN pNpu varchar(20))
begin 
	declare done int default 0;
    
    declare nNpu1 varchar(20);
    declare nnumeroParcelas INTEGER UNSIGNED;
    declare npago bool;
    declare nnumeroParcelasPagas INTEGER UNSIGNED;
    
    declare dproccur cursor for select numeroParcelas, numeroParcelasPagas, pago from DBSPJC.Execucao ex INNER JOIN DBSPJC.Processo pr ON ex.processo = pNpu; 
    declare continue handler for not found set done= 1;
    
    open dproccur;

    repeat
		fetch dproccur into nnumeroParcelas, nnumeroParcelasPagas, npago;
		if (nnumeroParcelasPagas = nnumeroParcelas && npago = false) then
			UPDATE DBSPJC.Execucao
            SET dataCumprimento = curdate(), pago = true
            WHERE processo = pNpu;
        else begin end; 
        end if;
	until done
    end repeat;	
    
    close dproccur;
    
    
end; //

# select * from execucao;

# call DBSPJC.atualizarDataCumprimento('00106948920198170001')

# INSERT INTO Execucao (id,processo,numeroParcelas,dataRegistro,valorTotalDivida,numeroParcelasPagas)VALUES(5,'00106948920198170001',8,'2024-06-11',18000.00,8);
 

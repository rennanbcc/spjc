USE DBSPJC;

delimiter //
DROP PROCEDURE IF EXISTS DBSPJC.atualizarDataCumprimento //

create procedure DBSPJC.atualizarDataCumprimento(IN pNpu varchar(20))
begin 
	declare done int default 0;
    
    declare nNpu1 varchar(20);
    declare nvalorTotalDivida DECIMAL(10,2);
    declare nPago bool;
    declare nvalorPago DECIMAL(10,2);
    
    declare dproccur cursor for select valorTotalDivida, nvalorPago, nPago from DBSPJC.Execucao ex, DBSPJC.Processo pr where processo= pNpu;
    declare continue handler for not found set done= 1;
    
    open dproccur;

    repeat
		fetch dproccur into nvalorPago, nvalorTotalDivida, nPago;
		if (nvalorPago = nvalorTotalDivida && nPago = false) then
			UPDATE DBSPJC.Execucao SET dataCumprimento = curdate(), nPago= true WHERE npu= pNpu;
		end if;         
	until done
    end repeat;	
    
    close dproccur;
    
end; //

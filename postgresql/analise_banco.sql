select * from remora.times_trades
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT'
order by id;

select * from remora.livro_ofertas
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT'
order by id;

select * from remora.log_analise
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT'
order by id 

/*DELETE FROM remora.times_trades
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT';


DELETE FROM remora.livro_ofertas
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT';

DELETE FROM remora.log_analise
where date(data_hora) = '2019-12-06'
and ativo = 'WDOFUT';*/



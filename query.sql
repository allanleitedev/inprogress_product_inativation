/*
SUMARIO
======================================================================

        produto: Armazena informações do cadastro geral do produto.

            produto.produto - Código de referência do produto.
            produto.pronome - Descrição do nome do produto.
----------------------------------------------------------------------

        estrutur: Armazena a ligação hierárquica entre produto e itens que o compõe.

            estrutur.estproduto - Código do produto acima na hierarquia ( produto-Pai ).
            estrutur.estfilho - Código do produto abaixo na hierarquia ( produto-Filho ).
----------------------------------------------------------------------

        ordem: Armazena as ordens de produção de um determinado produto.

            ordem.ordproduto - Código do produto a ser produzido.
            ordem.ordlotstat - Status da ordem de produção ( 'EC' = 'Encerrado' ).

*/

select distinct 
	p.produto, 
	p.pronome,
	case
		when exists (
			select 1 from estrutur e2
			where e2.estproduto = p.produto
			and e2.estfilho in ('260.726.0146','260.726.0143','260.726.0140','260.726.0137',
				'260.726.0135','260.726.0150','260.726.0148','260.726.0149','260.726.0083',
				'260.726.0085','260.726.0087','260.726.0089','260.726.0091','260.726.0093')
		) then true
		else false
	end as att,
	case 
		when exists (
			select 1 from ordem o
			where o.ordproduto = p.produto
			and o.ordlotstat <> 'EC'
		) then true 
		else false
	end as op_aberta
from produto p
inner join estrutur e on e.estproduto = p.produto
where p.grupo = 726
and p.prostatus = 'A'
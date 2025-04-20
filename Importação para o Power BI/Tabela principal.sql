SELECT 
    -- Colunas da FT0015_CarteiraCotas que você quer manter (exceto as listadas para remover)
    FT.DataRef,
	FT.DT_Ref,
	FT.ID_Produto,
	FT.ID_Bem,
	FT.ID_Comissao,
	FT.ID_Estado,
	FT.ID_Pessoa,
	FT.ID_Cota,
	FT.NUM_Proposta,
	FT.Sit_Contrato,
	FT.TP_Pessoa,
	FT.Grupo,
	FT.Cota,
	FT.Grana_Total,
	FT.FX_Atraso,
	FT.Sit_Contempla,
	FT.Fora_Desclassificado,
	FT.Macrossituacao,
	FT.TP_Assinatura,
	FT.Saldo_Devedor_Grana,
	FT.Sit_Macrosituacao,
	FT.Grana_Parcela,
	FT.FX_Parcela,
    -- Colunas dos joins
    DP.Inscricao,
    VA.Data_Entrega,
    CO.NM_Comissao,
    B.NM_Produto,
    CO.Local_Venda,
	C.Sit_Parcela
FROM 
    Base_Historica AS FT
LEFT JOIN 
    Pessoas AS DP
    ON FT.ID_Pessoa = DP.ID_Pessoa
LEFT JOIN 
    Alocacoes AS VA
    ON FT.ID_Cota = VA.ID_Cota
LEFT JOIN 
    Comissoes AS CO
    ON FT.ID_Comissionado = CO.ID_Comissionado
LEFT JOIN 
    Produtos AS B
    ON FT.ID_Produto = B.ID_Produto
-- A data de vencimento entre o primeiro dia do mês e o último dia do mês do DT_Refencia da tabela FT0015_CarteiraCotas.
LEFT JOIN HistoParcelas C ON C.ID_Cota = FT.ID_Cota AND C.DT_Vencimento between DATEADD(month, DATEDIFF(month, 0, DT_Referencia), 0) AND DT_Referencia
WHERE 
    FT.Data_Ref >= '202401'

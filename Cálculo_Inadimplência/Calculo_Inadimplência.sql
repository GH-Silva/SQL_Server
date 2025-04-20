-- Calcular o percentual de inadimplência no mês de referência
SELECT 
    (SUM(CASE WHEN Pessoas = 'Inadimplente' THEN VL_Bem ELSE 0 END) / 
     SUM(Grana_Total) * 100) AS percentual_inadimplencia
FROM 
    Custos_2025
WHERE 
   Data_Ref = '202501'

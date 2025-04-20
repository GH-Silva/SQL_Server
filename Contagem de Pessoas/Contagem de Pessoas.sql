-- APLICANDO O LEFT JOIN

select
 ST_Adimplencia,
 COUNT(DISTINCT dm.Inscricao) AS Quantidade
from
    BASE_HISTORICA ft
LEFT JOIN
    PESSOAS dm
ON 
 ft.ID_Pessoa = dm.ID_Pessoa
WHERE
 ft.ID_Produto = '107'
AND
 ft.Data_Ref = '202501'
GROUP BY 
    ST_Adimplencia
ORDER BY 
    quantidade DESC;

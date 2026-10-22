/*
=====================================================
EXERCÍCIO 01 — ANÁLISE DE VENDAS CONTOSO
=====================================================

BANCO: SQL Server
BASE: Contoso

TABELA: FactSales

COLUNAS:
- ProductKey
- SalesQuantity
- SalesAmount
- TotalCost

OBJETIVO:

A Contoso deseja identificar seus 10 produtos
com maior faturamento.

Crie uma consulta SQL que retorne:

1. O identificador do produto (ProductKey).

2. A quantidade total de unidades vendidas.

3. O faturamento total de cada produto.

4. O custo total de cada produto.

5. O lucro total de cada produto, calculado por:

   Lucro = Faturamento - Custo

6. Considere somente produtos cujo faturamento
   total seja superior a 50000.

7. Ordene do maior para o menor faturamento.

8. Retorne apenas os 10 primeiros produtos.

ESCREVA SUA SOLUÇÃO ABAIXO:

*/


USE ContosoRetailDW;
SELECT * FROM FactSales;
Select * from dimproduct

SELECT TOP(10)
	FactSales.ProductKey AS 'Id do Produto',
	DimProduct.ProductName AS 'Nome do Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendida',
	SUM(SalesAmount) AS 'Faturamento',
	SUM(TotalCost) AS 'Custo Total', 
	SUM(SalesAmount) - SUM(TotalCost) AS 'Lucro'
FROM FactSales
INNER JOIN DimProduct
ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY FactSales.ProductKey, DimProduct.ProductName
HAVING SUM(SalesAmount) > 50000
ORDER BY SUM(SalesAmount) DESC




	







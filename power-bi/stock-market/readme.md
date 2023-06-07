# Introdução

Dataset fornecido no curso da [Data Science Academy - Microsoft Power BI Para Business Intelligence e Data Science](https://www.datascienceacademy.com.br/cursosgratuitos).
O objetivo é analisar indicadores de ações de 5 empresas (IBM, Tesla, Oracle, Microsoft e Walmart).

## Análise Exploratória de Dados

- O dataset é um arquivo .csv e possui 1261 entradas e possui 7 colunas.
- Será necessário promover a primeira linha para ser utilizada como cabeçalho;
- As colunas stão com as tipos de dado errado (todos estão como texto).
- A data está no formato americano.

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Ajustadas os tipos das colunas de acordo com os dados apresentados nelas;
- Criada medidas DAX para cálculo de mês a mês (medidar ápida):
  - Média de Close MoM% = 
Média de Close MoM% = 
IF(
	ISFILTERED('StockMarket'[Data]),
	ERROR("Medidas rápidas de inteligência de tempo somente podem ser agrupadas ou filtradas pela hierarquia de data fornecida pelo Power BI ou pela coluna de data primária."),
	VAR __PREV_MONTH =
		CALCULATE(
			AVERAGE('StockMarket'[Close]),
			DATEADD('StockMarket'[Data].[Date], -1, MONTH)
		)
	RETURN
		DIVIDE(AVERAGE('StockMarket'[Close]) - __PREV_MONTH, __PREV_MONTH)
)

## Imagens

![Ações](https://github.com/lucaskotowski/data-science-portfolio/blob/main/power-bi/stock-market/img/acoes.png)

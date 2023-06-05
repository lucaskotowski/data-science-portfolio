# Introdução

Dataset fornecido no curso da [Data Science Academy - Microsoft Power BI Para Business Intelligence e Data Science](https://www.datascienceacademy.com.br/cursosgratuitos).
O objetivo é analisar alguns KPIs financeiros, tais como receitas, despesas, margem de lucro, influenciadores/segmentos e uma DRE simples.

## Análise Exploratória de Dados

- O dataset é um arquivo em .csv, com 12 entradas, porém disposto em 36 colunas, divididas por meses do ano de Jan/2019 até 12/22.
- Será necessário transpor a tabela para utilizar os dados de forma correta.
- Será necessário utilizar a primeira linha como cabeçalho e ajustar os formatos de dados.
- Não há valores nulos.

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Transposta todas as colunas para linhas, de forma a agrupar os dados por tipo e componente, deixando os demais valores como data e valor.
- Criadas algumas medidas em DAX para cálculo de lucro, margem de lucro, despesas e receitas.
  - Lucro = [TotalReceitas] - [TotalDespesas]
  - Margem de Lucro = DIVIDE([Lucro], [TotalReceitas], 0)
  - TotalDespesas = CALCULATE(SUM(DadosFinanceiros[Valor]),DadosFinanceiros[Tipo]="Despesas") 
  - TotalReceitas = CALCULATE(SUM(DadosFinanceiros[Valor]),DadosFinanceiros[Tipo]="Receitas") 

## Conclusão

- Vendas é o principal canal de receita, com cerca de 71% do total da receita.
- A maior despesa é administrativa.
- A margem de lucro no período apresentado é de 39,96%.

## Imagens

![Financeiro](https://github.com/lucaskotowski/data-science-portfolio/blob/main/power-bi/financial-analysis/img/financeiro.png)

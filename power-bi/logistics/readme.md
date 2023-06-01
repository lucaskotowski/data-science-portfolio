# Introdução

Dataset fornecido no curso da [Data Science Academy - Microsoft Power BI Para Business Intelligence e Data Science](https://www.datascienceacademy.com.br/cursosgratuitos).
O objetivo é analisar alguns indicadores quanto às entregas do setor de Logística:
- Análise de dados de entrega (totais, no prazo)
- Análise de prazos de entrega
- Análise de dados de entregas por equipe e segmento
- Ranking do vendedores
- Mapeamento de status de entrega
- Mapeamento das taxas de atraso em entregas

## Análise Exploratória de Dados

- O dataset possui 53771 entradas, separadas nas seguintes colunas: 'ID_Pedido', 'ID_Vendedor', 'ID_Cliente', 'Equipe_Entrega', 'Canal_Entrega', 'ID_Cidade', 'Data_Pedido', 'Data_Entrega_Prevista', 'Data_Entrega_Realizada' e 'Status_Entrega'
- Será necessário promover a primeira linha para ser utilizada como cabeçalho;
- As colunas stão com as tipos de dado errado (todos estão como texto).

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Ajustadas os tipos das colunas de acordo com os dados apresentados nelas;
- Criadas medidas DAX para classificar os vendedores (através das medidas rápidas), total de entregas e total de entregas dentro do prazo

  - TotalEntregas = COUNTROWS(Logistica)
  - TotalEntregasPrazo = CALCULATE(COUNTROWS(Logistica), FILTER(Logistica, Logistica[Status_Entrega] = "Antecipado" || Logistica[Status_Entrega] = "No Prazo"))

## Imagens

![Logistica](https://github.com/lucaskotowski/data-science-portfolio/blob/main/power-bi/logistics/img/logistica.png)

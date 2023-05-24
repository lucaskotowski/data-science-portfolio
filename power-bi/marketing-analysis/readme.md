# Introdução

Dataset fornecido no curso da [Data Science Academy - Microsoft Power BI Para Business Intelligence e Data Science](https://www.datascienceacademy.com.br/cursosgratuitos).
O objetivo é trazer uma breve introdução aos KPIs de Marketing. Os relatórios foram divididos em 4 áreas:
- Clientes: total de clientes, média de dias entre compras, média de salário, segmentação de gastos, escolaridade, estado civil e modo de compra.
- Comportamento de Compra: gastos x salário, gastos x estado civil e escolaridade, gastos x filhos e adolescentes em casa.
- Campanhas: efetividade de campanha, resultado de campanha, informações dos clientes que compraram em alguma campanha.
- Padrão de Compra: segmentação de gastos (categorias) por país e gasto anual por país.

## Análise Exploratória de Dados

- O dataset 'dados_marketing' é um arquivo em .csv, com 1999 entradas, separadas nas seguintes colunas: 'ID', 'Ano Nascimento',	'Escolaridade',	'Estado Civil',	'Salario Anual', 'Filhos em Casa',	'Adolescentes em Casa',	'Data Cadastro',	'Dias Desde Ultima Compra',	'Gasto com Eletronicos',	'Gasto com Brinquedos',	'Gasto com Moveis',	'Gasto com Utilidades',	'Gasto com Alimentos',	'Gasto com Vestuario',	N'umero de Compras com Desconto',	'Numero de Compras na Web',	'Numero de Compras via Catalogo',	'Numero de Compras na Loja',	'Numero Visitas WebSite Mes',	'Compra na Campanha 1',	'Compra na Campanha 2',	'Compra na Campanha 3',	'Compra na Campanha 4',	'Compra na Campanha 5',	'Comprou',	'Pais';
- A coluna 'Salario Anual' possui 19 campos em branco;
- Será necessário promover a primeira linha para ser utilizada como cabeçalho;
- As colunas ID, Ano Nascimento, Filhos em Casa, Adolescentes em Casa, Data Cadastro, Dias Desde a Última Compra, Gasto com Eletrônicos, Gasto com Brinquedos, Gasto com Móveis, Gasto com Alimentos, Gasto com Vestuário, Número de Compras com Desconto, Número de Compras na Web, Número de Compras via Catálogo, Número de Compras na Loja, Número Visitas WebSite Mes, Compra na Campanha 1, Compra na Campanha 2, Compra na Campanha 3, Compra na Campanha 4, Compra na Campanha 5, Comprou estão com as tipos de dado errado (todos estão como texto).

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Substituído os 19 campos em branco na coluna 'Salário Anual' para a média encontrada (55290). Os dados em branco representavam menos de 1% do total;
- Ajustadas os tipos das colunas de acordo com os dados apresentados nelas;
- Na coluna 'Comprou', substituídos os valores 1 para Sim e 0 para Não.
- Criada uma medida DAX para somar todos os gastos que estão segmentados:

  - total_gasto = SUMX(dados_marketing, dados_marketing[Gasto com Alimentos] + dados_marketing[Gasto com Brinquedos] + dados_marketing[Gasto com Eletronicos] + dados_marketing[Gasto com Moveis] + dados_marketing[Gasto com Utilidades] + dados_marketing[Gasto com Vestuario])

## Conclusão

- Comportamento de Clientes:
  - O maior gasto foi com Eletrônicos (50,45%), seguido de Móveis (27,25%).
  - A grande maioria dos entrevistados são solteiros e possuem curso superior e preferem comprar em lojas físicas.
  - Clientes sem filhos gastam consideravelmente mais do que clientes que tem filhos (uma diferença de 83,96% de clientes sem filhos para clientes que tenham 1 filho).

- Performance de Campanhas:
  - Apenas 16.01% dos clientes comprou em alguma campanha. 
  - A média salarial anual parece não ser um fator que influencia na compra das campanhas.

# Introdução

Dataset disponibilizado pela [Maven Analytics](https://www.mavenanalytics.io/data-playground?search=wine), contendo reviews de vinhos do site WineEnthusiast.

O objetivo é trazer insights sobre os vinhos e vinícolas, onde separei o report nas seguintes informações

- Vinhos: total de vinhos, total de vinícolas, preço médio, países produtores, pontuação média e classificação de acordo pontuação x preço.
- Indicadores de produção: vinhos por país, variedades de vinho nas vinícolas, pontuação e preço médio por país, preço médio por província e vinho e variedade.
- Provadores: número de vinhos provados por provadores e suas nacionalidades, pontuação média dada por provadores.


## Análise Exploratória de Dados

- O dataset 'winemag-data-130k-v2' é um arquivo CSV, originalmente constituído por 1 tabela e 14 colunas: 'ID', 'country', 'designation', 'points, 'price, 'province', 'region_1', 'region_2', 'taster_twitter_handle', 'title', 'variety', 'winery'.
- Há colunas com tipos de dados incorretos
- Há informações misturadas dentro da tabela (todas as informações em uma só  tabela, o que dificulda a análise).
- Há colunas que possuem valores null e colunas que trazer informações desnecessárias para análise.
- Não há IDs repetidos

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Ajustadas os tipos das colunas de acordo com os dados apresentados nelas;
- Nas colunas "taster_twitter_handle", "province", "region_1", "region_2", "taster_name, substituídos os valores null para 'N/A'.
- Removidos os valores null da coluna 'price' (6% do total da coluna).
- Separados os dados em 3 tabelas: 'wine_info_data','wine_info_lookup' e 'wine_taster_info'.

  - ### wine_info_data
    - colunas de informação quantitativa dos vinhos ('id', 'points' e 'price')

  - ### wine_info_lookup
    - informações descritivas dos vinhos. ('id', 'title', 'description', 'country', 'province', 'region_1', 'region_2', 'variety' e 'winery')
    - No final do nome de cada vinho, aparecia a região dele em parentêses. Para limpar a nomenclatura, usei a função extrair texto antes do limitador.
    - fiz a limpeza de alguns nomes estavam com caractéres que não faziam parte do nome do vinho.

   - ### wine_taster_info
        - informações sobre os provadores ('id', 'taster_name', 'taster_twitter_handle')

## Conclusão

- Foram analisados 129.970 vinhos, dentre os quais estavam divididos em 708 tipos, de 16.730 vinícolas, em 44 países;
Os testes foram realizados por 20 provadores profissionais especializados;
- O preço médio dos vinhos ficou em $32.91;
- Os Estados Unidos teve a maior amostragem de vinhos, com 54.503 vinhos diferentes, onde as variedades mais produzidas foram o Pinot Noir, Cabernet Sauvignon e Chardonnay;
- O país com o preço médio mais alto é a Suíça (com 7 vinhos analisados, na média de preço de $85,29). Entretanto, se tratarmos esse dado como um outlier, a Inglaterra fica com a maior média de preço (onde foram avaliados 74 vinhos, com média de preço de $48,19), seguido da Alemanha (com 2165 vinhos analisados e o preço médio de $41,38);
- Em média, a pontuação influencia muito pouco no preço do vinho. No gráfico de 'Pontuação e Preço por País' (pg. 3), podemos observar que a grande maioria dos vinhos se concentram em um padrão de preço x qualidade;
- Da mesma forma, o que impacta no preço do vinho é o tipo dele, onde observamos no gráfico de 'Vinho e Preço Médio por Variedade' (pg. 4) que os valores se alteram consideravelmente de acordo com o tipo do produto;
- A variedade de vinho mais cara encontrada foi o Ramisco (média de $495,00), sendo mais que o dobro do preço do segundo colocado Terrantes (média de $236,00).
- No Brasil, os vinhos mais bem avaliado foram Cave Geisse 2012 Blanc de Blancs Brut Chardonnay (preço de $45,00)e Cave Geisse 2013 Brut Nature Sparkling (preço de $36,00), avaliados com 89 pontos. Entretanto, o vinho mais caro foi o Casa Perini 2012 Quatro Red, avaliado com 86 pontos e custando $60,00.
- O profissional que mais provou vinhos foi Roger Voss (@vossroger), com impressionantes 25.514 vinhos provados, dando uma média de nota de 88,71.

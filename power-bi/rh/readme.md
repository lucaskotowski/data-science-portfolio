# Introdução

Dataset fornecido no curso da [Data Science Academy - Microsoft Power BI Para Business Intelligence e Data Science](https://www.datascienceacademy.com.br/cursosgratuitos).
O objetivo é analisar alguns indicadores quanto aos funcionários do setor de RH de uma empresa fictícia, como total de funcionários, média de anos de experiência, porcentagem de funcionários masculinos/femininos, salário médio, envolvimento no trabalho e indicadores de satisfação.

## Análise Exploratória de Dados

- O dataset possui 1400 entradas
- Será necessário promover a primeira linha para ser utilizada como cabeçalho;
- As colunas stão com as tipos de dado errado (todos estão como texto).

## Limpeza de Dados

- Promovida a primeira linha para ser utilizada como cabeçalho;
- Ajustadas os tipos das colunas de acordo com os dados apresentados nelas;
- Padrozinado as colunas com valores 'S' para 'Sim' e 'N' para 'Não'
- Adicionada coluna customizada 'Status_Promo', considerando a coluna 'Anos_Desde_Ultima_Promoção'. Se for maior que 10 anos, será considerado para promoção e caso contrário, não será considerada promoção.
- Adicionada coluna 'Envolvimento_Trabalho', considerando a coluna 'Índice_Desenvolvimento_Trabalho'. Se o valor for igual à 1, renomeada para 'Ruim'; se for igual à 2, renomeada para 'Baixo'; se for igual à 3, renomeada para 'Médio'; se for igual à 4, renomeada para 'Alto'.
- Adicionada coluna 'Satisfação', considerando a coluna 'Nível_Satisfação_Trabalho'. Se o valor for igual à 1, renomeada para 'Insatisfeito'; se for igual à 2, renomeada para 'Satisfeito'; se for igual à 3, renomeada para 'Muito Satisfeito'; se for igual à 4, renomeada para 'Extremamente Satisfeito'

- Criadas medidas DAX:
  - TotalFunc = COUNTROWS(DatasetRH) 
  - TotalMasculino = CALCULATE([TotalFunc],DatasetRH[Genero]="Masculino")
  - TotalFeminino = CALCULATE([TotalFunc],DatasetRH[Genero]="Feminino")
  - % Feminino = DIVIDE([TotalFeminino], [TotalFunc], 0)
  - % Masculino = DIVIDE([TotalMasculino], [TotalFunc], 0) 
  - TotalFuncNaoPromover = CALCULATE([TotalFunc],DatasetRH[StatusPromo]="Não Considerar Promoção Imediata")
  - TotalFuncPromover = CALCULATE([TotalFunc],DatasetRH[StatusPromo]="Considerar Promoção Imediata")
  - % Nao Promover = DIVIDE([TotalFuncNaoPromover], [TotalFunc], 0) * 100
  - % Promover = DIVIDE([TotalFuncPromover], [TotalFunc], 0) * 100   


## Imagens

![RH](https://github.com/lucaskotowski/data-science-portfolio/blob/main/power-bi/rh/img/rh1.png)
![RH](https://github.com/lucaskotowski/data-science-portfolio/blob/main/power-bi/rh/img/rh22.png)

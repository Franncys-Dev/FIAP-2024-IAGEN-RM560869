# MONITORAMENTO DE CULTIVO
## Sensores:
 - Sensor de PH
 - Sensor de Umidade
 - Sensor de Nutrientes

## Tabelas
#### TB_STATUS
Tabela descriiva dos status possíveis dos sensores
|campo|tipo|descrição|
|-|-|-|
|id_sts (primary key)|varchar(5)|identificação única|
|desc_sts|varchar(50)|descrição do significado do id|

Chave primaria *id_sts* relação 1:N com tabelas:
 - TB_SNSR_PH
 - TB_SNSR_AGUA
 - TB_SNSR_NUTRI
 - TB_MNTOR
 - TB_HIST

#### TB_SNSR_PH
Tabela de cadastro dos sensores de PH
campo|tipo|descrição
-|-|-
id_sns_ph (primary key)|int|código único de identificação de sensor
status (foreing key)|varchar(5)|código de status (TB_STATUS)
nvl_ph|int|valor da última medição de PH
dat_alter|date|data da última alteração

Chave estrangeira *id_cultivo* relação 1:1 com tabelas:
 - TB_CULTIVO

Chave estrangeira *status* relaçao N:1 com tabela:
 -  TB_STATUS   

#### TB_SNSR_AGUA
Tabela de cadastro dos sensores de Água
campo|tipo|descrição
-|-|-
id_sns_agua (primary key)|int|código único de identificação de sensor
status (foreing key)|varchar(5)|código de status (TB_STATUS)
nvl_agua|int|valor da última medição de água
dat_alter|date|data da última alteração

Chave estrangeira *id_cultivo* relação 1:1 com tabelas:
 - TB_CULTIVO

Chave estrangeira *status* relaçao N:1 com tabela:
 -  TB_STATUS

#### TB_SNSR_NUTRI
Tabela de cadastro dos sensores de Nutrientes
campo|tipo|descrição
-|-|-
id_sns_nutri (primary key)|int|código único de identificação de sensor
status (foreing key)|varchar(5)|código de status (TB_STATUS)
nvl_p|int|valor da última medição de fósforo
nvl_k|int|valor da última medição de potássio
dat_alter|date|data da última alteração

Chave estrangeira *id_cultivo* relação 1:1 com tabelas:
 - TB_CULTIVO

Chave estrangeira *status* relaçao N:1 com tabela:
 -  TB_STATUS

#### TB_CULTIVOS
Tabela de cadastro de culturas
campo|tipo|descrição
-|-|-
id_cultivo (primary key)|int|código único de identificação de cultura
nome_prod|varchar(15)|nome da cultura
dat_cad|date|data do cadastro
dat_alter|date|data da última alteração

Chave primaria *id_cultivo* relação 1:1 com tabelas:
 - TB_SNSR_PH
 - TB_SNSR_AGUA
 - TB_SNSR_NUTRI
 - TB_MNTOR
 
Chave primaria *id_cultivo* relação 1:N com tabelas:
 - TB_HIST

#### TB_MNTOR
Tabela de monitoração de culturas
campo|tipo|descrição
-|-|-
id_mntor (primary key)|int|código único de identificação de monitoração
id_cultivo (foreing key)|int|código da cultura associada (TB_CULTIVOS)
status (foreing key)|varchar(5)|código de status (TB_STATUS)
nvl_ph|int|valor da última medição de PH
nvl_agua|int|valor da última medição de água
nvl_p|int|valor da última medição de fósforo
nvl_k|int|valor da última medição de potássio
dat_cad|date|data do cadastro
dat_alter|date|data da última alteração

Chave estrangeira *id_cultivo* relação 1:1 com tabelas:
 - TB_CULTIVO

Chave estrangeira *status* relaçao N:1 com tabela:
 -  TB_STATUS

#### TB_HIST
Tabela de histórico de monitoramento
campo|tipo|descrição
-|-|-
id_hist (primary key)|int|código único de identificação de histórico
id_cultivo (foreing key)|int|código da cultura associada (TB_CULTIVOS)
status (foreing key)|varchar(5)|código de status (TB_STATUS)
nvl_ph|int|valor da medição de PH na hora da gravação do histórico
nvl_agua|int|valor da medição de água na hora da gravação do histórico
nvl_p|int|valor da medição de fósforo na hora da gravação do histórico
nvl_k|int|valor da medição de potássio na hora da gravação do histórico
dat_cad|date|data do cadastro

Chave estrangeira *id_cultivo* relação 1:1 com tabelas:
 - TB_CULTIVO

Chave estrangeira *status* relaçao N:1 com tabela:
 -  TB_STATUS

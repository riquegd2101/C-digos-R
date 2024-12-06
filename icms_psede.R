library(tidyverse)

# Baixar excel diretamente da web - necessário criar um arquivo temporário
url <- "https://www.fazenda.mg.gov.br/export/sites/fazenda/governo/receita_estado/evolucao_receita_por_municipio/evarcicmotrcmunMGeOE.xlsx"
temp_file <- tempfile(fileext = ".xlsx")
download.file(url, destfile = temp_file, mode = "wb")
df <- readxl::read_excel(temp_file) 

# Correção da Base
df <- df %>% rename(Estado = `MINAS GERAIS E OUTROS    2024`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)

# Filtro de Estado
df <- df %>% filter(Estado %in% c("MG")) # Incluir outros siglas de estado se necessário

# Fazer transposição e configurar datas
df_2024 <- df %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2024"), locale = "pt_BR"))

#### ------- Anos anteriores
x2023 <- readxl::read_xlsx("2023.xlsx")
# Correção da Base
x2023 <- x2023 %>% rename(Estado = `MINAS GERAIS E OUTROS    2023`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)

# Filtro de Estado
x2023 <- x2023 %>% filter(Estado %in% c("MG")) 

# Fazer transposição e configurar datas
df_2023 <- x2023 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2023"), locale = "pt_BR"))

## -- 2022
x2022 <- readxl::read_xlsx("2022.xlsx")

x2022 <- x2022 %>% rename(Estado = `MINAS GERAIS E OUTROS    2022`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2022 <- x2022 %>% filter(Estado %in% c("MG")) 

df_2022 <- x2022 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2022"), locale = "pt_BR"))

## -- 2021
x2021 <- readxl::read_xlsx("2021.xlsx")

x2021 <- x2021 %>% rename(Estado = `MINAS GERAIS E OUTROS    2021`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2021 <- x2021 %>% filter(Estado %in% c("MG")) 

df_2021 <- x2021 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2021"), locale = "pt_BR"))
## -- 2020
x2020 <- readxl::read_xlsx("2020.xlsx")

x2020 <- x2020 %>% rename(Estado = `MINAS GERAIS E OUTROS    2020`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2020 <- x2020 %>% filter(Estado %in% c("MG")) 

df_2020 <- x2020 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2020"), locale = "pt_BR"))
## -- 2019
x2019 <- readxl::read_xlsx("2019.xlsx")

x2019 <- x2019 %>% rename(Estado = `MINAS GERAIS E OUTROS    2019`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2019 <- x2019 %>% filter(Estado %in% c("MG")) 

df_2019 <- x2019 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2019"), locale = "pt_BR"))
df_2019 <- df_2019 %>%
  mutate(Municipio = stringr::str_sub(Municipio, 7))

## -- 2018
x2018 <- readxl::read_xlsx("2018.xlsx", skip = 1)

x2018 <- x2018 %>% rename(Estado = `MINAS GERAIS E OUTROS    2018`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2018 <- x2018 %>% filter(Estado %in% c("MG")) 

df_2018 <- x2018 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2018"), locale = "pt_BR"))
df_2018 <- df_2018 %>% mutate(Municipio = stringr::str_sub(Municipio, 7))

## -- 2017
x2017 <- readxl::read_xlsx("2017.xlsx", skip = 1)

x2017 <- x2017 %>% rename(Estado = `MINAS GERAIS E OUTROS    2017`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2017 <- x2017 %>% filter(Estado %in% c("MG")) 

df_2017 <- x2017 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2017"), locale = "pt_BR"))
df_2017 <- df_2017 %>% mutate(Municipio = stringr::str_sub(Municipio, 7))

## -- 2016
arquivo <- "2016.xlsx"
meses <- readxl::excel_sheets(arquivo)
x2016 <- map_dfr(meses, ~ readxl::read_xlsx(arquivo, sheet = .x) %>%
                   mutate(Mês = .x))
x2016 <- x2016[5:42858,]

x2016 <- x2016 %>% rename(Estado = `ARRECADAÇÃO DE ICMS E OUTRAS RECEITAS POR MUNICÍPIO`) %>% 
  rename(Valor = ...5) %>% 
  rename(Municipio = ...4)
x2016 <- x2016 %>% filter(Estado %in% c("MG"))  %>% 
  select(Municipio,Valor,Mês)

df_2016 <- x2016 %>%
  mutate(Data = dmy(paste0("01 ", Mês), locale = "pt_BR"))
df_2016 <- df_2016 %>%
  mutate(Mês = stringr::str_sub(Mês, 1, nchar(Mês) - 5)) %>% 
  select(Municipio,Mês,Valor,Data)
df_2016$Valor <- as.numeric(df_2016$Valor)

## -- 2015
arquivo <- "2015.xlsx"
meses <- readxl::excel_sheets(arquivo)
x2015 <- map_dfr(meses, ~ readxl::read_xlsx(arquivo, sheet = .x) %>%
                   mutate(Mês = .x))
x2015 <- x2015[5:42858,]

x2015 <- x2015 %>% rename(Estado = `ARRECADAÇÃO DE ICMS E OUTRAS RECEITAS POR MUNICÍPIO`) %>% 
  rename(Valor = ...5) %>% 
  rename(Municipio = ...4)
x2015 <- x2015 %>% filter(Estado %in% c("MG"))  %>% 
  select(Municipio,Valor,Mês)

df_2015 <- x2015 %>%
  mutate(Data = dmy(paste0("01 ", Mês), locale = "pt_BR"))
df_2015 <- df_2015 %>%
  mutate(Mês = stringr::str_sub(Mês, 1, nchar(Mês) - 5)) %>% 
  select(Municipio,Mês,Valor,Data) 
df_2015$Valor <- as.numeric(df_2015$Valor)

`Historico ICMS 2015-2023` <- bind_rows(df_2015,df_2016,df_2017,df_2018,df_2019,df_2020,df_2021,df_2022,df_2023)
ICMS <- bind_rows(`Historico ICMS 2015-2023`, df_2024)
writexl::write_xlsx(ICMS, "ICMS_total.xlsx")

### ---- Tratar Municipios
ibge <- readxl::read_xlsx("R:/14 Power Bi/1 Regionalização e Mapas/Municípios e Regiões 2.0.xlsx") 
ibge <- ibge %>% 
  select(IBGE...1, Municipio, `Nome sem acento`) %>% 
  rename(Municipio1 = Municipio) %>% 
  rename(Municipio = `Nome sem acento`)
ICMS$Municipio <- gsub("SEM PEIXE", "SEM-PEIXE",ICMS$Municipio)
ICMS$Municipio <- gsub("OLHOS D'AGUA", "OLHOS-D'AGUA",ICMS$Municipio)
ICMS$Municipio <- gsub("SILVERANIA", "SILVEIRANIA",ICMS$Municipio)
ICMS$Municipio <- gsub("DONA EUZEBIA", "DONA EUSEBIA",ICMS$Municipio)
ICMS$Municipio <- gsub("BRASOPOLIS", "BRAZOPOLIS",ICMS$Municipio)
ICMS$Municipio <- gsub("SANTA RITA DO IBITIPOCA", "SANTA RITA DE IBITIPOCA",ICMS$Municipio)
ICMS$Municipio <- gsub("SAO THOME DAS LETRAS", "SAO TOME DAS LETRAS",ICMS$Municipio)

ICMS_ <- merge(ICMS, ibge, by = "Municipio")
writexl::write_xlsx(ICMS_, "ICMS_total.xlsx")

ICMS_ANO <- ICMS_ %>% mutate(ano = lubridate::year(Data)) %>% 
  group_by(ano, Municipio1) %>% 
  summarise(Valor = sum(Valor, na.rm = TRUE)) %>% 
  rename(Municipio = Municipio1)

writexl::write_xlsx(ICMS_ANO, "ICMS_ANUAL.xlsx")



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
         Data = dmy(paste0("01 ", Mês, " 2023"), locale = "pt_BR"))
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
         Data = dmy(paste0("01 ", Mês, " 2021"), locale = "pt_BR"))
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
  mutate(Municipio = stringr::str_sub(Municipio, 6))

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
df_2018 <- df_2018 %>% mutate(Municipio = stringr::str_sub(Municipio, 6))

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
df_2017 <- df_2017 %>% mutate(Municipio = stringr::str_sub(Municipio, 6))

## -- 2016
arquivo <- "2016.xlsx"
meses <- readxl::excel_sheets(arquivo)
x2016 <- map_dfr(meses, ~ readxl::read_xlsx(arquivo, sheet = .x) %>%
                   mutate(Mês = .x))
x2016 <- x2016[5:42858,]

x2016 <- x2016 %>% rename(Estado = `ARRECADAÇÃO DE ICMS E OUTRAS RECEITAS POR MUNICÍPIO`) %>% 
  fill(Estado) %>% 
  filter(nchar(Estado) == 2 & ...3 == "ICMS") %>% 
  rename(Imposto = ...3) %>% 
  rename(Municipio = ...2)
x2016 <- x2016 %>% filter(Estado %in% c("MG")) 

df_2016 <- x2016 %>%
  select(c(-Estado, -Total, -Imposto)) %>% 
  pivot_longer(
    cols = -Municipio,  
    names_to = 'Mês',
    values_to = 'Valor'
  ) %>%
  mutate(Mês = tolower(Mês),
         Data = dmy(paste0("01 ", Mês, " 2016"), locale = "pt_BR"))
df_2016 <- df_2016 %>% mutate(Municipio = stringr::str_sub(Municipio, 6))

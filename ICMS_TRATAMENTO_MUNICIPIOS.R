### ---- Tratar Municipios
library(tidyverse)

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

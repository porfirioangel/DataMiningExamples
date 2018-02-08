################################################################################
# Detectar hongos venenosos y no venenosos
################################################################################

# Paquetes a instalar:
# 
# RWeka
# sudo R CMD javareconf
# sudo apt-get install r-base-dev


setwd('/home/porfirio/RStudioProjects/Minería de Datos II/01_Mushrooms')

# Lee el dataset
mushrooms <- read.csv("mushrooms.csv", stringsAsFactors = TRUE)

str(mushrooms)

# Se elimina veil_type porque no es útil
mushrooms $ veil_type <- NULL

# Convierte a tabla el atributo type
table(mushrooms $ type)

# Importa librería RWeka
library("RWeka")

# Aplica algoritmo One R para entrenar predicción de hongos venenosos
# sintaxis: OneR(variable_a_predecir ~ atributos_a_clasificar, data=dataset)
mushrooms_1R<-OneR(type ~ .,data = mushrooms)
mushrooms_1R
summary(mushrooms_1R)

# Aplica algoritmo Ripper para entrenar predicción de hongos venenosos
# sintaxis: OneR(variable_a_predecir ~ atributos_a_clasificar, data=dataset)
mushrooms_JRip<-JRip(type ~ .,data = mushrooms);
mushrooms_JRip
summary(mushrooms_JRip)
#head(mushrooms)

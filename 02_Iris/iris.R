################################################################################
# Predecir especie de iris
################################################################################

# Paquetes a instalar:
# 
# RWeka

setwd('/home/porfirio/RStudioProjects/Minería de Datos II/02_Iris')

# Importa librerías
library(datasets)
library("RWeka")

# Lee dataset
data(iris)
summary(iris)

# Aplica algoritmo One R
iris_one_r<-OneR(Species ~ ., data=iris)
iris_one_r
summary(iris_one_r)

# Aplica algoritmo Ripper
iris_ripper<-JRip(Species ~ ., data=iris)
iris_ripper
summary(iris_ripper)

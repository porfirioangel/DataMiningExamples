################################################################################
# Auto-mpg
################################################################################

setwd('/home/porfirio/RStudioProjects/Minería de Datos II/03_Regression')

autoDataset<-read.csv("auto-mpg.csv", stringsAsFactors = TRUE)

# Agrega los nombres a las columnas del dataset
# names(autoDataset)<-c("mpg", "cylinders", "displacement", "horsepower", 
#                      "weight", "acceleration", "model year", "origin", 
#                      "car name")

dim(autoDataset)
str(autoDataset)
summary(autoDataset$mpg)

# Construcción del modelo
mpg_model<-lm(mpg ~ ., data = autoDataset)
mpg_model
summary(mpg_model)

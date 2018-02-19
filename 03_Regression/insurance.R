################################################################################
# Insurance
################################################################################

setwd('/home/porfirio/RStudioProjects/Minería de Datos II/03_Regression')

insurance<-read.csv("insurance.csv", stringsAsFactors = TRUE)

str(insurance)

summary(insurance$charges)

# Como el promedio es más grande que la media, la gráfica estará sesgada hacia 
# la derecha
hist(insurance$charges)

table(insurance$region)

# Sacar como están correlacionados unos parámetros con otros
cor(insurance[c("age", "bmi", "children", "charges")])
pairs(insurance[c("age", "bmi", "children", "charges")])

# Instalar paquetes:
install.packages("psych")
library(psych)

# Entre la elipse esté más circular, hay menos correlación, entre más aplastada,
# hay más correlación
pairs.panels(insurance[c("age", "bmi", "children", "charges")])

# Construir modelo de regresión linear
# variable_dependiente ~ variables_independientes, data=el_dataset
ins_model<-lm(charges ~ age + children + bmi + sex + smoker + region, data = insurance)
ins_model<-lm(charges ~ ., data = insurance) # Es lo mismo que la anterior
ins_model

# Valores p -> Qué tan significativa es una variable para predecir, entre más
# pequeño, más sirve
# R-squared -> Entre más cercano a 1.0, es mejor para predecir, si se le 
# aumentan variables, su valor aumentará, pero no significa que sea un buen 
# modelo, por eso mejor ver el valor de Adjusted R-Squared
summary(ins_model)

# Agrega una edad no linear al modelo
insurance$age2<-insurance$age^2
insurance

# Agrega un bmi clasificándo a una persona en gordo (1) o no gordo (2)
insurance$bmi30<-ifelse(insurance$bmi >= 30, 1, 0)

# Interacción entre dos variables: Cuando la combinación de dos variables 
# importa mucho

# Creamos un nuevo modelo de regresión
ins_model2 <- lm(charges ~ age + age2 + children + bmi + sex + bmi30*smoker + region, data=insurance)
summary(ins_model2)

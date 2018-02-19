################################################################################
# Regresión linear
################################################################################

setwd('/home/porfirio/RStudioProjects/Minería de Datos II/03_Regression')

launch <- read.csv('challenger.csv')
head(launch)

# Covariance by hand
b <- cov(launch $ temperature, launch $ distress_ct) / var(launch $ temperature)
b

a <- mean(launch $ distress_ct) - b * (mean(launch $ temperature))
a

# Correlation
r <- cov(launch$temperature, launch$distress_ct) / (sd(launch$temperature) 
                                                    * sd(launch$distress_ct))

# correlation with r
cor(launch$temperature, launch$distress_ct)

################################################################################
# Regresión linear múltiple
################################################################################

# En este algoritmo no se requiere normalizar los datos

# x: Todas las variables menos la que se trata de predecir
# y: La variable que se trata de predecir
reg<-function(y, x) {
    x<-as.matrix(x)
    c<-cbind(Intercept = 1, x)
    
    # solve() toma la inversa de la patriz
    # t() saca la transpuesta de la matriz
    # %*% multiplica dos matrices
    b<-solve(t(x) %*% x) %*% t(x) %*% y
    colnames(b)<-"estimate"
    print(b)
}

str(launch)

reg(y = launch $ distress_ct, x = launch[2:4])

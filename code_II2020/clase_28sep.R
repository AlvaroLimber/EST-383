rm(list=ls())
#cargar la base de datos
setwd("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\data")
load("eh19.RData")

#load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/eh19.RData"))

# variables cuantitativas (1)
eh19p$s02a_03  # edad
eh19p$aestudio  # años de educación de las personas
eh19p$ylab     # ingreso laboral de las personas

#EDAD
#tendencia central
mean(eh19p$s02a_03) #media
median(eh19p$s02a_03) #mediana

#dispersión
var(eh19p$s02a_03) # varianza
sd(eh19p$s02a_03)  # Desviación estándar (diferenciar el error estandar)

sd(eh19p$s02a_03)/mean(eh19p$s02a_03) # coeficiente de variación
range(eh19p$s02a_03)

#forma 
hist(eh19p$s02a_03)
barplot(table(eh19p$s02a_03))
plot(density(eh19p$s02a_03))
boxplot(eh19p$s02a_03)
quantile(eh19p$s02a_03,c(0.1,0.5,0.9))
quantile(eh19p$s02a_03,seq(0,1,0.01))

#aestudio
#tendencia central
mean(eh19p$aestudio[eh19p$s02a_03>=15],na.rm = T) #media
median(eh19p$aestudio,na.rm = T) #mediana

#dispersión
var(eh19p$aestudio,na.rm = T) # varianza
sd(eh19p$aestudio,na.rm = T)  # Desviación estándar (diferenciar el error estandar)

sd(eh19p$aestudio,na.rm = T)/mean(eh19p$aestudio,na.rm = T) # coeficiente de variación
range(eh19p$aestudio,na.rm = T)

#forma 
hist(eh19p$aestudio)
plot(density(eh19p$aestudio,na.rm=T))


#ylab
#tendencia central
mean(eh19p$ylab,na.rm = T) #media
median(eh19p$ylab,na.rm = T) #mediana

#dispersión
sd(eh19p$ylab,na.rm = T)  # Desviación estándar (diferenciar el error estandar)

sd(eh19p$ylab,na.rm = T)/mean(eh19p$ylab,na.rm = T) # coeficiente de variación
range(eh19p$ylab,na.rm = T)

#forma 
hist(eh19p$ylab)
plot(density(eh19p$ylab,na.rm=T))
boxplot(eh19p$ylab)
quantile(eh19p$ylab,na.rm = T,probs = c(0.05,0.95))

# mas de una variable (cuali + cuanti)

boxplot(eh19p$ylab ~ eh19p$area )
boxplot(eh19p$ylab ~ eh19p$depto )
boxplot(eh19p$ylab ~ eh19p$depto+eh19p$area )
boxplot(eh19p$ylab ~ eh19p$s02a_02)
boxplot(eh19p$ylab ~ eh19p$caeb_op)

#familia apply

m1<-matrix(1:100,10,10)

apply(m1,1,sum )
apply(m1,1,mean)
apply(m1,1,sd)

apply(m1,2,sum )
apply(m1,2,mean)
apply(m1,2,sd)

apply(eh19p[,c("s02a_03","aestudio","ylab")], 2, mean,na.rm=T)

colMeans(eh19p[,c("s02a_03","aestudio","ylab")],na.rm = T)

apply(eh19p[,c("s02a_03","aestudio")], 2, quantile,probs=c(0.5),na.rm=T)

tapply(eh19p$s02a_03, eh19p$depto, mean)

tapply(eh19p$ylab, eh19p$depto, mean,na.rm=T)
aux<-tapply(eh19p$ylab, eh19p$depto, quantile,na.rm=T)

tapply(eh19p$ylab, eh19p$depto, sd, na.rm=T)
tapply(eh19p$ylab, list(eh19p$depto,eh19p$s02a_02), mean, na.rm=T)
tapply(eh19p$ylab, list(eh19p$depto,eh19p$s02a_02,eh19p$area), mean, na.rm=T)

aux<-list(eh19p, eh19v)
sapply(aux, dim)
sapply(aux, class)

## cuanti vs cuanti

var(eh19p[,c("s02a_03","aestudio","ylab")],na.rm=T)

cor(eh19p[,c("s02a_03","aestudio","ylab")],use="complete.obs")
cor(eh19p[,c("s02a_03","aestudio","ylab")],use="pairwise.complete.obs")

cov(eh19p[,c("s02a_03","aestudio","ylab")],use="complete.obs")
cov(eh19p[,c("s02a_03","aestudio","ylab")],use="pairwise.complete.obs")


ylab = f(aestudio,edad) 

ylab= B0+B1*aestudio+B2*edad+e


plot(eh19p[,c("s02a_03","aestudio","ylab")])

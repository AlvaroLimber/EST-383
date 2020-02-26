#Estadística descriptiva
rm(list=ls())
setwd("C:\\Users\\PC18\\Documents\\R\\est383\\data\\eh18\\SPSS")
#encuesta a hogares 2018
load("eh18p.RData")
data()#muestra las bases de datos disponibles en R
ChickWeight
View(ChickWeight)
help("ChickWeight")
##Porcentajes y tablas de fracuencias
t1<-table(eh18$sexo)#tabla de frcuencias
t2<-table(eh18$depto)
t3<-table(eh18$edad)

barplot(t1,col=c("blue","darkgreen"))#diagramas de barra
barplot(t3,horiz = T)
barplot(t3,col="red")
ldep<-c("CH","LP","CB","OR","PT","TJ","SC","BN","PD")
barplot(t2,col="black",names.arg = ldep)
#llevando a %
t2p<-prop.table(t2)*100
barplot(t2p,col="black",names.arg = ldep,ylab="%")
pie(t2p)

t3<-as.data.frame(t3)
t3$F<-cumsum(t3$Freq)
t3$r<-prop.table(t3$Freq)
t3$R<-cumsum(t3$r)
head(t3)

table(ChickWeight$Time)
table(ChickWeight$Diet)

dim(table(ChickWeight$Chick))
#tabla de contingencia
aux<-table(ChickWeight$Chick,ChickWeight$Diet)
aux[aux!=0]<-1
apply(aux,2,sum)
table(ChickWeight$Time)
table(ChickWeight$Diet[ChickWeight$Time==0])
##medidas de tendencia central
mean(eh18$edad)
median(eh18$edad)

mean(eh18$ylab,na.rm = T)
median(eh18$ylab,na.rm = T)
hist(eh18$ylab)
plot(density(eh18$ylab,na.rm = T))
locator(1)
summary(eh18$ylab)
#medidas de dispersion
var(eh18$ylab,na.rm = T)
sd(eh18$ylab,na.rm = T)
max(eh18$ylab,na.rm = T)-min(eh18$ylab,na.rm = T)
sd(eh18$ylab,na.rm = T)/mean(eh18$ylab,na.rm = T)
#medidas de forma
quantile(eh18$ylab,c(0.1,0.44,0.99),na.rm=T)
hist(eh18$edad)
#Coeficiente de asimetría
#EDAD
x<-eh18$edad
N<-length(x)
as<-(sum((x-mean(x))^3)/N)/sd(x)^3
as
#iNGRESO LABORAL
x<-eh18$ylab
x<-x[is.na(x)==F]
x<-x[complete.cases(x)]
N<-length(x)
as<-(sum((x-mean(x))^3)/N)/sd(x)^3
as
#kurtosis...
plot(density(rnorm(1000,sd=40)),ylim=c(0,0.08))
points(density(rnorm(1000,sd=10)),type="l",col="red")
points(density(rnorm(1000,sd=5)),type = "l",col="blue")

lm(ylab~edad,data=eh18,weights = f)
lm(ylab~-1+edad,data=eh18)
summary(lm(ylab~edad,data=eh18))





















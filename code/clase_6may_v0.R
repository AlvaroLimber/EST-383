rm(list=ls())
#librarias
library(ggplot2)
#install.packages("lubridate")
library(lubridate)
library(dplyr)
library(hrbrthemes)
#bases
bdc<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"),sep = ",")
bdd<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"),sep = ",")
bdr<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"),sep = ",")
aux<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"),sep = ",",header = F)
#fechas
fechas<-as.vector(t(aux[1,-c(1:4)]))
names(bdc)[-c(1:4)]<-paste0("p.", mdy(fechas))
names(bdr)[-c(1:4)]<-paste0("p.", mdy(fechas))
names(bdd)[-c(1:4)]<-paste0("p.", mdy(fechas))
aux2<-paste0("p.", mdy(fechas))
# países
bdc<-aggregate(bdc[,aux2],list(bdc$Country.Region),sum)
bdd<-aggregate(bdd[,aux2],list(bdd$Country.Region),sum)
bdr<-aggregate(bdr[,aux2],list(bdr$Country.Region),sum)
names(bdc)[1]<-"pais"
names(bdd)[1]<-"pais"
names(bdr)[1]<-"pais"
#gráficos con r base
i<-which(bdc$pais=="Brazil")

plot(x=mdy(fechas),y=bdc[i,-1],type="l",col="red",lwd=2)
points(x=mdy(fechas),y=bdd[i,-1],type="l",col="black",lwd=2)
points(x=mdy(fechas),y=bdr[i,-1],type="l",col="darkgreen",lwd=2)
title(main = bdc$pais[i],cex.main=1.5,col.main="brown")

bdc$region<-0
sud<-c("Argentina","Bolivia","Brazil","Chile","Venezuela",
       "Ecuador","Colombia","Peru","Uruguay","Paraguay")
bdc[bdc$pais %in% sud,"region"]<-1
bdd[bdd$pais %in% sud,"region"]<-1
bdr[bdr$pais %in% sud,"region"]<-1

(bdc$pais %in% sud) equivalente (bdc$pais=="Bolivia" | bdc$pais=="Argentina")


csud<-aggregate(bdc[,aux2],list(bdc$region),sum)
dsud<-aggregate(bdd[,aux2],list(bdd$region),sum)
rsud<-aggregate(bdr[,aux2],list(bdr$region),sum)

plot(x=mdy(fechas),y=csud[1,-1],type="l",col="darkred",lwd=2)
points(x=mdy(fechas),y=csud[2,-1],type="l",col="red",lwd=2)
######### estructurar la base de datos
#base ideal long
data.frame(pais="Bolivia",fecha="2020-01-23",contagios=0,muertes=0,recuperados=0)
#reshape wide 
reshape 


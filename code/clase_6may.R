rm(list=ls())
library(ggplot2)
library(lubridate)
library(dplyr)
library(hrbrthemes)

bdc<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"),sep = ",")
bdd<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"),sep = ",")
bdr<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"),sep = ",")
aux<-read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"),sep = ",",header = F)

days<-mdy(as.vector(t(aux[1,-c(1:4)])))
daysl<-days
#opcion alternativa para los nombres days<-paste0("d.",days)
names(bdc)[-c(1:4)]<-days
names(bdr)[-c(1:4)]<-days
names(bdd)[-c(1:4)]<-days
days<-names(bdc)[-c(1:4)]
bdc<-aggregate(bdc[,days],list(bdc$Country.Region),sum)
bdr<-aggregate(bdr[,days],list(bdr$Country.Region),sum)
bdd<-aggregate(bdd[,days],list(bdd$Country.Region),sum)
#gráfico R básico
i<-which(bdc$Group.1=="Bolivia")
plot(days,bdc[i,-1])
#gráfico ggplot
#es necesario poner los casos como variables... reshape
days2<-paste0("d.",daysl)
names(bdc)[-1]<-days2
bdc2<-reshape(bdc,
        idvar = names(bdc)[1],
        varying = names(bdc)[-1],
        v.names="contagios",
        timevar = "fecha",
        times = names(bdc)[-1],
        split  = "."
        direction = "long")
row.names(bdc2)<-NULL
head(bdc2)
bdc2$fecha<-gsub("d.","", bdc2$fecha)
names(bdc2)[1]<-"pais"
bdc2$fecha<-as.Date(bdc2$fecha)
bdc2$contagios<-as.numeric(bdc2$contagios)
#install.packages("hrbrthemes")
#por separado
pp<-bdc2 %>% filter(pais=="Bolivia") 
ggplot(pp,aes(x=fecha,y=contagios))+geom_line()+theme_ipsum()
ggplot(pp,aes(x=fecha,y=contagios))+geom_smooth()
names(bdc2)
ggplot(bdc2,aes(x=fecha,y=contagios,group=pais,color=pais))+geom_line()

ggplot(bdc2,aes(x=fecha,y=contagios))+geom_line(aes(group=pais))

bdc2<- bdc2 %>% mutate(pais2=pais)
ggplot(bdc2,aes(x=fecha,y=contagios))+
  geom_line(data=tmp %>% select(-pais), aes(group=pais2))+
  geom_line(aes(group=pais))

ggplot(bdc2,aes(x=fecha,y=contagios))+facet_wrap(~pais)

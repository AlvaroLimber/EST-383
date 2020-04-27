rm(list=ls())
library(rvest)
info<-"https://www.worldometers.info/coronavirus/"
#paso1: leer la página web
www<-read_html(info)
#paso2: extraer la información de interés
tablas<-html_table(www)
now<-tablas[[1]]
yes<-tablas[[2]]
#paso3: limpieza de la base de datos
str(now)
now$NewCases
now$NewCases<-gsub(",","",now$NewCases)
aux<-substr(now$NewCases[1],1,1)
gsub("+","",now$NewCases)
gsub(aux,"",now$NewCases)
gsub("+","",now$NewCases,fixed = T)
now$NewCases<-gsub("\\+","",now$NewCases)
now$NewCases<-as.numeric(now$NewCases)
now$NewCases
# paso 4: ... 



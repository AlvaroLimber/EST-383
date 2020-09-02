rm(list=ls())
library(ff)
library(ffbase)

setwd("C:\\Users\\ALVARO\\Downloads\\bd43 (1)\\CSV")
bd1<-read.csv("EH2018_Vivienda.csv",sep=";",header=T)
apply(bd1,2, class)
aa<-sapply(bd1,class)
aa[aa=="character"]<-"factor"

bd2<-read.csv.ffdf(file="EH2018_Vivienda.csv",sep=";",header=T,
                   next.rows=1000,colClasses=aa,VERBOSE=T)

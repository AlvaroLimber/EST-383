rm(list=ls())
library(sparklyr)
library(dplyr)
sc<-spark_connect(master="local")

bid<-spark_read_csv(sc,"bid",
               path="C:\\Users\\ALVARO\\Downloads\\EZSHARE-1707297468-112\\Concurso Visualizacion\\CONCURSO VISUALIZACION DESIGUALDAD (csv)\\")
dimnames(bid)

t1<-bid %>% group_by(anio_c) %>% tally() %>% collect()
spark_disconnect(sc)
sdf_sample(bid,1)

install.packages("srvyr") 
library(srvyr)

as_survey_design()

library(ff)
library(ffbase)
?read.csv.ffdf()


rm(list=ls())
library(sparklyr)
library(dplyr)
#preparando la base de interés
load("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\data\\oct20.RData")
names(computo)<-tolower(names(computo))
names(computo)<-c("pais","idep","ddep","dpro","imun","dmun","cir","dloc","rec","imesa","cmesa","elec","ins","cc","fpv","mts","ucs","mas","21f","pdc","mnr","pan","vv","blancos","nulos","acta")
#reporte de valores perdidos
sapply(computo, function(x) sum(is.na(x)))
#conexión a spark
sc<-spark_connect(master="local")
sp_oct20<-copy_to(sc,computo,"computo",overwrite = T)
#Bolivia elecciones nacionales
bol<-sp_oct20 %>% filter(pais=="Bolivia" & elec=="Presidente y Vicepresidente") %>% compute("bol")
#exterior elecciones nacionales
ext<-sp_oct20 %>% filter(pais!="Bolivia" & elec=="Presidente y Vicepresidente") %>% compute("ext")

#creando nuevas variables
sp_oct20 %>% group_by(ddep) %>% select(mas) %>% mutate(tot=mas>100) 

bol %>% group_by(ddep) %>% tally() %>% mutate(n/sum(n))

bol %>% mutate(mas100=ifelse(mas>100,1,0)) %>% group_by(ddep,dpro) %>% summarise(mean(mas100))
#desconectando sesión
spark_disconnect(sc)

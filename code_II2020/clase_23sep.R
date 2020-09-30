rm(list=ls())
library(readxl)
library(foreign) 
library(haven)
library(writexl) # exportar a excel
# 20octubre
setwd("C:/Users/ALVARO/Box/UMSA/2019/anomalias")
oct20<-read_excel("computo.xlsx")

# Encuesta a hogares
setwd("C:/Users/ALVARO/Downloads/Base EH2019/Base EH2019")
eh19v<-read.spss("EH2019_Vivienda.sav",to.data.frame = T) 
eh19p<-read.spss("EH2019_Persona.sav",to.data.frame = T) 

#Exportación a fichero .RData .rdata .Rdata 
setwd("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\data")

save(eh19p,eh19v,file="eh19.RData") #EH2019
save(oct20,file="oct20_2019.RData") #EH2019

#exportar a otros formatos 
write.dta(oct20,"oct20_2019.dta") # stata 1:1
write.dta(eh19v,"eh19v.dta")
write_dta(eh19v,"eh19v.dta")

write_xlsx(eh19v,"eh19v.xlsx")

### scan(), 

x<-scan()
nombres<-scan(what = "character")

y<-scan(what = "logical")
x<-scan(n=10)

# Exploración de data frames
rm(list=ls())
load("eh19.RData")
load("oct20_2019.RData")

dim(eh19p)
object.size(eh19p) / 10^6 
names(eh19p)
str(eh19p)
aux<-attributes(eh19p)
aux$variable.labels[31]

aux2<-attributes(oct20)

class(eh19p)

# Estadística descriptiva

t1<-table(eh19v$depto) # tabla de frecuencias de 1, 2 o más variables
prop.table(t1)
prop.table(t1)*100

as.data.frame(prop.table(t1)*100)

t2<-table(eh19v$depto,eh19v$area)

barplot(t1)
plot(t2)

t3<-prop.table(t2) # celda
t4<-prop.table(t2,1) # fila
t5<-prop.table(t2,2) # columna

addmargins(t2)
addmargins(t2,1)
addmargins(t2,2)

addmargins(t3)
addmargins(t4,2)

addmargins(t5,1)

class(t2)
as.data.frame(t2)
as.data.frame(t3)

t6<-table(eh19v$depto,eh19v$area,eh19v$s01a_19)
as.data.frame(t6)

t6[7,1,2]

prop.table(t6[,,1],2)
prop.table(t6[,,2],2)


prop.table(t6[,,1],1)

#familia apply


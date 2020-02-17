rm(list=ls())
### creando un data frame
Nombre<-c("Juan","Maria","Pablo")
edad<-c(15,30,42)
sexo<-c("H","M","H")
mujer<-c(0,1,0)
bd1<-data.frame(Nombre,edad,sexo,mujer)
bd1
bd2<-data.frame(
            Nombre=c("Juan","Maria","Pablo"),
           edad=c(15,30,42),
           sexo=c("H","M","H"),
           mujer=c(0,1,0)
           )
bd2
bd3<-data.frame(c("Juan","Maria","Pablo"),
  c(15,30,42),
  c("H","M","H"),
  c(0,1,0)
)
names(bd1)
names(bd2)
names(bd3)<-names(bd1)
bd3

aux<-matrix(rnorm(20),10,2)
aux_df<-as.data.frame(aux)
aux
aux_df
# Ver el data frame
bd1
View(bd1)
edit(bd1)
bd4<-edit(bd1)

str(bd1)

bd1[,1]
bd1$Nombre

bd1$Nombre<-as.character(bd1$Nombre)
str(bd1)
bd1

bd1$m18<-bd1$edad<18
bd1
#importando bases de datos
getwd()
setwd("C:\\Users\\PC18\\Documents\\R\\est383\\data\\eh18\\SPSS")
dir()
##SPSS
## activar o instalar librerias
library(foreign)
eh18d<-read.spss("EH2018_Discriminacion.sav",
          to.data.frame = T,use.value.labels=F)
names(eh18d)
table(eh18d$s10a_01a)
attributes(eh18d)$variable.labels[5]
head(eh18d)
##CSV
setwd("C:\\Users\\PC18\\Documents\\R\\est383\\data\\eh18\\CSV")
dir()
eh18d2<-read.csv2("EH2018_Discriminacion.csv")
aux<-read.csv("EH2018_Discriminacion.csv",sep=";")
table(eh18d2$s10a_01a)
daux<-c("Sexo","O. Sexual","Edad","piel","Pertenencia",
        "idioma","vestimente","procedencia","discapacidad",
        "religion","clase","otro")
for(i in 5:16){
barplot(prop.table(table(eh18d2[,i]))*100,main=daux[i-4])
}











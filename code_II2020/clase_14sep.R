rm(list=ls()) # limpieza de la memoria en R
###########################################
# Autor: ...
# Objetivo: Importación de datos
###########################################
#librerías de la sesión

###########################################
## definir el directorio de trabajo
getwd() # conocer el directorio de trabajo
setwd("C:\\Users\\ALVARO\\Box\\UMSA\\2019\\anomalias") # cambiar el directorio de trabajo
setwd("C:/Users/ALVARO/Box/UMSA/2019/anomalias")
dir() # lista los archivos en el directorio de trabajo
ficheros<-dir()
# csv
bd_21f<-read.csv("21f.csv",sep="|",encoding="UTF-8")
str(bd_21f)
# cortar y pegar (clipboard)
bd_cp<-readClipboard() # para una solo columna funciona bien
bd_cp2<-read.table("clipboard",sep = "\t",header = TRUE)
bd_cp3<-read.delim("clipboard",header = TRUE)
View(bd_cp3)
# excel
#install.packages("readxl") # tidyverse
library(readxl) # habilita el uso de la librería
library(help=readxl) # help de una librería

oct20<-read_excel("computo.xlsx")
View(oct20)

oct20_2<-read_excel("computo.xlsx",range = "A1:F8")
View(oct20_2)
# spss
#install.packages("haven")
library(haven) # rstudio
library(foreign) 

setwd("C:/Users/ALVARO/Downloads/Base EH2019/Base EH2019")
dir()
eh19v<-read.spss("EH2019_Vivienda.sav",to.data.frame = T) #foreign
eh19v_2<-read_spss("EH2019_Vivienda.sav") #haven

eh19p<-read.spss("C:/Users/ALVARO/Downloads/Base EH2019/Base EH2019/EH2019_Persona.sav",to.data.frame = T)
eh19p_2<-read_spss("C:/Users/ALVARO/Downloads/Base EH2019/Base EH2019/EH2019_Persona.sav")
View(eh19v)

names(eh19v)
# stata
# json ...
# xml ...

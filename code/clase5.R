rm(list=ls())
setwd("C:\\Users\\PC18\\Documents\\R\\est383\\data\\eh18\\SPSS")
library(foreign)
dir()
eh18<-read.spss("EH2018_Persona.sav",
          to.data.frame = T,use.value.labels=F)
#################################################
names(eh18)#nombres de las variable
str(eh18)
class(eh18)
##renombrando variables
names(eh18)[c(5,6)]<-c("sexo","edad")
names(eh18)
##crear variable (mujer 1=mujer, 0 eoc)
eh18$mujer<-eh18$sexo==2
sum(eh18$mujer)
mean(eh18$mujer)
#exportación ("write")
write.dta(eh18,"eh18p.dta")
getwd()
#excel
library(readxl)
install.packages("writexl")
library(writexl)
library(help=writexl)
write_xlsx(eh18,"eh18p.xlsx")
apropos("read")
apropos("write")
install.packages("haven")
library(haven)

eh18$s03a_02e<-substr(as.character(eh18$s03a_02e),1,120)
eh18$s03a_02e<-gsub("  "," ",as.character(eh18$s03a_02e))

gsub("a","7","hola")
gsub("`","'","`s04a_04e`, `s04a_07ge`, `s04b_15e`, `s04b_16e`, `s04b_17e`, `s04b_18e`, `s04e_30c`, `s04f_35e`, `s05a_04`, `s05c_13_e`, `s05d_21e`, `s05d_22_e`, `s06a_06e`, `s06a_09e`, `s06a_10e`, `s06b_11a`, `s06b_11b`, `s06b_12a`, `s06b_12b`, `s06b_13`, `s06b_20e`, `s06e_34e`, `s06f_40a`, `s06f_40b`, `s06h_54e`, `s06h_55e`, `s06h_56e`, `s07a_01e1e`, `s07a_01e2e`, `s07a_02ce`, `s07b_05de`, `s07b_05ee`, `s07c_08e`, `s07c_09e`")
nchar(eh18$s03a_02e)

vv<-c('s04a_04e', 's04a_07ge', 's04b_15e', 's04b_16e', 's04b_17e', 's04b_18e', 's04e_30c', 's04f_35e', 's05a_04', 's05c_13_e', 's05d_21e', 's05d_22_e', 's06a_06e', 's06a_09e', 's06a_10e', 's06b_11a', 's06b_11b', 's06b_12a', 's06b_12b', 's06b_13', 's06b_20e', 's06e_34e', 's06f_40a', 's06f_40b', 's06h_54e', 's06h_55e', 's06h_56e', 's07a_01e1e', 's07a_01e2e', 's07a_02ce', 's07b_05de', 's07b_05ee', 's07c_08e', 's07c_09e')
for(i in vv){
  eh18[,i]<-gsub("  "," ",as.character(eh18[,i]))
  eh18[,i]<-substr(eh18[,i],1,120)
} 
write_sav(eh18,"eh18p.sav")
save(eh18,vv,file="eh18p.RData")
rm(list=ls())
getwd()
load("eh18p.RData")
set.seed(123456)####semilla
a<-matrix(rnorm(20),5,4)

apply(a, 1, sum)
apply(a, 2, mean)
apply(a, 1, sd)
mc<-function(x){
  n<-length(x)
  aux<-sqrt(sum(x^2)/n)
  return(aux)
}
apply(a, 1, mc)
apply(a, 2, mc)

tapply(eh18$mujer,eh18$depto,mean)
tapply(eh18$mujer,list(eh18$depto,eh18$area),mean)
tapply(eh18$edad,list(eh18$depto,eh18$area),mean)
tapply(eh18$edad>60,list(eh18$depto,eh18$area),mean)
tapply(eh18$edad<5,list(eh18$depto,eh18$area),mean)

tapply(eh18$p0,list(eh18$depto,eh18$area),mean,na.rm=T)
aux<-tapply(eh18$p0,list(eh18$depto,eh18$area,eh18$niv_ed_g),mean,na.rm=T)

as.data.frame(aux)

lapply()
mapply()
sapply()



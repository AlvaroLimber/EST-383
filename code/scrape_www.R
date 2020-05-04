######################
#Proyecto: OIM
#Objetivo: Scrape a páginas web de trabajo
#Autor: Alvaro Chirino
#fechas: Abril 24, 2020
######################
rm(list=ls())
setwd("C:\\Users\\ALVARO\\Documents\\GitHub\\OIM-text-mining\\data")
######################
library(rvest)
library(foreign)
library(dplyr)
######################
#scrape página: buscojobs (2031 trabajos a la fecha)
######################
# anuncios en general
bd<-NULL
url<-"https://www.buscojobs.com.bo/ofertas/"
for(i in 1:136){
  print(i)
url2<-paste0(url,i)
www<-read_html(url2)
node<-html_nodes(www,".click")
for(j in 1:length(node)){
aux<-as.character(xml_attrs(xml_child(xml_child(xml_child(xml_child(node[[j]], 1), 1), 1), 1))[["href"]])
bd<-c(bd,aux)
}
}
bd<-paste0("https:",bd)
save(bd,file="buscojobs_url.RData")
# al interior de los anuncios
load("buscojobs_url.RData")
bd2<-data.frame(titulo="",text="",destino="",stringsAsFactors = F)

for(i in 823:length(bd)){
print(i)
www1<-read_html(bd[i])
#titulo
bd2[i,1]<-html_text(html_nodes(www1,".oferta-title")[1])
#texto
bd2[i,2]<-html_text(html_nodes(www1,"p")[2])
#destino
aux<-html_nodes(www1,".col-sm-12")
pos<-grepl("Lugar:",aux)
dest<-gsub("\t","", html_text(aux[pos][2]),fixed=T)
dest<-gsub("\n","", dest,fixed=T)
bd2[i,3]<-dest
}
save(bd2,file="buscojobs_data.RData")

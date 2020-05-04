rm(list=ls())
library(rvest)
#i<-1
aux<-NULL
for(i in 1:92){
  print(i)
  #cargar la información de la página correspondiente
  www<-"https://www.buscojobs.com.bo/ofertas/"
  pg<-read_html(paste0(www,i))
  #raspar las url de las ofetas de empleo en cada pagina
  node<-html_nodes(pg,".click")
    for(j in 1:length(node)){
      aux<-c(aux,xml_attrs(xml_child(xml_child(xml_child(xml_child(node[[j]], 1), 1), 1), 1))[["href"]])
    }
}
#raspando la informacion dentro de cada oferta de empleo
for(i in aux){
  w<-paste0("https:",i)
  pge<-read_html(w)
  aux2<-html_nodes(pge,".oferta-title")[1]
  print(html_text(aux2))
}
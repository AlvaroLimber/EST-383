rm(list=ls())
install.packages("rvest")
library(rvest)
library(help=rvest)
url<-"https://www.paginasiete.bo/"


p7<-read_html(url)

html_nodes(p7,".actual")

html_nodes(p7,"span")

bs<-read_html("https://www.boliviasegura.gob.bo/")

html_nodes(bs,".title-new")

ine<-read_html("https://www.ine.gob.bo/")
html_nodes(ine,"span")

nodes<-html_nodes(p7,"a")
tt<-html_text(nodes)
tt[100:110]

info<-read_html("https://www.infocasas.com.bo/venta/casas-y-departamentos/la-paz")
nodes<-html_nodes(info,".precio")
precio<-html_text(nodes)
precio[2]

node2<-html_nodes(info,".barrio")
barplot(table(html_text(node2)))

pp<-read_html("https://www.imdb.com/title/tt6751668/?ref_=hm_fanfav_tt_2_pd_fp1")
t1<-html_table(pp)

grep()




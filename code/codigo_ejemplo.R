bd<-data.frame(a=round(runif(1000,1,200)),b=rnorm(10000))

cut(bd$a,c(0,20,100,170,200))

library(dplyr)

bd<-bd %>% mutate(grupo=cut(a,c(0,20,100,170,200)))

#nativo
aux<-gsub("(","",bd$grupo,fixed = T)
aux<-gsub("]","",aux,fixed = T)
aux<-strsplit(aux,",")

aux<-do.call(rbind,lapply(aux, rbind))
aux<-data.frame(aux)
names(aux)<-c("li","ls")
aux$li<-as.numeric(aux$li)
aux$ls<-as.numeric(aux$ls)

bd<-cbind(bd,aux)
head(bd)

bd %>% mutate(xx=(li+ls)/2)

#ordenando una salida
t1<-bd %>% group_by(grupo) %>% summarise(x1=mean(b))
o<-order(t1$x1)
t1[o,]

bd %>% group_by(grupo)  %>% summarise(x1=mean(b)) %>% arrange(x1)
bd %>% group_by(grupo)  %>% summarise(x1=mean(b)) %>% arrange(desc(x1))

bd %>% arrange(a,b)


head(bd)

bd %>% filter(li==20)

bd %>% select(li,ls)

bd %>% filter(li==20) %>% select(li,ls,b) %>% summarise_all(median)

bd %>% summarise(table(grupo),mean(b))

bd %>% select(grupo) %>% table()

table(bd$grupo)

bd %>% summarise(quantile(b),table(grupo))

t1<-prop.table(table(bd$grupo))*100
f1<-barplot(t1)
barplot(t1,ylim=c(0,60))
text(f1,t1,paste0(t1,"%"),pos=3)
library(plotly)

load("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\data\\eh18.Rdata")

eh18p$s05a_01

eh18p %>% filter(s02a_03>=15) %>% mutate(alfa=s05a_01=="1. Si") %>% 
  group_by(depto) %>%  summarise(mean(alfa)*100)

#para el spark
eh18p %>% filter(s02a_03>=15) %>% mutate(alfa=ifelse(s05a_01=="1. Si",1,0)) %>% 
  group_by(depto) %>%  summarise(mean(alfa)*100)





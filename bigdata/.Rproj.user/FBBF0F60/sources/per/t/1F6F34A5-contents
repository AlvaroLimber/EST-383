rm(list=ls())
load(url('https://raw.githubusercontent.com/AlvaroLimber/EST-383/master/data/oct20.RData'))

names(computo)

names(computo)[18]<-"MAS"
#filtrado a una base de resultados de solo presidente y vicepresidente
head(computo)

bdp<-computo[computo$Elección=="Presidente y Vicepresidente", ]
bdp<-computo[computo$Elección==unique(computo$Elección)[1], ]

sum(bdp$`Votos Válidos`)
sum(bdp$Inscritos)
### GGPLOT2
install.packages("ggplot2")

#The grammar of graphics is an answer to a question: what is a statistical graphic? 

#base graphics 1983
#grid 2000
#lattice 1993
#ggplot 2005
#ggvis 2014
#plotly

## Datos (dataframe), estetica (x,y,z,color,size) y geometría (layers, formas)

library(ggplot2)

plot(bdp$CC,bdp$MAS)

ggplot(bdp,aes(x=CC,y=MAS))+geom_point()

p1<-ggplot(bdp,aes(x=CC))

p1+geom_boxplot()
p1+geom_density()
p1+geom_histogram()

p2<-ggplot(bdp,aes(x=CC,y=MAS))

p2+geom_point()
p2+geom_line() # datos temporales

bdaux<-data.frame(x=2000:2020,y=rnorm(21,60,15))

ggplot(bdaux,aes(x=x,y=y))+geom_line()

unique(bdp$País)

ggplot(bdp[bdp$País=="Bolivia",],aes(x=Departamento))+geom_bar()

bdp<-bdp[bdp$País=="Bolivia",]

aggregate(bdp$MAS,by=list(bdp$Departamento,bdp$Provincia,bdp$Municipio),sum)

bdmun<-aggregate(bdp[,13:25],by=list(dep=bdp$Departamento,pro=bdp$Provincia,
                                     mun=bdp$Municipio),sum)

ggplot(bdmun,aes(MAS,CC))+geom_point()

bdmun[,5:13]<-(bdmun[,5:13]/bdmun$`Votos Válidos`)*100

ggplot(bdmun,aes(MAS,CC))+geom_point()

ggplot(bdmun,aes(MAS,PDC))+geom_point()


ggplot(bdmun,aes(MAS,CC,colour=dep,size=`Votos Válidos`))+geom_point()
ggplot(bdmun,aes(MAS,CC,shape=dep,size=`Votos Válidos`))+geom_point()

ggplot(bdmun,aes(MAS,CC))+geom_point(colour="blue")
ggplot(bdmun,aes(MAS,CC))+geom_point(aes(colour=dep))

ggplot(bdmun,aes(MAS,CC))+geom_point(colour="blue")+facet_wrap(~dep)

ggplot(bdmun,aes(MAS,CC))+geom_point(colour="blue")+geom_smooth()+facet_wrap(~dep)

ggplot(bdmun,aes(MAS,CC))+geom_point(colour="blue")+geom_smooth(method = "lm")

ggplot(bdmun,aes(CC,dep))+geom_point()

ggplot(bdmun,aes(dep,CC))+geom_boxplot()
ggplot(bdmun,aes(dep,CC))+geom_violin()
ggplot(bdmun,aes(dep,CC))+geom_jitter()

ggplot(bdmun,aes(MAS,CC))+geom_point(colour="brown",size=2,alpha=1/3)+xlim(0,100)+
  ylim(0,100)+xlab("Organización Política: MAS")+ylab("Organización Política: CC")+
  ggtitle("MAS vs CC, elecciones 20 octubre 2019")

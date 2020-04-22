#6. Empleando la ENDSA muestre por año y departamento 
#el porcentaje de personas que fuman
#7. Utilizando la base de datos del COVID-19 genere un gráfico de evolución de contagios, muertes y recuperados. Use los gráficos de origen
#8. Utilizando la base de datos del COVID-19 genere un gráfico de evolución de contagios, muertes y recuperados. Use ggplot
rm(list = ls())
load(url("https://github.com/AlvaroLimber/EST-383/raw/master/data/endsa.RData"))

names(endsa)
aux<-attributes(endsa)

str(aux)

aux$var.labels
######
#año 4 year, departamento 2 depto, fuman 15 ae09
names(endsa)[15]

table(endsa$year)
table(endsa$depto)
table(endsa$ae09)

table(endsa$year,endsa$ae09)

table(endsa$year,endsa$ae09,endsa$depto)

t1<-table(endsa$depto,endsa$ae09,endsa$year)

t03<-prop.table(t1[,,4],1)*100
t08<-prop.table(t1[,,5],1)*100

prop.table(t1,c(1,3))*100
  
barplot(t(t03),col=c("darkgreen","brown")
        ,beside = F)
plot(t1[,,4])

fx<-function(x){
  y<-x^2
  return(y)
}
curve(fx,xlim = c(-10,10))


con<-read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv",sep=",")



x<-rnorm(20,20,3)
y<-x+rnorm(20,2,1)
w<-runif(20,0.5,4)
# defecto
plot(x,y)
# escalas
plot(x,y,xlim=c(15,30),ylim=c(15,30))
# escalas
plot(x,y,xlim=c(15,30),ylim=c(15,30),type = "p")

# colores
plot(x,y,xlim=c(15,30),ylim=c(15,30),type = "p",col="#493E4D")
# ejes 
plot(x,y,xlim=c(15,30),ylim=c(15,30),type = "p",col="#493E4D",
     axes = F,cex=w )
axis(1,seq(15,30,3),labels = c("a","b","c","d","f","g"))
axis(2)
#etiquetas de ejes y titulo
plot(x,y,xlim=c(15,30),ylim=c(15,30),type = "p",col="#493E4D",
     axes = F,cex=w,xlab = "Personas",ylab="ingresos")
axis(1,seq(15,30,3),labels = c("a","b","c","d","f","g"))
axis(2)
title(main = "Scatter de ejemplo",cex.main=3,col.main="brown",
      sub = "EST-383",cex.sub=0.5)
points(x,y,type = "h")
xx<-locator(1)
text(xx,"HOLA")
ll<-paste0("p",1:20)
text(x,y,ll,cex = 0.7,pos=3,col = "blue")
text(xx,"HOLA",cex=2)
#para manejo de fechas
library(lubridate)

load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/covid-19.Rdata"))

View(bdc)
names(bdc)





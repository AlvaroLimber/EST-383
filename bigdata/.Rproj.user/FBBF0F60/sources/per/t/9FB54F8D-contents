rm(list=ls())
load(url("https://github.com/AlvaroLimber/EST-384/raw/master/data/eh19.RData"))
######Gráficos en R

plot(0,xlim=c(0,10),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F)
plot(0,xlim=c(0,10),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F)

plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",
     axes = F,ann = F,type="n")

points(x=1:20,y=seq(1,40,2))
points(x=1:20,y=seq(1,40,2),type = "l")
points(x=1:20,y=seq(1,40,2),type = "h")

points(x=1:20,y=seq(1,40,2)+5,type = "b")

points(x=1:20,y=seq(1,40,2)+10,type = "p",col=rgb(95, 51, 51, 100, maxColorValue=255))
points(x=1:20,y=seq(1,40,2)+15,type = "p",col=c(rep("#719EF2",10),rep("#F51818",10)))
points(x=1:20,y=seq(1,40,2)+5,type = "b",cex=2)
points(x=1:20,y=seq(1,40,2)+5,type = "b",cex=0.5)

points(x=1:20,y=seq(1,40,2)+5,type = "b",cex=seq(0.5,10,0.5))

points(x=1:20,y=seq(1,40,2)+5,type = "p",cex=seq(0.5,10,0.5),col=c(rep("#719EF2",10),rep("#F51818",10)))

points(x=1:20,y=seq(1,40,2)+5,type = "p",cex=seq(0.5,10,0.5),pch=15)

points(x=1:20,y=seq(1,40,2)+5,type = "p",cex=seq(0.5,10,0.5),pch=1:20)

points(x=1:20,y=seq(1,40,2)+5,type = "p",cex=seq(0.5,10,0.5),pch=1:20,col=c(rep("#719EF2",10),rep("#F51818",10)))

axis(1)
axis(2,seq(0,50,5))
axis(3,c(0,10,20),c("Hola","adios","Chau"))
axis(4,cex.axis=3,col="red",col.ticks = "blue")

title(main="Título",sub = "Sub título",xlab = "Eje X",ylab="Eje Y")


plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",
     axes = F,ann = F,type="n")
text(x=1:20,y=seq(1,40,2)+5,c("Hola","chau"),cex=0.8,col="brown")
axis(1)
axis(2,seq(0,50,5))

text(11,35,"Estadística")
aux<-locator(2)

text(aux,"umsa")

#lineas
plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",
     axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))

points(0:20,runif(21,20,40),type="l",lwd=5)
points(0:20,runif(21,20,40),type="l",lwd=5,col="darkblue")

points(0:20,runif(21,0,50),type="l",lwd=2,col="darkblue",lty=2)
points(0:20,runif(21,0,50),type="l",lwd=2,col="darkred",lty=3)
points(0:20,runif(21,0,50),type="l",lwd=2,col="brown",lty=4)
points(0:20,runif(21,0,50),type="l",lwd=2,col="black",lty=5)
points(0:20,runif(21,0,50),type="l",lwd=2,col="green",lty=6)

# otras lineas
plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",
     axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))

abline(a=2,b=1)

abline(h=35,lty=2,col="gray")
abline(v=c(5,15),lty=2,col="gray")

segments(0,45,15,35,lwd=2,col="blue",lty=6)


getwd()
# guardar los gráficos

pdf("g1.pdf")#0 abrir el pdf
plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35) #1 crear los gráficos
dev.off() #2 cerrar el pdf

pdf("g2.pdf")#0 abrir el pdf

plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35) #1 crear los gráficos

plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35,col="green") #1 crear los gráficos

dev.off() #2 cerrar el pdf

png("g3.png")
plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35,col="green") #1 crear los gráficos
dev.off()

jpeg("g4.jpg")
par(mfrow=c(2,2))
plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35) #1 crear los gráficos

plot(0,xlim=c(0,20),ylim=c(0,50),xlab="Eje X",ylab="Eje Y",axes = F,ann = F,type="n")
axis(1)
axis(2,seq(0,50,5))
arrows(0,45,15,35,col="green") #1 crear los gráficos
dev.off()

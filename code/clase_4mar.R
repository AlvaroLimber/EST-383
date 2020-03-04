rm(list=ls())
################
plot(0,0)#inicia una hoja en blanco
plot(0,0,type = "n")

x<-c(3,4,7,2)
y<-c(0,6,9,2)
plot(x,y,type="p")

plot(x,y,type="h")
plot(x,y,type="l")
plot(x[order(x)],y[order(x)],type="l")
plot(x,y,type = "b")
plot(x,y,type = "o")

par(mfrow=c(2,2))
plot(x,y,xlim=c(0,10),ylim=c(0,10),main="c/PUNTOS")
plot(x,y,type="n",xlim=c(0,10),ylim=c(0,10),main = "S/puntos")
plot(x,y,type="n",xlim=c(0,10),ylim=c(0,10),
     axes = F,main="sin ejes")
plot(x,y,type="n",xlim=c(0,10),ylim=c(0,10),
     axes = F,ann = F,main = "blanco")
par(mfrow=c(1,1))

plot(x,y,type="n",xlim=c(0,10),ylim=c(0,10),
     axes = F,ann = F)
points(x,y,cex=c(1,2,3,4)+1)     
points(x,y,cex=c(1,2,3,4)+1,pch=15)     
points(x,y,cex=c(1,2,3,4)+1,pch=15,col="blue")     
points(x,y,cex=c(1,2,3,4)+1,pch=0:3,
       col=c("red","darkblue","pink","darkgreen"))
#points(x,y,cex=2)     
pdf("figura1.pdf",width = 15,height = 5)
plot(x,y,type="n",xlim=c(0,20),ylim=c(0,20),
     axes = F,ann = F)
points(seq(2,10,2),seq(2,10,2),type="p",lwd=4,
       col="blue",lty=4)
text(seq(2,10,2),seq(2,10,2),
     labels = c("p1","p2","p3","p4","p5"),pos=3,
     cex=1:5,col="brown")
axis(1,seq(0,20,10),lwd=3)
axis(2,seq(0,20,5),lwd=2)
axis(4,seq(0,20,5),seq(0,400,100),lwd=2)
axis(3,seq(0,20,10),c("A","B","C"),lwd=2)
title(main="Plot en R",col.main="darkred",
      cex.main=3)
title(xlab = "Eje X",ylab="Eje Y",cex.lab=2,
      col.lab="gray")
legend("topright",legend = c("a","b","c"),
       lwd=c(1,2,3),col=c("darkred","black","gray"))
dev.off()
getwd()

png("figura1.png")
plot(x,y,type="n",xlim=c(0,20),ylim=c(0,20),
     axes = F,ann = F)
points(seq(2,10,2),seq(2,10,2),type="p",lwd=4,
       col="blue",lty=4)
dev.off()

pdf("sec.pdf")
for(i in 1:10){
  plot(i,0,xlim=c(0,10))
}
dev.off()


abline(h=c(2,3,4),lty=2)
abline(v=c(2,3,4))

bd<-as.data.frame(state.x77)
bd$name<-row.names(bd)
head(bd)

#4. Realice una función para el calculo del tamaño de muestra 
#para el muestreo aleatorio simple, considere la media, el margen de error
#relativo y coeficientes de confianza.
#5. Crear una función que realice la prueba de independencia 
#Chi-cuadrado 
#6. Empleando la ENDSA muestre por año y departamento el }
#porcentaje de personas que fuman.


#V(media x)= (1-f) S^2/n
#mea = z_{alpha}* raiz v(x)
#mer=z_{alpha}* raiz v(x)/x
#mer^2= z^2 (1-n/N) S^2/n*x^2
#mer^2= z^2 (1-n/N) cv^2/n
#opción 1, ignorar N
#mer^2= z^2 cv^2/n
#n=z^2 cv^2 / mer^2
#n0=(z*cv/mer)^2
tmuestra_mu<-function(mer,cv,confianza=0.95){
  z<-qnorm(1-(1-confianza)/2) 
  n0<-(z*cv/mer)^2
  return(n0)
}
tmuestra_mu(mer=0.10,cv=1)
#opcion 2, tomar en cuanta N
#n=n0/(1+n0/N)
tmuestra_mu2<-function(mer,cv,confianza=0.95,N){
  z<-qnorm(1-(1-confianza)/2) 
  n0<-(z*cv/mer)^2
  n<-n0/(1+n0/N)
  return(n)
}
tmuestra_mu2(mer=0.1,cv=1,N=1000)
#opcion 3, ambos casos
tmuestra_mu3<-function(mer,cv,confianza=0.95,f=FALSE,N){
  z<-qnorm(1-(1-confianza)/2) 
  n0<-(z*cv/mer)^2
  if(f==T){
  n<-n0/(1+n0/N)
  return(n)
  } else {
    return(n0)
  }
}
tmuestra_mu3(mer=0.1,cv=1,f=F)
tmuestra_mu3(mer=0.1,cv=1,f=T,N=1000)

#5. Crear una función que realice la prueba de independencia 
#Chi-cuadrado 
x<-rbinom(100,10,0.7)
y<-rbinom(100,10,0.7)
bd<-data.frame(x,y)
a<-table(bd$x,bd$y)
a1<-addmargins(a)
#opción1
tf<-apply(a,1, sum)
tc<-apply(a,2, sum)
N<-sum(a)
esp<-matrix(NA,length(tf),length(tc))
for(i in 1:length(tf)){
  for(j in 1:length(tc)){
    esp[i,j]<-tf[i]*tc[j]/N
  }
}
esp
#opción2
E<-(tf %*% t(tc))/N
#calcular el estadístico
xx<-sum(((a-E)^2)/E)
xx
qchisq(0.95,(length(tf)-1)*(length(tc)-1))
qchisq(0.05,(length(tf)-1)*(length(tc)-1),lower.tail = F)
#pvalor
pchisq(xx,(length(tf)-1)*(length(tc)-1),lower.tail = F)
chisq.test(a)
curve()













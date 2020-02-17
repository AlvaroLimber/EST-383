rm(list = ls())
x<-5
## if
if(x>6){
  hist(rnorm(100,3,2))
}
## if else
if(x>6){
  hist(rnorm(100,3,2))
} else {
  boxplot(rnorm(100,3,2))
}
## if encadenado
x<-60
if(x>6){
  hist(rnorm(100,3,2))
  mean(x)
} else if(x<6){
  boxplot(rnorm(100,3,2))
} else if(typeof(x)=="double"){
  print("hola")
} else {
  print("hola hola")
}
##for
for(i in 1:100){
  print(i)
}
for(i in c(2,7,9,15,19)){
  print(i)
}  
for(i in c("a","b","c")){
  print(i)
}  
for(i in 1:5){
  for(j in 6:10){
    print(i*j)
  }
}
for(i in 1:5){
  for(j in 6:10){
    aux<-i*j
    print(aux)
    if(aux==20){
      break()
      print("hola")
      boxplot(rnorm(100,i,j))
    }
  }
}
#while
z<-1
k<-1
while(z>0.0001){
  print(k)
  z<-1/k
  k<-k+1
}
### funciones
fx<-function(x){
  y<-8*x**2
  return(y)
}
fx(5)
fx(1:10)
curve(fx,xlim = c(-20,20),ylim=c(0,1000))
plot(fx)
##comando de estadisticas de tendencia central
tendencia<-function(x){
  n<-length(x)
  cat("media:",fill = T)
  print(sum(x)/n)
  cat("mediana:",fill = T)
  x<-sort(x)
  if(n%%2==0){
    me<-(x[n/2]+x[n/2+1])/2
  } else {
    me<-x[ceiling(n/2)]
  }
  print(me)
  cat("moda:",fill = T)
  tt<-table(x)
  mm<-max(tt)
  print(names(tt)[(table(x)==mm)])
  cat("media cuadrática:",fill = T)
  mc<-sqrt(sum(x**2)/n)
  print(mc)
  cat("media armónica",fill = T)
  ma<-n/sum(1/x)
  print(ma)
  cat("media geométrica:",fill = T)
  mg<-prod(x)**(1/n)
  print(mg)
}
xx<-scan()
a<-tendencia(xx)

tendencia2<-function(x){
  n<-length(x)
  media<-sum(x)/n
  x<-sort(x)
  if(n%%2==0){
    me<-(x[n/2]+x[n/2+1])/2
  } else {
    me<-x[ceiling(n/2)]
  }
  tt<-table(x)
  mm<-max(tt)
  mo<-names(tt)[(table(x)==mm)]
  mc<-sqrt(sum(x**2)/n)
  ma<-n/sum(1/x)
  mg<-prod(x)**(1/n)
  aux<-list(media,me,mo,mc,ma,mg)
  return(aux)
}
a<-tendencia2(xx)

tendenciaF<-function(x,f){
  n<-sum(f)
  media<-sum(x*f)/n
}










# funciones en el R: Destinadas a crear nuevos comandos

#f(x) = y
#f(x)=x^2=y
#g(x1,x2)=(x1+x2)/2=y

fx<-function(x){
  y<-x^2
  return(y)  
}

fx(x=4)
fx(5)

y<-60

fx(40)

fx(1:10)

a<-matrix(3,5,5)
a

fx(a)

z<-fx(10)

z1<-mean(1:10)
z2<-sum(1:10)

curve(fx,xlim=c(-5,5),ylim=c(-5,5))

gx<-function(x){
  y<- exp(-x^2)
  return(y)
}

curve(gx,xlim=c(-3,3),ylim=c(0,1.5))
integrate(gx,0,2)

# ejemplos: Crear una función que devuelva 
# las medidas de tendencia central

mtendencia<-function(x){
  #Media
  media<-mean(x)
  #Mediana
  mediana<-median(x)
  #Moda
  t1<-data.frame(table(x))
  aux<-max(t1$Freq)
  #t1[t1$Freq==aux,"x"]
  moda<-t1$x[t1$Freq==aux]  
  #guardar los objetos
  y<-list(media=media,mediana=mediana,moda=moda)
  return(y)
}

mtendencia2<-function(x){
  #Moda
  t1<-data.frame(table(x))
  moda<-t1$x[t1$Freq==max(t1$Freq)]  
  #guardar los objetos
  return(list(media=mean(x),mediana=median(x),moda=moda))
}

mtendencia3<-function(x){
  if(is.numeric(x)){
    #Moda
    t1<-data.frame(table(x))
    moda<-t1$x[t1$Freq==max(t1$Freq)]  
    #guardar los objetos
    return(list(media=mean(x),mediana=median(x),moda=moda))
  } else {
    print("El vector no es numérico")
  }
}

x<-rbinom(10,4,0.4)
mtendencia(x)
mtendencia2(x)
mtendencia3("hola")
mtendencia3(1:100)

gx<-function(x,y){
  cov1<-cov(x,y)
  cor1<-cor(x,y)
  # y = b0 +b1 x+e
  mod1<-summary(lm(y~x))
  y<-list(covarianza=cov1,correlacion=cor1,rlineal=mod1)
  return(y)
}

x1<-rnorm(100,50,7)
y1<-rnorm(100,60,5)

gx(x=x1,y=y1)

#Nota: Todas las variables o procesos que se realizan al interior 
# de una función son temporales

# importación de datos y la exploración

# nota: el R ofrece bases de datos cargadas en el sistema
data()

# importación de datos

## definir el directorio de trabajo
getwd() # conocer el directorio de trabajo
setwd("C:\\Users\\ALVARO\\Box\\UMSA\\2019\\anomalias") # cambiar el directorio de trabajo
dir() 
# csv
bd_21f<-read.csv("21f.csv",sep="|",encoding="UTF-8")
str(bd_21f)
# cortar y pegar
# excel
# spss
# stata
# json ...
# xml ...






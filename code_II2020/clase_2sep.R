## vectores

# Algunas funciones para vectores

1:100
1:1000
100:50
(-10):10

sum(1:1000)

rep(2,20)

v1<-rep("hola",20)
v2<-rep("chau",20)
v3<-rep(c(4,5),10)

v3*4
v3+4
v3^2

v3+v3
v3*v3

paste(v1,v2,v3,"umsa")

seq(0,1,0.01)
seq(1,1000,2)

length(v2) # el tamaño del vector
v4<-(v3==4)
sum(v4)
v4*1
mean(v4) # media de un vector

## indexación en vectores

v3[16]
v3[1:5]
v3[c(1,2,3,4,5)]

v3[v3==5]

v1[v3==5]

v3[16]<-80
v3[1:5]<-seq(0,40,10)
v3[v3==5]<-0
v3

# funciones estadísticas

runif(100,0,10) # dist. Uniforme
rbinom(100,10,0.4) # dist. Binomial
set.seed(292020) # semilla
rnorm(10,40,6)
?runif()

## Matriz


a1<-matrix(c(1,2,3,4,5,6),3,2) # 3 x 2

matrix(1:100,10,10) # 10,10

matrix(1:100,10,10,byrow=T)

t(a1) # transpuesta

matrix(1,3,5)
matrix(1:2,3,5)
matrix("hola",5,10)

a2<-matrix(c(2,4,6,"hola"),5,6)

matrix(as.numeric(a2),5,6)

#funciones
a1
v1<-1:5

a1+a1
a1+t(a1)

a1/a1

a1*a1

a1 %*% t(a1) # (3x2) (2x3) = (3x3)

v1 %*% t(v1)  # (5x1) (1x5)

t(v1) %*% v1  # (1x5) (5x1)

diag(1,5,5)
diag(1:5,5,5)

a2<-a1 %*% t(a1)

det(a2)

set.seed(123)
a3<-matrix(rbinom(16,10,0.6),4,4)
det(a3)
solve(a3) # inversa de una matriz
a3^(-1) # 

round(solve(a3) %*% a3,1)

a4<-(a3 %*% t(a3))
det(a4)
eigen(a4) # Descomposición espectral

A = P L P

svd(a4)
eigen(a4)

<- , = ->
  
## Indexación
  
a3[2,3 ]
a3[2,3 ]<-40
a3[2,]  
  
a3[,3]

a3[c(1,4),]

a3[,c(2,4)]

a3[c(1,4),c(2,4)]

a5<-a3[,-3]

cbind(a5,1:4) # unir columnas
cbind(1:4,a5)

rbind(a5,1:3)

a6<-a3[,c(3,4,2,1)]
a6

sort(a3[2,])

oo<-order(a3[2,])
a3[,oo]

a<-1/seq(1,100,2)
b<-rep(c(1,-1),25)
abs(sum(a*b)-pi/4)
k=0.01


# Heterogéneas
Pueden contener objetos de diferentes clases

## dataframe (Marco de datos) 
Un dataframe supone que las filas corresponden a observaciones y las columnas 
a variables, donde las variables pueden ser de diferentes clases; numéricas, 
texto, lógico, etc. La forma es muy parecida a una matriz. 

Un data frame se puede generar a partir de la colección de vectores o por un 
proceso de importación de datos.

sexo<-c("H","M","M","H","M")
edad<-c(20,23,24,30,22)
salario<-c(0,3000,1000,0,0)

bd1<-data.frame(sexo,edad,salario)
bd1
class(bd1)

#Nota: la indexación en un dataframe es similar a la de una matriz

bd1[,2]
bd1[3,]

bd1[,"edad"]
bd1[,"salario"]

Adicionalmente se puede usar el simbolo "$" como operador para acceder a las 
variables

bd1$edad
bd1$salario
bd1$sexo

bd2<-data.frame(sexo=c("H","M","M","H","M"),
                edad=c(20,23,24,30,22),
                salario=c(0,3000,1000,0,0))
bd2

a<-matrix(1:20,4,5)
bd3<-as.data.frame(a) # transforma a una matriz a dataframe 
bd3

dim(bd1) # 
names(bd1)
names(bd1)[2]<-"EDAD"
bd1


## lista 

l1<-list(bd1,bd2,bd3,"hola",seq(1,1000,0.01))
class(l1)

l2<-list(BD1=bd1,BD2=bd2,BD3=bd3,scalar="hola",vector=seq(1,1000,0.01))

# comando para conocer la estructura de un dataframe o una lista
str(l1)
str(l2)
str(bd1)

l1[[1]]
l1[[4]]
l1[[2]][1,3]

l2$vector
l2$BD2
l2$BD3[2,3]
l2$BD3$V3

l2$BD3
l2[[3]]

l3<-list(l1,l2,bd1,bd2,"hola")
str(l3)

l3[[2]][[2]]$edad

l3[[2]]$BD2$edad

# Comandos: for, if, while, (loops y condiciones)

## for: Se repite una proceso un determinado número de veces

for(i in 1:10){
  print(i)
  print(a)
  z<-i^2
  print(z)
}

# la unica regla para el iterador es que este sea un vector

ddep<-c("ch","lp","cb","or","pt","tj","sc","bn","pd")

for(j in ddep){
  print(j)
}

for(j in ddep){
  print(j)
  for(i in seq(1,100,2)){
    print(paste(j,":",i))
  }
}


## if: Acciones basadas en codiciones
x<-0
if(x>2){
  print("hola")
}

x<-6
if(x>2){
  print("hola")
} else {
  print("chau")
}

x<-2
  if(x==2){
  print("a")
} else if (x==3){
  print("b")
} else if (x==4){
  print("c")
} else if (x>4){
  print("d")
} else {
  print("e")
}


for(i in 1:5){
  print(i)
  if(i==3){
    print("hola")
    break
  } 
}

for(i in 1:5){
  print(i)
  if(i==3){
    next
    print("hola")
  }
  print("chau")
}

x<-0
while(x==0){
  print("hola")
}

while(x<1000){
  print(paste("hola",x))
  x<-x+1
}


Ejemplo con la tolerancia k de series convergentes
de los recíprocos de las potencias de 2

k<-0.001
i<-0
vf<-2
ss<-(1/(2^i))

while(abs(sum(ss)-vf)>k){
  i<-i+1
  ss<-c(ss,(1/(2^i)))
}






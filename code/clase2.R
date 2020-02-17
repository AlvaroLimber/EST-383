v<-1:10
v2<-c("a","b","2")
as.character(v)
as.numeric(v)
x1<-as.numeric(v2)
x1
is.na(x1)

0/0
x2<-NULL
x2
str(x1)
typeof(x1)
typeof(v2)
# vectores con usos estadisticos
rpois(10,5)
dpois()
ppois()

?rbinom(10,5,0.1)
rnorm(10,5,10)
runif(10,50,500)
rchisq(10,2)
rexp(10,5)

x<-rchisq(1000,3)
hist(x)

(sum((x-mean(x))**4)/1000)/sd(x)**4
median(rexp(100000,3))
quantile(x,c(2,56)/100)
quantile(x,1:100/100)

a1<-matrix(1:20,4,5)
I<-diag(rep(1,5))
b1<-t(a1)%*%a1
b2<-a1%*%t(a1)
solve(b1)
solve(b2)
det(b1)
det(b2)
eigen(b1)
dim(b1)
#indexación
v2<-c("a","b","2")
v2[1]
v2[3]

v3<-1:20
v3<-v3/10
v3
v3[c(3,19)]
v3[v3>0.5]

v3[v3==1]
v3[v3!=0.9]

v3[v3>0.5 & v3<1]
v3[v3>0.5 || v3<1]

a1
a1[1,]
a1[,1]
a1[3,1]
a1[c(1,4),]
a1[,c(2,4)]
a1[c(1,4),c(2,4)]
a1[,2]>6
a1[a1[,2]>6,]

mean(a1)
a2<-as.data.frame(a1)
a2


str(a2)
mean(a2$V1)
colMeans(a2)

summary(a2)
cov(a2)
cor(a2)
a2



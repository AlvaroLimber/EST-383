rm(list=ls())
N<-15;n<-6
choose(N,n)
set.seed(123)
y1<-rnorm(N,10,5)
set.seed(234)
y2<-rexp(N,3)
set.seed(345)
y3<-runif(N,500,3000)
#parámetros
theta1<-mean(y1)
theta2<-sum(y2)
# sum(y3>1500)/N
# mean(y3>1500)
theta3<-mean(y3>1500)
#práctica (real) solo se tiene acceso a una
#muestra
U<-1:10
set.seed(888)
s<-sample(U,n)
s
y1
#estimaciones
mean(y1[s]);theta1
mean(y2[s])*N ; theta2
mean(y3[s]>1500) ; theta3

combn(U,3)
combn(y1,3)

combn(y1,3,mean)
#theta1
t1s<-apply(combn(y1,n),2,mean)
mean(t1s)
theta1
hist(t1s)
plot(density(t1s))
shapiro.test(t1s)
#theta2
t2s<-apply(combn(y2,n),2,mean)*N
mean(t2s);theta2
hist(t2s)
plot(density(t2s))
shapiro.test(t2s)
#theta3
t3s<-apply(combn(y3,n)>1500,2,mean)
mean(t3s);theta3
hist(t3s)
plot(density(t3s))
shapiro.test(t3s)
####Inferencia a partir de una muestra
#libreria survey
install.packages("survey")
library(survey)
bd<-data.frame(y1,y2,y3=y3>1500)
set.seed(123)
s<-sample(1:15,7)
bds<-bd[s,]
bds$w<-15/7
bds$pk<-7/15
bds
dm1<-svydesign(ids=~0,probs = ~pk,data=bds)
svymean(~y1,design = dm1)
svytotal(~y2,design = dm1)
library(help=survey)
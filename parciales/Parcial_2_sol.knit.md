---
title: "Solucionario: Segundo Parcial (30pts)"
subtitle: "Programacion Estadística I"
author: "Lic. Alvaro Chirino Gutierrez"
date: "17/7/2020"
output: pdf_document
editor_options: 
  chunk_output_type: console
---



# Pregunta 1 (5 pts)

* (1pts) Describa la diferencia entre los procesos de inferencia: descriptiva, causal y predictivo 
* (1pts) De un ejemplo de record linkage
* (2pts) Describa los errores de fila, columna y celda
* (1pts) Describa los errores asociados a las 3 V en big data


# Pregunta 2 (10 pts)



* (5pts) Usando la base de datos de computo para las elecciones del 20 de octubre de 2019:

Solución,


```r
rm(list=ls())
# 1. Cargue la base en R
load("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\data\\oct20.RData")
#2. Guarde la base en csv
setwd("C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\parciales")
write.csv(computo,"computo.csv")
#3. Cargue el csv como un objeto ffdf. Con el nombre bd1.
library(ffbase)
```

```
## Loading required package: ff
```

```
## Loading required package: bit
```

```
## Attaching package bit
```

```
## package:bit (c) 2008-2012 Jens Oehlschlaegel (GPL-2)
```

```
## creators: bit bitwhich
```

```
## coercion: as.logical as.integer as.bit as.bitwhich which
```

```
## operator: ! & | xor != ==
```

```
## querying: print length any all min max range sum summary
```

```
## bit access: length<- [ [<- [[ [[<-
```

```
## for more help type ?bit
```

```
## 
## Attaching package: 'bit'
```

```
## The following object is masked from 'package:base':
## 
##     xor
```

```
## Attaching package ff
```

```
## - getOption("fftempdir")=="C:/Users/ALVARO/AppData/Local/Temp/Rtmp0qHr9r"
```

```
## - getOption("ffextension")=="ff"
```

```
## - getOption("ffdrop")==TRUE
```

```
## - getOption("fffinonexit")==TRUE
```

```
## - getOption("ffpagesize")==65536
```

```
## - getOption("ffcaching")=="mmnoflush"  -- consider "ffeachflush" if your system stalls on large writes
```

```
## - getOption("ffbatchbytes")==84641054.72 -- consider a different value for tuning your system
```

```
## - getOption("ffmaxbytes")==4232052736 -- consider a different value for tuning your system
```

```
## 
## Attaching package: 'ff'
```

```
## The following objects are masked from 'package:bit':
## 
##     clone, clone.default, clone.list
```

```
## The following objects are masked from 'package:utils':
## 
##     write.csv, write.csv2
```

```
## The following objects are masked from 'package:base':
## 
##     is.factor, is.ordered
```

```
## Registered S3 methods overwritten by 'ffbase':
##   method   from
##   [.ff     ff  
##   [.ffdf   ff  
##   [<-.ff   ff  
##   [<-.ffdf ff
```

```
## 
## Attaching package: 'ffbase'
```

```
## The following objects are masked from 'package:ff':
## 
##     [.ff, [.ffdf, [<-.ff, [<-.ffdf
```

```
## The following objects are masked from 'package:base':
## 
##     %in%, table
```

```r
library(ff)
system("mkdir ffdf")
```

```
## [1] 1
```

```r
options(fftempdir="C:\\Users\\ALVARO\\Documents\\GitHub\\EST-383\\parciales\\ffdf")
bd1<-read.csv.ffdf(file="computo.csv",sep=",",header=T,colClasses=NA)
# 4. Sobre el objeto bd1 obtenga una tabla de departamento vs. tipo de elección
head(table(bd1$Departamento,bd1$Elección))
```

```
##               
##                Diputados Uninominales Presidente y Vicepresidente
##   Berlín                            0                           2
##   Bruselas                          0                           1
##   Buenos Aires                      0                         532
##   Chubut                            0                          14
##   Chuquisaca                     1828                        1828
##   Cordoba                           0                          22
##               
##                Diputados Especiales
##   Berlín                          0
##   Bruselas                        0
##   Buenos Aires                    0
##   Chubut                          0
##   Chuquisaca                      0
##   Cordoba                         0
```

```r
# 5. Repita el paso 4 con una base obtenida con el comando as.ffdf o as.data.frame.ffdf
bd2<-as.data.frame(bd1)
bd2<-as.ffdf(bd2)
head(table(bd2$Departamento,bd2$Elección))
```

```
##               
##                Diputados Uninominales Presidente y Vicepresidente
##   Berlín                            0                           2
##   Bruselas                          0                           1
##   Buenos Aires                      0                         532
##   Chubut                            0                          14
##   Chuquisaca                     1828                        1828
##   Cordoba                           0                          22
##               
##                Diputados Especiales
##   Berlín                          0
##   Bruselas                        0
##   Buenos Aires                    0
##   Chubut                          0
##   Chuquisaca                      0
##   Cordoba                         0
```

```r
#otra alternativa
aux<-sapply(computo,is.character)#character a factor
for(i in names(computo)){
  if(aux[i]==T){
    computo[,i]<-as.factor(computo[,i])
  }
}
bd3<-as.ffdf(computo)
head(table(bd3$Departamento,bd3$Elección))
```

```
##              
##               Diputados Especiales Diputados Uninominales
##   Acre                           0                      0
##   Andalucia                      0                      0
##   Antofagasta                    0                      0
##   Arica                          0                      0
##   Atacama                        0                      0
##   Beijing                        0                      0
##              
##               Presidente y Vicepresidente
##   Acre                                  1
##   Andalucia                            22
##   Antofagasta                          68
##   Arica                                14
##   Atacama                               6
##   Beijing                               1
```

* (5pts) Usando la base de datos de computo para las elecciones del 20 de octubre de 2019. Seleccione solo Bolivia y las elecciones de presidente y vicepresidente. 
  
Solución, 


```
## $Duration
##    user  system elapsed 
##    0.02    0.00    0.02 
## 
## $Result
##     Inscritos            CC           FPV           MTS           UCS 
##       6973768       2186326         23028         75529         24007 
##    MAS - IPSP           21F           PDC           MNR       PAN-BOL 
##       2768427        256833        522576         41033         37841 
## Votos Válidos       Blancos         Nulos 
##       5935944         91610        222856
```

```
## $Duration
##    user  system elapsed 
##    0.03    0.00    0.03 
## 
## $Result
##            CC           FPV           MTS           UCS    MAS - IPSP 
##    66.1640843     0.6968890     2.2857100     0.7265162    83.7800206 
##           21F           PDC           MNR       PAN-BOL Votos Válidos 
##     7.7724549    15.8145503     1.2417686     1.1451701   179.6375741 
##       Blancos         Nulos 
##     2.7723641     6.7442198
```


# Pregunta 3 (15 pts)

* (5 pts) Usando la encuesta de hogares defina una base de datos que contenga las siguientes variables para los jefes de hogar:
  + Edad
  + Sexo 
  + Ingreso laboral
  + Departamento 
  + Años de educación
  + Área
  + Incidencia de pobreza moderada (p0)
  + Acceso a internet en el hogar
  + Vivienda propia y totalmente pagada
  + Número de miembros en el hogar

(Sugerencia: Use la variable folio y el comando merge para unir bases)

Solución,


```r
rm(list=ls())
load(url("https://github.com/AlvaroLimber/EST-383/raw/master/data/eh18.Rdata"))
#jefe/a del hogar
jefe<-eh18p %>% filter(s02a_05==unique(eh18p$s02a_05)[1]) %>% select(folio,s02a_02,s02a_03,ylab,depto,aestudio,area,p0)
#variables en la vivienda
vv<-eh18v %>% mutate(internet=s01a_31=="1. Si", vpropia=(s01a_02== unique(eh18v$s01a_02)[1])) %>% select(folio,internet,vpropia)
#miembros
mm<-eh18p %>% mutate(miembros=1) %>% group_by(folio) %>% summarise(miembros=sum(miembros))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```r
#base consolidada
jefe<-merge(jefe,mm)
jefe<-merge(jefe,vv)
head(jefe)
```

```
##                    folio  s02a_02 s02a_03    ylab      depto aestudio   area
## 1 111-00419704629-A-0011 1.Hombre      60 2256.00 Chuquisaca        2 Urbana
## 2 111-00419704629-A-0021 1.Hombre      36 2446.45 Chuquisaca        0 Urbana
## 3 111-00419704629-A-0041 1.Hombre      25 2598.00 Chuquisaca       12 Urbana
## 4 111-00419704629-A-0051 1.Hombre      47 2060.00 Chuquisaca        5 Urbana
## 5 111-00419704629-A-0071 1.Hombre      23 2060.00 Chuquisaca        8 Urbana
## 6 111-00419704629-A-0081 1.Hombre      49 2500.00 Chuquisaca        4 Urbana
##         p0 miembros internet vpropia
## 1 No Pobre        2    FALSE    TRUE
## 2    Pobre        5    FALSE   FALSE
## 3 No Pobre        4    FALSE   FALSE
## 4    Pobre        3    FALSE    TRUE
## 5    Pobre        4    FALSE   FALSE
## 6 No Pobre        4    FALSE    TRUE
```

* (10 pts) Para la base alojada en R y la base alojada en Spark, genere lo siguiente: 


```r
rm(eh18p,eh18v,mm,vv)
library(sparklyr)
sc<-spark_connect(master="local")
sp_jefe<-copy_to(sc,jefe,"eh18")
# Promedio de años de educación del jefe del hogar por departamento y Área 
#R
jefe %>% group_by(depto,area) %>% summarise(mean(aestudio,na.rm=T))
```

```
## `summarise()` regrouping output by 'depto' (override with `.groups` argument)
```

```
## # A tibble: 18 x 3
## # Groups:   depto [9]
##    depto      area   `mean(aestudio, na.rm = T)`
##    <fct>      <fct>                        <dbl>
##  1 Chuquisaca Urbana                       10.5 
##  2 Chuquisaca Rural                         4.92
##  3 La Paz     Urbana                       10.8 
##  4 La Paz     Rural                         6.73
##  5 Cochabamba Urbana                       10.5 
##  6 Cochabamba Rural                         5.09
##  7 Oruro      Urbana                       10.9 
##  8 Oruro      Rural                         6.89
##  9 Potosí     Urbana                        9.36
## 10 Potosí     Rural                         5.29
## 11 Tarija     Urbana                       10.3 
## 12 Tarija     Rural                         5.74
## 13 Santa Cruz Urbana                       10.5 
## 14 Santa Cruz Rural                         6.76
## 15 Beni       Urbana                       10.5 
## 16 Beni       Rural                         7.93
## 17 Pando      Urbana                       11.7 
## 18 Pando      Rural                         8.09
```

```r
#Spark
sp_jefe %>% group_by(depto,area) %>% summarise(mean(aestudio))
```

```
## Warning: Missing values are always removed in SQL.
## Use `mean(x, na.rm = TRUE)` to silence this warning
## This warning is displayed only once per session.
```

```
## # Source: spark<?> [?? x 3]
## # Groups: depto
##    depto      area   `mean(aestudio)`
##    <chr>      <chr>             <dbl>
##  1 Chuquisaca Rural              4.92
##  2 La Paz     Rural              6.73
##  3 Oruro      Urbana            10.9 
##  4 Tarija     Urbana            10.3 
##  5 Santa Cruz Urbana            10.5 
##  6 Beni       Urbana            10.5 
##  7 Pando      Urbana            11.7 
##  8 Pando      Rural              8.09
##  9 La Paz     Urbana            10.8 
## 10 Potosí     Urbana             9.36
## # ... with more rows
```

```r
# Proporción de jefes del hogar con un ingreso laboral superior a 4000 Bs. Por Departamento y Sexo 
#R
jefe %>% mutate(pp=ylab>4000) %>% group_by(depto,s02a_02) %>% summarise(mean(pp,na.rm=T))
```

```
## `summarise()` regrouping output by 'depto' (override with `.groups` argument)
```

```
## # A tibble: 18 x 3
## # Groups:   depto [9]
##    depto      s02a_02  `mean(pp, na.rm = T)`
##    <fct>      <fct>                    <dbl>
##  1 Chuquisaca 1.Hombre                 0.214
##  2 Chuquisaca 2.Mujer                  0.222
##  3 La Paz     1.Hombre                 0.272
##  4 La Paz     2.Mujer                  0.153
##  5 Cochabamba 1.Hombre                 0.276
##  6 Cochabamba 2.Mujer                  0.173
##  7 Oruro      1.Hombre                 0.249
##  8 Oruro      2.Mujer                  0.203
##  9 Potosí     1.Hombre                 0.226
## 10 Potosí     2.Mujer                  0.125
## 11 Tarija     1.Hombre                 0.321
## 12 Tarija     2.Mujer                  0.175
## 13 Santa Cruz 1.Hombre                 0.315
## 14 Santa Cruz 2.Mujer                  0.206
## 15 Beni       1.Hombre                 0.267
## 16 Beni       2.Mujer                  0.204
## 17 Pando      1.Hombre                 0.286
## 18 Pando      2.Mujer                  0.25
```

```r
#Spark
sp_jefe %>% mutate(pp=ifelse(ylab>4000,1,0)) %>% group_by(depto,s02a_02) %>% summarise(mean(pp))
```

```
## # Source: spark<?> [?? x 3]
## # Groups: depto
##    depto      s02a_02  `mean(pp)`
##    <chr>      <chr>         <dbl>
##  1 Chuquisaca 2.Mujer       0.222
##  2 Potosí     2.Mujer       0.125
##  3 Tarija     2.Mujer       0.175
##  4 La Paz     1.Hombre      0.272
##  5 Cochabamba 1.Hombre      0.276
##  6 Oruro      2.Mujer       0.203
##  7 Tarija     1.Hombre      0.321
##  8 Beni       2.Mujer       0.204
##  9 Chuquisaca 1.Hombre      0.214
## 10 Oruro      1.Hombre      0.249
## # ... with more rows
```

```r
# Proporción de pobreza moderada en hogares con jefes de hogar de 30 años o menos por sexo 
jefe %>% mutate(p0=ifelse(p0=="Pobre",1,0)) %>% filter(s02a_03<=30) %>% group_by(s02a_02)%>% summarise(mean(p0))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 2
##   s02a_02  `mean(p0)`
##   <fct>         <dbl>
## 1 1.Hombre      0.248
## 2 2.Mujer       0.312
```

```r
sp_jefe %>% mutate(p0=ifelse(p0=="Pobre",1,0)) %>% filter(s02a_03<=30) %>% group_by(s02a_02)%>% summarise(mean(p0))
```

```
## # Source: spark<?> [?? x 2]
##   s02a_02  `mean(p0)`
##   <chr>         <dbl>
## 1 2.Mujer       0.312
## 2 1.Hombre      0.248
```

```r
# Promedio de miembros en el hogar por departamento, área y sexo del jefe del hogar
jefe %>% group_by(depto,area,s02a_02) %>% summarise(mean(miembros))
```

```
## `summarise()` regrouping output by 'depto', 'area' (override with `.groups` argument)
```

```
## # A tibble: 36 x 4
## # Groups:   depto, area [18]
##    depto      area   s02a_02  `mean(miembros)`
##    <fct>      <fct>  <fct>               <dbl>
##  1 Chuquisaca Urbana 1.Hombre             3.58
##  2 Chuquisaca Urbana 2.Mujer              2.64
##  3 Chuquisaca Rural  1.Hombre             3.92
##  4 Chuquisaca Rural  2.Mujer              2.65
##  5 La Paz     Urbana 1.Hombre             3.67
##  6 La Paz     Urbana 2.Mujer              2.88
##  7 La Paz     Rural  1.Hombre             3.26
##  8 La Paz     Rural  2.Mujer              2.52
##  9 Cochabamba Urbana 1.Hombre             3.60
## 10 Cochabamba Urbana 2.Mujer              2.89
## # ... with 26 more rows
```

```r
sp_jefe %>% group_by(depto,area,s02a_02) %>% summarise(mean(miembros))
```

```
## # Source: spark<?> [?? x 4]
## # Groups: depto, area
##    depto      area   s02a_02  `mean(miembros)`
##    <chr>      <chr>  <chr>               <dbl>
##  1 Chuquisaca Urbana 2.Mujer              2.64
##  2 La Paz     Urbana 1.Hombre             3.67
##  3 La Paz     Rural  1.Hombre             3.26
##  4 Cochabamba Urbana 2.Mujer              2.89
##  5 Cochabamba Urbana 1.Hombre             3.60
##  6 Potosí     Urbana 1.Hombre             3.85
##  7 Santa Cruz Rural  1.Hombre             3.39
##  8 Chuquisaca Rural  1.Hombre             3.92
##  9 La Paz     Urbana 2.Mujer              2.88
## 10 Cochabamba Rural  1.Hombre             3.41
## # ... with more rows
```

```r
# Gráfico sobre el acceso al internet por departamento (ggplot)
library(ggplot2)
ggplot(jefe,aes(internet))+geom_bar()+facet_wrap(~depto)
```

![](Parcial_2_sol_files/figure-latex/unnamed-chunk-5-1.pdf)<!-- --> 

```r
ggplot(sp_jefe,aes(internet))+geom_bar()+facet_wrap(~depto)
```

![](Parcial_2_sol_files/figure-latex/unnamed-chunk-5-2.pdf)<!-- --> 

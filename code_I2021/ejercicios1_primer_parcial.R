rm(list=ls())
#################
library(dplyr)
#################
load(url("https://github.com/AlvaroLimber/EST-383/raw/master/data/eh19.RData"))
#################
# 1. Usando la EH-2019, genere una tabla que diferencie según 
# el sexo del jefe del hogar (para la muestra):
# * Promedio de ingreso laboral
# * Promedio de edad
# * Proporción de hogares con miembros de 18 años o menos
# * Proporción de hogares con miembros de 65 años o más
# * Número de miembros del hogar

bd<-eh19p %>% rename(sexo=s02a_02,edad=s02a_03,relpar=s02a_05) %>% 
  filter(relpar=="1.JEFE O JEFA DEL HOGAR") %>% select(folio,sexo,edad,ylab,area)

aux<-eh19p %>% rename(edad=s02a_03) %>% 
  mutate(totper=1,m18=(edad<=18),m65=(edad>=65)) %>% 
  select(folio,totper,edad,m18,m65) %>% 
  group_by(folio) %>% summarise(totper=sum(totper),m18=mean(m18),m65=mean(m65))

bd<-merge(bd,aux)

bd %>% group_by(sexo) %>% summarise(prom_ylab=mean(ylab,na.rm=T),
 prom_edad=mean(edad),m18=mean(m18),m65=mean(m65),totper=mean(totper))

#mutate
eh19p %>% rename(sexo=s02a_02) %>% mutate(mujer=(sexo=="2.Mujer"),log_ylab=log(ylab)) %>% 
  select(folio,sexo,mujer,log_ylab)

# 2. Mismos indicadores del ejercicio anterior, diferenciando los resultados por área

bd %>% group_by(sexo,area) %>% summarise(prom_ylab=mean(ylab,na.rm=T),
                                    prom_edad=mean(edad),m18=mean(m18),m65=mean(m65),totper=mean(totper))

# 3. Mismos indicadores del ejercicio 1 usando el diseño muestral



4. Genere una figura con código de R básico que muestre la diferencia de ingresos laborales de las personas según su educación; Ninguna, primaria, secundaria y superior

5. Genere una figura usando ggplot del ejercicio anterior

6. Buscar una fuente de datos de los casos positvos a COVID-19 por municipio, descargar la fuente. Cargar en R y generar una tabla que presente los 10 municipios con más casos.

# 7. Realizar una función en R que dado un vector de números enteros devuelva:
  
#* Confirme si es un vector de números enteros
#* La suma de los pares
#* La suma de los primos
#* Coeficiente de variación
#* Desviación media
esprimo<-function(x){
  if(x!=1){
    r<-T
    for(i in 2:(x-1)){
      if(x%%i==0){
        r<-F
      }
    }
    if(x==2){
      r<-T  
    }
    return(r)
    } else {
      r<-F
      return(r)
  }
}
esprimo(1)

fx<-function(x){
  # Confirme si es un vector de números enteros
  if(is.integer(x)){
    print("ES ENTERO")
  } else {
    print("NO ES ENTERO")
    #break
  }
  #* La suma de los pares
  spar<-sum(x[x%%2==0])
  #* La suma de los primos
  sumpri<-0
  for(i in x){
    if(esprimo(i)==T){
      sumpri<-sumpri+i
    }
  }
  #* Coeficiente de variación
  cvx<-sd(x)/mean(x)
  #* Desviación media
  dm<-mean(abs(x-mean(x)))
  #################
  return(list(spar,sumpri,cvx,dm))
}
fx(c(1:10))



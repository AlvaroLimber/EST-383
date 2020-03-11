#######################################
# Clase: gráficos en R, ggplot
# Materia: Programación Estadística I
# Fecha: 9 de Marzo
#######################################
rm(list=ls())
#######################################
#install.packages("ggplot2")
#install.packages("dplyr")#atajos sql
#install.packages("maps")#mapas
#install.packages("ggvis")#gráficos 1 paso + q ggplot html
library(ggplot2)
library(dplyr)
library(maps)
library(ggvis)
library(readxl)
#######################################
urlfile<-url('https://raw.githubusercontent.com/AlvaroLimber/EST-383/master/data/oct20.RData')
load(urlfile)
names(computo)[18]<-"MAS"
#######################################
#The grammar of graphics is an answer to a question: what is a statistical graphic? 

#base graphics 1983
#grid 2000
#lattice 1993
#ggplot 2005
#ggvis 2014

## Datos, estetica y geometria (layers)

library(ggplot2)
data(mpg)
help(mpg)


ggplot(mpg,aes(x=displ,y = hwy))

ggplot(mpg,aes(displ,hwy))+geom_point()
ggplot(computo,aes(MAS,CC))+geom_point()

ggplot(mpg, aes(x = displ)) + 
  geom_histogram()

ggplot(computo,aes(MAS,CC))+geom_point()

ggplot(mpg, aes(displ, hwy)) +
  geom_line()

ggplot(mpg, aes(displ)) +
  geom_histogram()

#Color tamaño y forma
#color
ggplot(mpg, aes(displ, hwy,colour = class)) +
  geom_point()

ggplot(mpg, aes(displ, hwy,colour = manufacturer)) +
  geom_point()

ggplot(computo,aes(MAS,CC,colour=Departamento))+geom_point()
#tamaño
ggplot(mpg, aes(displ, hwy,size=cyl)) +
  geom_point()
#tamaño + color
ggplot(mpg, aes(displ, hwy,colour=class,size=cyl)) +
  geom_point()

#forma
ggplot(mpg, aes(displ, hwy,shape = drv)) +
  geom_point()
#color forma y tamaño
ggplot(mpg, aes(displ, hwy,colour=class,
        size=cyl,shape = drv)) +
  geom_point()

#la leyenda del color
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = "djkfnsjdfd"))
#cambiar el color de todos los puntos
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(colour = "darkred")
#geometrias multiples 
ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_wrap(~class)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  facet_wrap(~class+drv)

#geoms
geom_smooth() # ajuste y en x
geom_boxplot()
geom_histogram()
geom_freqpoly()
geom_bar()
geom_path()
geom_line()

#ajuste de un modelo
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
geom_smooth(method = "lm")

# cuanti vs cual

ggplot(mpg, aes(drv, hwy)) + 
  geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_point()
ggplot(mpg, aes(drv, hwy)) + geom_jitter()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_violin()
#una cuanti
ggplot(mpg, aes(hwy)) + geom_boxplot()
ggplot(mpg, aes(hwy)) + geom_histogram()
ggplot(mpg, aes(hwy)) + geom_freqpoly()
ggplot(mpg, aes(hwy)) + geom_density()

ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 2.5)

ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 1)

ggplot(mpg, aes(hwy)) + 
  geom_density()

ggplot(mpg, aes(displ, colour = drv)) + 
  geom_density()

ggplot(mpg, aes(displ, fill = drv)) + 
  geom_histogram(binwidth = 0.4) 

ggplot(mpg, aes(displ,fill=drv)) + 
  geom_histogram(binwidth = 0.5) + 
    facet_wrap(~drv, ncol = 1)
#cuali , cuanti discretas
ggplot(mpg, aes(manufacturer)) + 
  geom_bar()

#ELEMENTOS DEL GRAFICO 
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 0.2)

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) + 
  xlab("city driving (mpg)") + 
  ylab("highway driving (mpg)")

# Remove the axis labels with NULL
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) + 
  xlab(NULL) + 
  ylab(NULL)

g1<-ggplot(mpg, aes(drv, hwy)) +
  geom_violin(width = 0.25) + 
  xlim("r","4") + 
  ylim(10, 30)

ggsave("g1.png",g1)

ggsave("g1.pdf",g1)

#output
p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

# Save png to disk

ggsave("plot.png", p, width = 5, height = 5)

saveRDS(p, "plot.rds")
q <- readRDS("plot.rds")

# 
mapa <- map_data("world") %>% 
  select(lon = long, lat, group, id = subregion)

ggplot(mapa, aes(lon, lat)) + 
  geom_point(size = .25, show.legend = FALSE) +
  coord_quickmap()

ggplot(mapa, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_quickmap()

#temas
theme_bw()
theme_grey()
theme_linedraw()
theme_light()
theme_dark()
theme_minimal()
theme_classic()
theme_void()

ggplot(mpg,aes(x=displ,y = hwy))+
  geom_point()

#######################################
# Clase: gráficos en R, ggplot
# Materia: Programación Estadística I
# Fecha: 9 de Marzo
#######################################
rm(list=ls())
#######################################
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("maps")
#install.packages("ggvis")
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
mpg

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_area()

ggplot(computo,aes(MAS,CC))+geom_point()

ggplot(mpg, aes(displ, hwy)) +
  geom_line()

ggplot(mpg, aes(displ)) +
  geom_histogram()

#Color tamaño y forma
ggplot(mpg, aes(displ, hwy,colour = class)) +
  geom_point()

ggplot(mpg, aes(displ, hwy,shape = drv)) +
  geom_point()

ggplot(mpg, aes(displ, hwy,size = cyl)) +
  geom_point()

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(colour = "blue"))

ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue")

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
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

ggplot(mpg, aes(drv, hwy)) + 
  geom_point()

ggplot(mpg, aes(drv, hwy)) + geom_jitter()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_violin()

ggplot(mpg, aes(hwy)) + geom_histogram()
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
ggplot(mpg, aes(hwy)) + geom_freqpoly()
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 2.5)

ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 1)

ggplot(mpg, aes(hwy)) + 
  geom_density()

ggplot(mpg, aes(displ, colour = drv)) + 
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) + 
  geom_histogram(binwidth = 0.5) 

ggplot(mpg, aes(displ, fill = drv)) + 
  geom_histogram(binwidth = 0.5) + 
    facet_wrap(~drv, ncol = 1)

ggplot(mpg, aes(manufacturer)) + 
  geom_bar()

aa<-as.data.frame(table(mpg$class))
aa
ggplot(aa,aes(Var1,Freq))+ 
  geom_bar()

ggplot(aa,aes(Var1,Freq)) + geom_bar(stat = "identity")
ggplot(drugs, aes(drug, effect)) + geom_point()

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3)

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) + 
  xlab("city driving (mpg)") + 
  ylab("highway driving (mpg)")

# Remove the axis labels with NULL
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) + 
  xlab(NULL) + 
  ylab(NULL)

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25)

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25) + 
  xlim("f", "r") + 
  ylim(20, 30)
#> Warning: Removed 137 rows containing missing values (geom_point).

# For continuous scales, use NA to set only one limit
ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25, na.rm = TRUE) + 
  ylim(NA, 30)


#output
p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

# Save png to disk


ggsave("plot.png", p, width = 5, height = 5)

saveRDS(p, "plot.rds")
q <- readRDS("plot.rds")

ggplot(faithfuld, aes(eruptions, waiting)) + 
  geom_contour(aes(z = density, colour = ..level..))

mi_counties <- map_data("world") %>% 
  select(lon = long, lat, group, id = subregion)

ggplot(mi_counties, aes(lon, lat)) + 
  geom_point(size = .25, show.legend = FALSE) +
  coord_quickmap()

ggplot(mi_counties, aes(lon, lat, group = group)) +
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


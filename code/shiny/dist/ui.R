library(shiny)
shinyUI(fluidPage(
    titlePanel("Distribuciones Estadisticas"),
    sidebarLayout(
        sidebarPanel(
            numericInput("n","Cantidad de numeros aleatorios",value = 100),
            radioButtons("d","Seleccione la distribucion",c("Normal","Uniforme","Exponencial"))
        ),
        mainPanel(
            tabsetPanel(
            tabPanel("Histograma",plotOutput("dist")),
            tabPanel("Valores",tableOutput("tab1")),
            tabPanel("Resumen",verbatimTextOutput("sum"))
            )
        )
    )
))

library(shiny)

titulo<-"Histograma de datos"

ui <- fluidPage(
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
)
server <- function(input, output) {
    output$dist <- renderPlot({
        aux<-input$d
        if(aux=="Normal"){
            x<-rnorm(input$n)
        } else if(aux=="Uniforme"){
            x<-runif(input$n)
        } else if(aux=="Exponencial"){
            x<-rexp(input$n,5)
        }
        hist(x,main=titulo)
    })
    output$tab1<-renderTable({
        aux<-input$d
        if(aux=="Normal"){
            x<-rnorm(input$n)
        } else if(aux=="Uniforme"){
            x<-runif(input$n)
        } else if(aux=="Exponencial"){
            x<-rexp(input$n,5)
        }
        matrix(x,nrow = 5)
    })
    output$sum<-renderPrint({
        aux<-input$d
        if(aux=="Normal"){
            x<-rnorm(input$n)
        } else if(aux=="Uniforme"){
            x<-runif(input$n)
        } else if(aux=="Exponencial"){
            x<-rexp(input$n,5)
        }
        summary(x)
    })
}
shinyApp(ui = ui, server = server)
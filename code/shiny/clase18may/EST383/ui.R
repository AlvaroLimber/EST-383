library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("b0",
                        "media:",
                        min = 1,
                        max = 50,
                        value = 30),
            actionButton("b1",label="Boton de accion"),
            checkboxInput("b2","Boton de check simple"),
            checkboxGroupInput("b3","Boton de check multiple",
                               choices = c("urbano","rural","global")),
            numericInput("b4","SD",value = 10),
            radioButtons("b5","Departamento",choices = c("lp","cb","or")),
            selectInput("b6","Departamento",choices = c("lp","cb","or")),
            textInput("b7","Titulo de la figura",value=""),
            fileInput("b8","Cargue su foto")
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
    
library(shiny)
shinyServer(function(input, output) {
    output$dist <- renderPlot({
        aux<-input$d
        if(aux=="Normal"){
            x<-rnorm(input$n)
        } else if(aux=="Uniforme"){
            x<-runif(input$n)
        } else if(aux=="Exponencial"){
            x<-rexp(input$n,5)
        }
        hist(x)
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
})

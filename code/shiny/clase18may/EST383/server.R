library(shiny)
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        x<-rnorm(1000,mean=input$b0,sd=input$b4)
        hist(x,ann=F,axes=F)
        title(main=input$b7)
        if(input$b2==T){
        axis(1)
        }
        if(input$b1==T){
            axis(2)
        }
        
        if(input$b4=="normal"){
            
        } else if(input$b4=="uniforme"){
            
        } else if(input$b4=="exponencial"){
            
        }
        
    })
})

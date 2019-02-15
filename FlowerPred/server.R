#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
data(iris)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  modFit = train(Species~Petal.Width+Sepal.Width,data=iris,method="rpart")
   # generate plot
    output$plot1 = renderPlot({
      plot(iris$Petal.Width, iris$Sepal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="basis iris data for flower species predition")
    })
    output$predflo = renderText({
      petw = input$petwid
      sepw = input$sepwid
      pr = predict(modFit, newdata = data.frame(Petal.Width = c(petw),Sepal.Width=c(sepw)))
      as.character(pr)
    })
    
    # draw the histogram with the specified number of bins
})

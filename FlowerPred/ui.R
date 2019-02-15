#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Flower"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("provide speal and petal width and this will predict the flower species"),
       sliderInput("sepwid",
                   "sepal width:",
                   min = 2.5,
                   max = 4,
                   value = 3),
       sliderInput("petwid",
                   "petal width:",
                   min = 0,
                   max = 2.5,
                   value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("predicted flower type: "),
       textOutput("predflo")
    )
  )
))

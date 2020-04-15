# server.R
# By: Tyler Fulghum

source("helpers.R") 
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      test1 <- switch(input$var,
                     "Percent White" = list(counties$white, "darkgreen", "% White"),
                     "Percent Black" = list(counties$black, "darkgreen", "% Black"),
                     "Percent Hispanic" = list(counties$hispanic, "darkgreen", "% Hispanic"),
                     "Percent Asian" = list(counties$asian, "darkgreen", "% Asian"))
      
      test1$min <- input$range[1]
      test1$max <- input$range[2]
      
      do.call(percent_map, test1)
      
    })
  }
)

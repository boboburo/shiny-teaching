library(ggplot2)
library(shiny)
library(DT)
library(dplyr)

ui <- fluidPage(
  
  h2("Diamonds Explorer"),
  plotOutput('plot1',  brush = brushOpts(id = "diamond_brush")),
  hr(),
  
  fluidRow(
    column(6,
           h4("Linked Boxplot"),
           plotOutput("plot2")),
    column(6,
           h4("Linked DT"),
           dataTableOutput("table1"))
  )
)

server <- function(input, output) {
  
  #Get the data
  data <- reactive({diamonds})
  #Get brushed points, control if nothing selected
  brushed_data <- reactive({
    selected <- brushedPoints(data(),input$diamond_brush)
    if(nrow(selected)==0){
      return(data())
    }
    else{
      return(selected)
    }
  })
  
  output$plot1 <-renderPlot({
    ggplot(data(),aes(price,carat,colour = as.factor(color))) + 
      geom_point() + 
      theme_bw() +
      theme(legend.position="bottom", legend.box = "horizontal") +
      labs(title ="Scatterplot of diamonds data",
           colour="Diamond Color")
  })
  
  output$plot2 <- renderPlot({
    ggplot(brushed_data(), aes(x=color, y = price)) +
      geom_boxplot()
  })
  
  output$table1 <- renderDataTable({
    brushed_data() %>% select(color,price,carat)
  })
}

shinyApp(ui = ui, server = server ,options = list(launch.browser =T))

### linking back in, possible but can be complicated ####
#s = input$table1_rows_selected

#if(length(s)){
#  ggplot(data(),aes(price,carat,colour = as.factor(color))) + 
#    geom_point() + 
#    geom_point(data=brushed_data()[s,],aes(price,carat),color="red",shape=4,size=5,stroke=3) +
#    theme_bw() +
#    theme(legend.position="bottom", legend.box = "horizontal") +
#    labs(title ="Scatterplot of diamonds data",
#         colour="Diamond Color")
#}




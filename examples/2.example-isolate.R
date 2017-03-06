#Source: http://shiny.rstudio.com/gallery/isolate-demo.html
ui <- fluidPage(
  titlePanel("isolate example"),
  fluidRow(
    column(4, wellPanel(
      textInput("A", "Input A (not isolated):", "Brian"),
      sliderInput("B", "InputB (isolated):", min = 1, max = 10, value = 5, step = 2),
      actionButton("goButton", "Add Input B")
    )),
    column(8,
           textOutput("summary")
              )
  )
)

server <- function(input, output) {
  output$summary <- renderText({
    input$goButton
    # Simply accessing input$goButton here makes this reactive
    # object take a dependency on it. That means when
    # input$goButton changes, this code will re-execute.
    
    # input$A is accessed here, so this reactive object will
    # take a dependency on it. However, input$B is inside of
    # isolate(), so this reactive object will NOT take a
    # dependency on it; changes to input$B will therefore not
    # trigger re-execution.
    paste0('Input A is ', input$A," and Input B is ", isolate(input$B))
  })
}

shinyApp(ui = ui, server = server ,options = list(launch.browser =T))

#Compare to the observeEvent where it was pressed once and the dependency was built
#The isolate breaks the dependency each time until the action button is pressed.
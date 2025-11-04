library(shiny)

ui <- fluidPage(
  titlePanel("My Data Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "Choose a variable:",
                  choices = names(mydata))
    ),
    mainPanel(
      plotOutput("histPlot")
    )
  )
)

server <- function(input, output) {
  data("mydata", package = "etc5523nhu")  # use your actual package name

  output$histPlot <- renderPlot({
    hist(mydata[[input$var]],
         main = paste("Histogram of", input$var),
         xlab = input$var)
  })
}

shinyApp(ui, server)

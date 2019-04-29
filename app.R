shinyApp(
  ui = fluidPage(
    shinythemes::themeSelector(),  # <--- Add this somewhere in the UI
    sidebarPanel(
      textInput("caption", "Caption", "Data Summary")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Tab 1", htmlOutput("value")),
        tabPanel("Tab 2")
      )
    )
  ),
  server = function(input, output) {
    output$value <- renderText({ paste("hello input is", '<span style="background-color: #e6ffe6">', input$caption, '</span>') })
  }
)
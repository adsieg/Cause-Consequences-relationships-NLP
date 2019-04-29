require(shiny)
require(visNetwork)
library("readxl")

fluidPage(
  titlePanel("Automatic Extraction of Causal-Consequences Relations"),
  fluidRow(
    column(3, wellPanel(
      # Id of News
      
      # Text Input
      selectInput("training_sentences", "See sentences in training Corpus:", paste0('sentence_id_', 0:737)),
      
      # Text Input
      textInput("caption", "Test with your sentence:", "Type your own sentence here"),
      submitButton("Submit")
    )),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Training Part", 
                 br(),
                 br(),
                 column(8, wellPanel(htmlOutput("value"))),
                 br(),
                 br(),
                 visNetworkOutput("network"),
                 code("Why are there multiple colors?"),
                 br(),
                 br(),
                 p("-", span("ADJ", style = "color:blue"), "means", span("ADJECTIVE", style = "color:green"), "such as new, good, high, special, big, local,..."),
                 p("-", span("ADP", style = "color:blue"), "means", span("ADPOSITION", style = "color:green"), "such ason, of, at, with, by, into, under,..."),
                 p("-", span("CONJ", style = "color:blue"), "means", span("CONJUNCTION", style = "color:green"), "such as and, or, but, if, while, although,..."),
                 p("-", span("DET", style = "color:blue"), "means", span("DETERMINER", style = "color:green"), "such as the, a, some, most, every, no, which,..."),
                 p("-", span("NOUN", style = "color:blue"), "means", span("NOUN", style = "color:green"), "such as year, home, costs, time, Africa,..."),
                 p("-", span("VERB", style = "color:blue"), "means", span("VERBE", style = "color:green"), "such as is, say, told, given, playing, would,...")
          ),
        tabPanel("Testing Part")
      )
    )
  )
)
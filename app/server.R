require(shiny)
require(visNetwork)
library("readxl")
library(dplyr)

function(input, output) {
  
  data_nodes <- reactive({
    nodes <- read_excel("nodes.xlsx")
    nodes %>% 
      filter(which_sentence == input$training_sentences) %>% 
      distinct(id, .keep_all = TRUE)
  })
  
  data_edges <- reactive({
    edges <- read_excel("edges.xlsx")
    edges %>% 
      select('from', 'to', 'which_sentence') %>%
      filter(which_sentence == input$training_sentences)
  })
  
  data_sentences <- reactive({
    sentences <-c()
    for(item in 1:nrow(data_nodes())){
      if (data_nodes()$qualif[item]=="neutral") {
        sentences <- c(sentences, data_nodes()$id[item])
      } else {
        sentences <- c(sentences, paste('<span style="background-color: #ff6666">',data_nodes()$id[item], '</span>'))
      }
    }
    paste(sentences, collapse=" ")
  })
  
  
  output$value <- renderText({data_sentences()})
  
  output$network <- renderVisNetwork({
    
    visNetwork(data_nodes(), data_edges(), height = "800px", width = "100%") %>% 
      visEdges(arrows = "to")%>% 
      visOptions(selectedBy = "group", highlightNearest = TRUE)
  })
}
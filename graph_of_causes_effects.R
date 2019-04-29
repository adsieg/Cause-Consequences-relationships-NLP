# Loading
library("readxl")
setwd("C:/Users/adsieg/Desktop/Cause_Effect/app/dataset")
# xls files
edges <- read_excel("word.xlsx")
edges<- edges[,c("from","to")]

nodes <- read_excel("nature.xlsx")

library(dplyr)
nodes %>% 
  select('id', 'group', 'which_sentence') %>%
  filter(which_sentence == "sentence_id_0")

library(visNetwork)

# default, on group
visNetwork(nodes, edges, main = "Cause-Effect", height = "500px", width = "100%") %>% 
  visEdges(arrows = "to")%>% 
  visOptions(highlightNearest = TRUE)


nodes <- nodes %>% 
  select('id', 'group', 'which_sentence') %>%
  filter(which_sentence == "sentence_id_0")

sentences <-c()
for(item in 1:nrow(nodes)){
  if (nodes$group[item]=="neutral") {
    print(nodes$id[item])
    sentences <- c(sentences, nodes$id[item])
  } else {
    print(paste('<span style="background-color: #e6ffe6"> ',nodes$id[item], ' </span>'))
    sentences <- c(sentences, paste('<span style="background-color: #e6ffe6"> ',nodes$id[item], ' </span>'))
  }
}

paste(sentences, collapse=" ")

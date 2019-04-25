# Loading
library("readxl")
setwd("C:/Users/adsieg/Desktop/Cause_Effect")
# xls files
edges <- read_excel("word.xlsx")
edges<- edges[,c("from","to")]

nodes <- read_excel("nature.xlsx")
nodes <- nodes[,c("id","group")]

library(visNetwork)

# default, on group
visNetwork(nodes, edges, main = "Cause-Effect", width = "100%") %>% 
  visOptions(highlightNearest = TRUE)

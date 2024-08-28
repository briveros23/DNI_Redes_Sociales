# crear crear grafos bases de datos samuel(twitter)
library(dplyr)
library(ggplot2)
library(igraph)

rm(list = ls())
setwd("C:/Users/bcriv/OneDrive/Escritorio/DNI redes sociales/DNI_redes_sociales/notebook")


# Read Data ----
df_nodes <- read.csv("../input/nodes.csv")

df_edges_work <- read.csv("../input/alliance-edges.csv")
df_edges_alliance <- read.csv("../input/work-edges.csv")

# creacion de los grafos 
G_work <- graph_from_data_frame(select(df_edges_work,Source,Target),directed = T) 
G_alliance <- graph_from_data_frame(select(df_edges_aliance,Source,Target),directed = T)

save(G_work,df_edges_work,file = "../input/out_work_network.RData")
save(G_alliance,df_edges_aliance,file = "../input/out_alliance_network.RData")


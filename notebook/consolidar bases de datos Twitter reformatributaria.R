# crear crear grafos bases de datos samuel(twitter)
library(dplyr)
library(ggplot2)
library(igraph)

rm(list = ls())
setwd("C:/Users/bcriv/OneDrive/Escritorio/DNI redes sociales/DNI_redes_sociales/notebook")


# Read Data ----
df_raw <- read.csv("../input/reforma_tributaria_04_11_2022_5pm_mixed_spanish.csv")

df_raw %>% tibble %>% filter(tweet_type == "retweet") %>% 
  select(from_user_id,to_user_id,
         from_user_screen_name,to_user_screen_name,
         from_user_botscore,to_user_botscore) -> df

G <- graph_from_data_frame(select(df,from_user_id,to_user_id),directed = T)

G <- simplify(G)
summary(G)
save(G,df,file = "../input/out_refTrib.RData")
V(G)

load("../input/out_refTrib.RData")

library(rvest)
library(janitor)
library(tidyverse)

all_tables <- "https://en.wikipedia.org/wiki/List_of_members_of_the_Baseball_Hall_of_Fame" |> 
  read_html() |> 
  html_elements("table") |> 
  html_table()

x <- all_tables[[3]] |> 
  clean_names() |> 
  mutate(year = ifelse(year == 19425, 1942, year)) |> 
  mutate(year = ifelse(year == 19445, 1944, year)) |> 
  mutate(year = ifelse(year == 20206, 2020, year)) 

write_rds(x, file = "data.rds")


library(tidyverse)
library(readxl)
library(rvest)
url = 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
page <- read_html(url)
temp <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=TRUE, fill=TRUE)
World_Cup <- temp %>%
  select(1, 2, 5, 4, 6) %>%
  magrittr::set_colnames( c('Year', 'Hosts', 'Matches',
                            'Totalattendance', 'Averageattendance' ) ) %>%
  slice(-1, -24, -25, -26, -27) %>%
  mutate( Totalattendance = as.numeric(str_remove_all(Totalattendance, pattern=",")),
          Averageattendance = as.numeric(str_remove_all(Averageattendance, pattern=",")),
          Matches = as.numeric(Matches))
World_Cup<- World_Cup %>%
  mutate(WorldCup = paste(Hosts, Year)) %>%
  select(6, 3, 4, 5) %>%
  mutate(WorldCup = str_remove_all(WorldCup, pattern=" "))
usethis::use_data(World_Cup, overwrite = TRUE)

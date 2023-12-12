library(tidyverse)
library(readxl)
temp <- read_excel("data-raw/World_Population.xlsx", sheet=1, range = "A17:BZ306")
WorldPopulation <- temp %>%
  mutate( CountryYes = str_detect( Type, pattern='Country' ) ) %>%
  relocate(CountryYes, .before = Type) %>%
  filter(CountryYes) %>%
  select(3, 9:79) %>%
  mutate_at(-1, as.numeric)
colnames(WorldPopulation)[1] <- 'Country'
usethis::use_data(WorldPopulation, overwrite = TRUE)



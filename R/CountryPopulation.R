#' Country Population
#'
#' Produces a line graph of the population growth from 1950 to 2020 of a
#' user specified country.
#'
#' @param country  The country of interest as a character string.
#' @return A line graph of the population with respect to time.
#' @export
CountryPopulation <- function(country){
  library(tidyverse)
  if(sum(WorldPopulation$Country==as.character(country))==0){
    stop("That is not a country in the dataset DumDum")
  }else{
  NickCage <- WorldPopulation %>%
    filter(Country == as.character(country)) %>%
    pivot_longer(
      '1950':'2020',             # which columns to apply this to
      names_to  = 'Year',   # What should I call the column of old column names
      values_to = 'Population') %>%
    select(2,3)

  g1 <- ggplot(data=NickCage, aes(x=as.numeric(Year), y=Population)) +
    geom_line(linewidth=1) +
    scale_x_continuous( breaks=seq(1950,2020, by=10)) +
    labs(x="Year", y="Population in Thousands",
         title = paste("Population VS Year in " ,country)) +
    theme(plot.title=element_text(size=12))}


  return(g1)}

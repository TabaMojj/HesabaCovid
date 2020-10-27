#' @title getData
#'
#' @description Get COVID-19 data from John Hopkins University
#'
#' @return Dataset containing daily data
#'
#' @export
#'
#' @import dplyr
#' @import readr
#' @import ggplot2
#' @import rworldmap
#' @import tidyr
#' @examples
#' df <- getData()

getData <- function(){

  confirmdURL <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

  read_csv(confirmdURL, col_types = cols()) %>%
    select(-'Province/State', -'Lat', -'Long') %>%
    rename("Country" = 'Country/Region')%>%
    mutate(Country = as.factor(Country)) -> confirmedDF

  confirmedDF %>%
    gather(key = 'Date', value = 'C', 2:ncol(confirmedDF)) %>%
    group_by(Country, Date) %>%
    summarise(Confirmed = sum(C)) -> confirmedDF

  deathsURL <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

  read_csv(deathsURL, col_types = cols()) %>%
    select(-'Province/State', -'Lat', -'Long') %>%
    rename("Country" = 'Country/Region')%>%
    mutate(Country = as.factor(Country)) -> deathsDF

  deathsDF %>%
    gather(key = 'Date', value = 'D', 2:ncol(deathsDF)) %>%
    group_by(Country, Date) %>%
    summarise(Deaths = sum(D)) -> deathsDF


  recoveredURL <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

  read_csv(recoveredURL, col_types = cols()) %>%
    select(-'Province/State', -'Lat', -'Long') %>%
    rename("Country" = 'Country/Region')%>%
    mutate(Country = as.factor(Country)) -> recoveredDF

  recoveredDF %>%
    gather(key = 'Date', value = 'R', 2:ncol(recoveredDF)) %>%
    group_by(Country, Date) %>%
    summarise(Recovered = sum(R)) -> recoveredDF

  left_join(confirmedDF, deathsDF, by = c("Country", "Date")) %>%
    left_join(recoveredDF, by = c("Country", "Date"))%>%
    mutate(Date = as.POSIXct(Date, format = "%m/%d/%y")) %>%
    arrange(Country, desc(Date)) %>%
    rename("CumulativeDeath" = Deaths,
           "CumulativeConfirmed" = Confirmed,
           "CumulativeRecovered" = Recovered) %>%
    mutate(Deaths =  abs(lead(CumulativeDeath) - CumulativeDeath),
           Recovered =  abs(lead(CumulativeRecovered) - CumulativeRecovered),
           Confirmed =  abs(lead(CumulativeConfirmed) - CumulativeConfirmed))%>%
    select(Country, Date, Confirmed, Deaths, Recovered, CumulativeConfirmed, CumulativeDeath, CumulativeRecovered) %>%
    filter(!is.na(Date) & Date != "2020-01-22") -> corona

  return(corona)
}

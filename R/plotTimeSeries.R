#' @title plotTimeSeries
#'
#' @description Plot death and confirmed rates for a country between two dates
#' @description Dates must be in "YYYY-MM-DD" format
#'
#' @param country Country Name e.g. "Iran"
#' @param dateFrom Starting date e.g. "2020-05-11"
#' @param dateTo Ending Date e.g. "2020-08-05"
#'
#' @return Times series plot
#'
#' @examples plotTimeSeries("Iran", "2020-05-11", "2020-08-05")
#'
#' @export
#' @import dplyr
#' @import readr
#' @import tidyr
#' @import ggplot2
#' @import rworldmap

plotTimeSeries <- function(country, dateFrom, dateTo){

  HesabaCovid::getData() %>%
    filter(Country == country)%>%
    subset(Date >= dateFrom & Date <= dateTo) -> df

  ggplot(df, aes(x=Date)) +
    geom_line(color = c("#666666"), aes(y = Deaths), size = 1.2) +
    geom_line(color = c("#ab0303"), aes(y = Confirmed), size = 1.2) +
    ylab(" ") +
    ggtitle(paste(country,"Rates From",dateFrom,"To", dateTo))+
    theme_minimal(base_line_size = 0.1)

}

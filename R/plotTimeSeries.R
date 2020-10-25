plotTimeSeries <- function(country, dateFrom, dateTo){

  HesabaCovid::getData() %>%
    filter(Country == country)%>%
    subset(Date >= dateFrom & Date <= dateTo) -> df

  ggplot(df, aes(x=Date)) +
    geom_line(color = c("#666666"), aes(y = Deaths), size = 1.2) +
    geom_line(color = c("#ab0303"), aes(y = Confiremed), size = 1.2) +
    ylab(" ") +
    ggtitle(paste(country,"Rates From",dateFrom,"To", dateTo))+
    theme_minimal(base_line_size = 0.1)

}

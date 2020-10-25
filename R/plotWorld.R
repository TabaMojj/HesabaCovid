plotWorld <- function(plotType, date){

  HesabaCovid::getData() %>%
    select(Country, Date, plotType)%>%
    filter(Date == date)  -> df

  invisible(capture.output(cm <-  joinCountryData2Map(dF = df, nameJoinColumn = 'Country', joinCode = "NAME")))

  if(plotType == "Deaths"){
    mapCountryData(
      cm,
      nameColumnToPlot = plotType,
      oceanCol = "lightblue",
      missingCountryCol='white',
      addLegend = FALSE,
      mapTitle = paste(plotType, "in", date),
      catMethod = "categorical",
      colourPalette = "white2Black"
    )
  }

  if(plotType == "Confiremed"){
    mapCountryData(
      cm,
      nameColumnToPlot = plotType,
      oceanCol = "lightblue",
      missingCountryCol='white',
      addLegend = FALSE,
      mapTitle = paste(plotType, "in", date),
      catMethod = "categorical"
    )
  }
}

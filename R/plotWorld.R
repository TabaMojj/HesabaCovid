#' @title plotWorld
#'
#' @description Plot daily cases in world map.
#'
#' @param plotType Type of plot: "Deaths" or "Confiremed"
#' @param date e.g "2020-05-11"
#'
#' @return World map plot
#'
#' @examples plotWorld("Confiremed", "2020-05-11")
#'
#' @import rworldmap

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

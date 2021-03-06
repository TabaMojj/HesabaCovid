#' @title plotWorld
#'
#' @description Plot daily cases in world map.
#' @description Plot type can be "Deaths" or "Confirmed".
#' @description Date must be in "YYYY-MM-DD" format.
#'
#' @param plotType Type of plot: "Deaths" or "Confirmed"
#' @param date e.g "2020-05-11"
#'
#' @return World map plot
#'
#' @examples plotWorld("Confirmed", "2020-05-11")
#'
#' @export
#' @import dplyr
#' @import readr
#' @import tidyr
#' @import ggplot2
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

  if(plotType == "Confirmed"){
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

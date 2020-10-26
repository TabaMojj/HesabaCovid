{r, include = FALSE} knitr::opts\_chunk$set( collapse = TRUE, comment =
“\#\>”, fig.path = “man/figures/README-”, out.width = “100%” )

# HesabaCovid

This package is part of Hesaba Internship tasks.

This package have three functions:

getData():

You can get up-to-date COVID-19 data from Johns Hopkins University
Center for Systems Science and Engineering (JHU CSSE). This dataset
contains Country, Date, Deaths, Confiremed, Recovered and Cumulative
data.

plotWorld(plotType, date):

Given a plot type and a date, this function can plot datas on world map.
Plot type can be “Deaths” or “Confiremed”. Date must be in “YYYY-MM-DD”
format.

plotTimeSeries(country, dateFrom, dateTo):

This function can plot time series for a country between two dates. Date
must be in “YYYY-MM-DD” format.

## Installation

You can install the released version of HesabaCovid from
[github](https://github.com/TabaMojj/HesabaCovid) with:

r \# install.packages(“devtools”)
devtools::install_github("TabaMojj/HesabaCovid", build_vignettes = TRUE)

## Example

{r example} library(HesabaCovid)

df \<- getData()

plotWorld(“Deaths”, “2020-05-11”)

plotTimeSeries(“Iran”, “2020-05-11”, “2020-08-05”)

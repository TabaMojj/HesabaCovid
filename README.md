
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HesabaCovid <img src="https://github.com/TabaMojj/HesabaCovid/blob/master/HesabaCovid.png" height="200" align = "right">

<!-- badges: start -->

[![](https://img.shields.io/badge/devel%20version-1.01-red.svg)](https://github.com/https://github.com/TabaMojj/HesabaCovid)
[![](https://img.shields.io/badge/lifecycle-maturing-green.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)
<!-- badges: end -->

HesabaCovid is part of Hesaba Internship tasks. You can get up-to-date
COVID-19 data, plot time series and world map.

## Installation

You can install the released version of HesabaCovid from
[github](https://github.com/TabaMojj/HesabaCovid) with:

``` r
install.packages(“devtools”)
devtools::install_github("TabaMojj/HesabaCovid", build_vignettes = TRUE)
```

## Example

You can get up-to-date COVID-19 data from Johns Hopkins University
Center for Systems Science and Engineering (JHU CSSE). This dataset
contains Country, Date, Deaths, Confiremed, Recovered and Cumulative
data.

``` r
library(HesabaCovid)
df <- getData()
head(df)
#> # A tibble: 6 x 8
#> # Groups:   Country [1]
#>   Country Date                Confirmed Deaths Recovered CumulativeConfi~
#>   <fct>   <dttm>                  <dbl>  <dbl>     <dbl>            <dbl>
#> 1 Afghan~ 2020-10-29 00:00:00       123      3         2            41268
#> 2 Afghan~ 2020-10-28 00:00:00       113      6        20            41145
#> 3 Afghan~ 2020-10-27 00:00:00        95      5        67            41032
#> 4 Afghan~ 2020-10-26 00:00:00       104      4        21            40937
#> 5 Afghan~ 2020-10-25 00:00:00        65      3       106            40833
#> 6 Afghan~ 2020-10-24 00:00:00        81      4        13            40768
#> # ... with 2 more variables: CumulativeDeath <dbl>, CumulativeRecovered <dbl>
```

Given a plot type and a date, this function can plot datas on world map.
Plot type can be “Deaths” or “Confiremed”. Date must be in “YYYY-MM-DD”
format.

``` r
plotWorld("Deaths", "2020-10-29")
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

You can plot time series for a country between two dates. Date must be
in “YYYY-MM-DD” format.

``` r
plotTimeSeries("Iran", "2020-5-10", "2020-10-29")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

## More

You can use `utils::vignette("HesabaCovid")` to see examples.

Also, you can visit [HesabaCovid
website](https://tabamojj.github.io/HesabaCovid/) for more information.

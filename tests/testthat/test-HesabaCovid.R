test_that("getData returns a dataframe and the first row (today's data) is not null", {

  TESTDF <- getData()
  testthat::expect_true(is.data.frame(TESTDF))
  testthat::expect_false(is.null(TESTDF[1,]))

})

test_that("plotWorld's value is list and is not null", {


  TESTWORLDPLOT <- plotWorld("Confirmed", "2020-06-19")
  testthat::expect_true(is.list(TESTWORLDPLOT))
  testthat::expect_false(is.null(TESTWORLDPLOT))

})

test_that("plotTimeSeries's value is not null and is ggplot",{

  TESTTIMESERIES_I <- plotTimeSeries("Iran", "2020-05-20", "2020-10-05")
  testthat::expect_false(is.null(TESTTIMESERIES_I))
  testthat::expect_true(is.ggplot(TESTTIMESERIES_I))

  TESTTIMESERIES_U <- plotTimeSeries("US", "2020-05-20", "2020-10-05")
  testthat::expect_false(is.null(TESTTIMESERIES_U))
  testthat::expect_true(is.ggplot(TESTTIMESERIES_U))


})

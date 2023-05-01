library(testthat)
library(politicxsentwitteR)


source("C:/Users/User/Documents/GitHub/politicxsentwitteR/R/get_timeline_data.R")

test_that("Check commutative property", {
  expect_identical(sum(get_timeline_data(screen.name = "alferdez")["favorite_count"], na.rm = TRUE), 26748285)
})

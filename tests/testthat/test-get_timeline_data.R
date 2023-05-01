test_that("Favourite count 'alferdez'", {
  expect_equal(sum(get_timeline_data("alferdez")["favorite_count"],na.rm = TRUE), 26748285)
})





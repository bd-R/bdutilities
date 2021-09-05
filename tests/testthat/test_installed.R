context("Installed")

test_that("bdutilities", {
  expect_equal(length(summarizeDataframe(airquality)), 6)
})
context("Installed")

test_that("bdutilities", {
  expect_true("bdutilities" %in% installed.packages())
})
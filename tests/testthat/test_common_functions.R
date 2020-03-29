library(testthat)

test_that("test NA in summarize_dataframe", {
    expect_true(is.na(summarize_dataframe(NA)))
})

test_that("test NA in return_core", {
    expect_true(is.na(return_core(NA)))
})

test_that("test NA in flatten_data", {
    expect_true(is.na(flatten_data(NA)))
})

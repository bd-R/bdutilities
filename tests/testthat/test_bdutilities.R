library(testthat)

# Test summarize_dataframe function
context("data_checks")
test_that("summarize_dataframe", {
    # No arguments provided
    expect_error(summarize_dataframe())
})

a <- c(1, 2, 3, 4)
b <- c(5, 6, 7, 8)
df1 <- data.frame(a, b)
l1 <- list("a", "b", c(1, 2, 3), "TRUE")
l2 <- list("c", "d", c(4, 5, 6), "FALSE")
l3 <- rbind(l1, l2)
df2 <- data.frame(l3)
s <- "bdu"

# Test summarize_dataframe function
context("data_checks")
test_that("flatten_data", {
    # No arguments provided
    expect_error(flatten_data())
    # dataframe with no list
    expect_identical(flatten_data(df1), df1)
    # dataframe with list
    expect_error(expect_equal(flatten_data(df2), df2))
    # input not a dataframe
    expect_error(expect_equal(flatten_data(s), s))
    expect_error(expect_equal(flatten_data(a), a))
    expect_error(expect_equal(flatten_data(l1), l1))
})

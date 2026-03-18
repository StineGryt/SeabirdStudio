test_that("relative abundance sums to 1", {

  data <- seabird_counts
  col <- data$colony[1]

  result <- relative_abundance(data, col)

  expect_true(is.data.frame(result))
  expect_true(abs(sum(result$prop) - 1) < 1e-6)
})

test_that("species richness works", {
  data <- seabird_counts

  r <- species_richness(data, data$colony[1])

  expect_true(is.numeric(r))
  expect_true(r > 0)

})

test_that("similarity is 1 for identical colonies", {

  sim <- colony_similarity(seabird_counts, "Foula", "Foula")

  expect_equal(sim, 1)

})


test_that("similarity is symmetric", {

  sim1 <- colony_similarity(seabird_counts, "Foula", "Fair Isle")
  sim2 <- colony_similarity(seabird_counts, "Fair Isle", "Foula")

  expect_equal(sim1, sim2)
})


test_that("similarity is between 0 and 1", {
  sim <- colony_similarity(seabird_counts, "Foula", "Fair Isle")

  expect_true(sim >= 0 && sim <= 1)

})

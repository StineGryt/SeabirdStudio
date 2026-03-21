test_that("similarity behaves correctly", {

  sim_same <- colony_similarity(seabird_counts, "Foula", "Foula")
  expect_equal(sim_same, 1)

  sim_diff <- colony_similarity(seabird_counts, "Foula", "Fair Isle")
  expect_true(sim_diff >= 0 && sim_diff <= 1)

})

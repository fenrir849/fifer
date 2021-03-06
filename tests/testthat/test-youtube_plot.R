require(testthat)
test_that("youtube_plot works", {
  p = flexplot(weight.loss~1, data=exercise_data)
  youtube_plot(p)
  youtube_plot(p, name="delete", path="inst")
  files = list.files()
  expect_true(sum(files %in% "plot.jpg")==1)
  expect_true(file.remove("plot.jpg"))
  files = list.files("inst")
  expect_true(sum(files %in% "delete.jpg")==1)  
  expect_true(file.remove("inst/delete.jpg"))
})

# Check to see if I get the correct error messages.
test_that('Checking for errors', {
  expect_error(CountryPopulation("USA"))
})

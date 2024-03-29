context("Return accuracy")


test_that("Returns list", {
  expect_true(is.list(full_request(data_item = "B1720", api_key = "test", settlement_date = "12 Jun 2018", period = "1", service_type = "xml")))
  expect_warning(expect_true(is.list(full_request(data_item = "MessageListRetrieval", api_key = "test", event_start = "12 Jun 2018", service_type = "csv"))))
  expect_true(is.list(full_request(data_item = "MessageListRetrieval", api_key = "test", event_start = "12 Jun 2018", service_type = "xml")))
  expect_true(is.list(full_request(data_item = "TEMP", api_key = "test", from_date = "12 Jun 2018", service_type = "xml")))
})

test_that("Returns xml instead of csv because api key incorrect", {
  expect_warning(resp <- full_request(data_item = "TEMP", api_key = "test", from_date = "12 Jun 2018", service_type = "csv"))
  expect_true(class(resp) == "list")
})


test_that("Returns response()",{
  expect_true(is(full_request(data_item = "TEMP", api_key = "test", from_date = "10 Jun 2018", to_date = "11 Jun 2018", parse = FALSE)) == "response")
})


test_that("Example Request", {
request  <- build_b_call(data_item = "B1720",
                           api_version = "v1",
                           settlement_date = "13-10-2019",
                           period = "*",
                           api_key = "12345")

  expect_true(is.list(request))
  expect_true(length(request) == 3)
  expect_equal(request$url, "https://api.bmreports.com/BMRS/B1720/v1?APIKey=12345&SettlementDate=2019-10-13&Period=%2A&ServiceType=csv")
}
)

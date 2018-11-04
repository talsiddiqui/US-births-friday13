#' Access data from the Github repository of fivethirtyeight
data_raw <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/births/US_births_2000-2014_SSA.csv")

#' Wrangle data to the test need
data <- data_raw %>% 
  mutate(
    date = make_date(year = year, month = month, day = date_of_month),
    friday13 = if_else(day_of_week==5 & date_of_month == 13, TRUE, FALSE)
  ) %>% 
  select(-year, -month, -date_of_month, -day_of_week)

#' Output the formatted data
write.csv(data, file = "data/US_births_2000-2014_SSA_formatted.csv", row.names=FALSE)
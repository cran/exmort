## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", message = FALSE,
                     warning = FALSE, fig.width = 7.2, fig.height = 4.5)

## ----setup--------------------------------------------------------------------
library(exmort)
library(readxl)
library(dplyr)

## ----template-paths-----------------------------------------------------------
template_dir <- system.file("app", "XLSX", package = "exmort")
monthly_template <- file.path(template_dir, "Data_Entry_Template_monthly.xlsx")
weekly_template <- file.path(template_dir, "Data_Entry_Template_weekly.xlsx")
file.exists(c(monthly_template, weekly_template))
excel_sheets(monthly_template)

## ----copy-template, eval=FALSE------------------------------------------------
# workbook_copy <- file.path(tempdir(), "my-monthly-mortality.xlsx")
# file.copy(monthly_template, workbook_copy, overwrite = FALSE)

## ----monthly-header-----------------------------------------------------------
header_excerpt <- read_excel(
  monthly_template, sheet = "National level", col_names = FALSE, n_max = 5
)
header_excerpt[, seq_len(6)]

## ----example-events-----------------------------------------------------------
example_events <- read_excel(monthly_template, sheet = "events")
example_events

## ----event-calendar-----------------------------------------------------------
event_calendar <- tibble(
  event_name = c("Event A", "Event B"),
  start_date = as.Date(c("2020-03-01", "2021-07-01")),
  end_date = as.Date(c("2020-12-31", "2021-10-31"))
)
event_calendar

## ----processed-checks, eval=FALSE---------------------------------------------
# required_columns <- c("AREA", "AGE_GROUP", "SEX", "YEAR", "PERIOD", "NO_DEATHS")
# stopifnot(all(required_columns %in% names(mortality_data)))
# 
# duplicate_periods <- mortality_data |>
#   count(AREA, AGE_GROUP, SEX, YEAR, PERIOD, name = "n_rows") |>
#   filter(n_rows > 1)
# 
# invalid_counts <- mortality_data |>
#   filter(is.na(NO_DEATHS) | NO_DEATHS < 0)
# 
# coverage_summary <- mortality_data |>
#   summarise(
#     first_year = min(YEAR, na.rm = TRUE),
#     last_year = max(YEAR, na.rm = TRUE),
#     n_periods = n(),
#     n_missing = sum(is.na(NO_DEATHS)),
#     .by = c(AREA, AGE_GROUP, SEX)
#   )
# 
# duplicate_periods
# invalid_counts
# coverage_summary


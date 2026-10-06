## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", message = FALSE,
                     warning = FALSE, fig.width = 7.2, fig.height = 4.5)

## ----setup--------------------------------------------------------------------
library(exmort)
library(dplyr)
library(tidyr)
library(ggplot2)
library(DSIR)

## ----arithmetic-example-------------------------------------------------------
illustration <- tibble(
  month = as.Date(c("2020-01-01", "2020-02-01", "2020-03-01",
                    "2020-04-01", "2020-05-01", "2020-06-01")),
  observed_deaths = c(980, 1010, 1120, 1230, 1190, 1060),
  expected_deaths = c(1000, 1000, 1000, 1000, 1000, 1000)
)

illustration <- illustration |>
  mutate(
    excess_deaths = observed_deaths - expected_deaths,
    p_score = if_else(expected_deaths > 0,
                      100 * excess_deaths / expected_deaths, NA_real_)
  )
illustration

## ----arithmetic-plot, fig.alt="Synthetic monthly observed and expected deaths, showing observed deaths rising above a constant expected baseline."----
plot_data <- illustration |>
  select(month, observed_deaths, expected_deaths) |>
  pivot_longer(-month, names_to = "series", values_to = "deaths") |>
  mutate(series = recode(series,
                         observed_deaths = "Observed", expected_deaths = "Expected"))

ggplot(plot_data, aes(month, deaths, colour = series, linetype = series)) +
  geom_line(linewidth = 0.9) +
  geom_point(size = 2) +
  scale_colour_brewer(palette = "Dark2") +
  theme_dsi() +
  labs(title = "Observed deaths and a counterfactual baseline",
       subtitle = "Synthetic illustration; these are not country estimates",
       x = NULL, y = "Deaths", colour = NULL, linetype = NULL)

## ----cumulative-summary-------------------------------------------------------
cumulative_summary <- illustration |>
  summarise(
    total_observed = sum(observed_deaths),
    total_expected = sum(expected_deaths)
  ) |>
  mutate(
    total_excess = total_observed - total_expected,
    p_score = 100 * total_excess / total_expected
  )
cumulative_summary

## ----package-version----------------------------------------------------------
packageVersion("exmort")


## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", message = FALSE,
                     warning = FALSE, fig.width = 7.2, fig.height = 4.5)

## ----setup--------------------------------------------------------------------
library(exmort)

## ----installation, eval=FALSE-------------------------------------------------
# install.packages("exmort")

## ----development-installation, eval=FALSE-------------------------------------
# install.packages("remotes")
# remotes::install_github("shanlong-who/exmort")

## ----launch, eval=FALSE-------------------------------------------------------
# library(exmort)
# run_app()

## ----launch-options, eval=FALSE-----------------------------------------------
# run_app(launch.browser = FALSE, port = 3838)

## ----package-version----------------------------------------------------------
packageVersion("exmort")

## ----templates----------------------------------------------------------------
template_dir <- system.file("app", "XLSX", package = "exmort")
list.files(template_dir, pattern = "^Data_Entry_Template_.*\\.xlsx$")

## ----report-tools, eval=FALSE-------------------------------------------------
# install.packages("officedown")
# install.packages("tinytex")
# tinytex::install_tinytex()


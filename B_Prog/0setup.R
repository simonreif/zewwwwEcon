# Load packages
# install.packages(c("here", "tinytable", "tidyverse", "readr", "sf", "estimatr", "gt", "gtsummary", "modelsummary", "ggpubr", "showtext", "broom"))

library(here) # Make sure relative paths work
library(tidyverse) # Data wrangling
library(readr) # Data wrangling
library(sf) # Data wrangling
library(estimatr) # Estimating things
library(gt) # Format output
library(gtsummary) # Format output
library(tinytable) # Format output
library(modelsummary) # Format output
library(ggpubr) # Format output
library(broom) # Format output
library(showtext) # Work with different fonts

# ggplot2 Settings
theme_set(theme_classic())

# Define default colors
options(ggplot2.discrete.colour = c("#900000FF", "#A7B3CDFF", "#CCD7ADFF", "#676155FF", "#D4A76AFF"))

options(ggplot2.discrete.fill = c("#900000FF", "#A7B3CDFF", "#CCD7ADFF", "#676155FF", "#D4A76AFF"))


ggplot2::update_geom_defaults("point", aes(color = "#900000FF"))
ggplot2::update_geom_defaults("errorbar", aes(color = "#A7B3CDFF"))

# Define custom scale functions
scale_fill_gradient_custom <- function(...) {
  scale_fill_gradient(low = "#F9E0E0", high = "#2B1D1D", ...)
}

scale_colour_gradient_custom <- function(...) {
  scale_colour_gradient(low = "#F9E0E0", high = "#2B1D1D", ...)
}

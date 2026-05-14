# Load packages
# install.packages(c("here", "tidyverse", "readr", "sf", "estimatr", "gt", "gtsummary", "modelsummary", "ggpubr", "showtext", "broom"))

library(here) # Make sure relative paths work
library(tidyverse) # Data wrangling
library(readr) # Data wrangling
library(sf) # Data wrangling
library(estimatr) # Estimating things
library(gt) # Format output
library(gtsummary) # Format output
library(modelsummary) # Format output
library(ggpubr) # Format output
library(broom) # Format output
library(showtext) # Work with different fonts

# ggplot2 Settings
zew_theme <- theme_classic() +
  theme(
    axis.text.x = element_text(color = "black"),
    axis.text.y = element_text(color = "black", vjust = -0.1),
    axis.ticks.y = element_blank(),
    axis.line.x = element_line(linewidth = 0.5, color = "grey30"),
    axis.line.y = element_blank(),
    panel.grid.major.y = element_line(color = "grey70", linetype = "dotted", linewidth = 0.25, lineend = "round")
  )

theme_set(zew_theme)
rm(zew_theme)

# Add ZEW Font if project contains Report
if (file.exists(here("_extensions/zew-econ-report/fonts/MetaPro-Normal.otf"))) {
  # Add the font for ggplot
  font_add("MetaPro_Normal", here("_extensions/zew-econ-report/fonts/MetaPro-Normal.otf"))

  # Enable showtext for ggplot
  showtext_auto()

  update_theme(
    text = element_text(family = "MetaPro_Normal")
  )
}
# Define default colors
options(ggplot2.discrete.colour = c("#c8d202", "#9c9e9f", "#abdadc", "#35484f"))
options(ggplot2.discrete.fill = c("#c8d202", "#9c9e9f", "#abdadc", "#35484f"))

ggplot2::update_geom_defaults("point", aes(color = "#c8d202"))
ggplot2::update_geom_defaults("errorbar", aes(color = "#9c9e9f"))

# Define custom scale functions
scale_fill_gradient_custom <- function(...) {
  scale_fill_gradient(low = "#FAFBEC", high = "#c8d202", ...)
}

scale_colour_gradient_custom <- function(...) {
  scale_colour_gradient(low = "#FAFBEC", high = "#c8d202", ...)
}

# Description of project



# Load Packages
library(quarto) # To render from script
library(here) # Get relative paths right
library(tidyverse) # Data wrangling and plotting



# Render Outputs
quarto_render(here("Paper/Paper.qmd")) #Adjust as needed
quarto_render(here("Slides/Slides.qmd")) #Adjust as needed


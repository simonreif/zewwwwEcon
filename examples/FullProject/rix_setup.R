# install.packages("rix", repos = c(
#  "https://ropensci.r-universe.dev",
#   "https://cloud.r-project.org"
# ))
library(rix)

path_default_nix <- getwd()

rix(
  date = "2025-09-15",
  r_pkgs = c("rix",
"tidyverse",
"broom", 
"ggpubr", 
"modelsummary",
"gtsummary", 
"gt", 
"estimatr", 
"sf",
"quarto",
"showtext",
"here"
),
  system_pkgs = c("quarto",
  "git", "gnumake"),
  tex_pkgs = c(
"setspace", 
"lipsum", 
"txfonts",
"csquotes",
"geometry",
"float",
"multirow",
"colortbl",
"booktabs",
"threeparttable",
"caption",
"xcolor",
"fontspec",
"amsfonts",
"titling",
"biblatex",
"collection-bibtexextra",
"hyperref",
"placeins",
"pdflscape",
"framed"),
  git_pkgs = NULL,
  ide = "rstudio",
  project_path = path_default_nix,
  overwrite = TRUE,
  print = FALSE
)
# install.packages("rix", repos = c(
#  "https://ropensci.r-universe.dev",
#   "https://cloud.r-project.org"
# ))
library(rix)

path_default_nix <- getwd()

rix(
  date = "2026-04-13",
  r_pkgs = c(
    "rix",
    "tidyverse",
    "broom",
    "ggpubr",
    "modelsummary",
    "gtsummary",
    "gt",
    "estimatr",
    "sf",
    "data.table",
    "quarto",
    "showtext",
    "here"
  ),
  system_pkgs = c("quarto", "git", "gnumake"),
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
    "ninecolors",
    "tabularray",
    "tcolorbox",
    "tikzfill",
    "pdfcol",
    "fontawesome5",
    "framed"
  ),
  git_pkgs = NULL,
  ide = "none",
  project_path = path_default_nix,
  overwrite = TRUE,
  print = FALSE
)

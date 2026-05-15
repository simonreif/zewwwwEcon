# install.packages("rix", repos = c(
#  "https://ropensci.r-universe.dev",
#   "https://cloud.r-project.org"
# ))
library(rix)

path_default_nix <- getwd()


rix(
  date = "2026-04-06",
  r_pkgs = c(
    "rix",
    "here",
    "quarto",
    "data.table",
    "tidyverse",
    "tinytable",
    "readr",
    "broom",
    "readxl",
    "mice",
    "estimatr",
    "effsize",
    "effectsize",
    "gt",
    "gtsummary",
    "modelsummary",
    "showtext",
    "gridExtra",
    "cowplot",
    "patchwork",
    "sf",
    "knitr",
    "rmarkdown",
    "ggpubr"
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
    "textpos",
    "biblatex",
    "collection-bibtexextra",
    "hyperref",
    "placeins",
    "marginnote",
    "sectsty",
    "titlesec",
    "pdflscape",
    "pgf",
    "draftwatermark",
    "tabularray",
    "tabu",
    "ninecolors",
    "tcolorbox",
    "tikzfill",
    "pdfcol",
    "fontawesome5",
    "framed"
  ),
  project_path = path_default_nix,
  overwrite = TRUE,
  print = FALSE
)

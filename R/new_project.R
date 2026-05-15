#' Create zewwww-econ research project
#'
#' @description Creates a full zewwww-econ research project with the standard folder
#' structure and Quarto templates for Paper and Slides
#'
#' @param path Path automatically supplied by new_project.dcf when the user
#'   chooses a directory in the RStudio New Project wizard.
#'
#' @details Called behind the scenes by the RStudio New Project wizard entry
#'   defined in \code{inst/rstudio/templates/project/new_project.dcf}.
#'
#' @return Invisibly returns \code{NULL}. Side-effects only.
#'
#' @export

new_project <- function(path) {
  # Create root path if it does not exist
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # Locate installed package assets
  pkg_loc <- find.package("zewwwwEcon")
  fp <- function(...) file.path(pkg_loc, "FullProject", ...)

  # -------------------------------------------------------------------------
  # 1. Project folder structure
  # -------------------------------------------------------------------------
  for (d in c("A_Orig", "B_Prog", "C_Temp", "D_Out", "Paper", "Slides")) {
    dir.create(file.path(path, d), recursive = TRUE, showWarnings = FALSE)
  }

  # .gitkeep placeholders for data/output folders that should stay empty
  for (d in c("A_Orig", "C_Temp", "D_Out")) {
    file.copy(from = fp("A_Orig", ".gitkeep"), to = file.path(path, d, ".gitkeep"))
  }

  # -------------------------------------------------------------------------
  # 2. Quarto extensions (single recursive copy for zewwww-econ
  #    with all fonts, images, templates, and Lua filters)
  # -------------------------------------------------------------------------
  file.copy(
    from = fp("_extensions"),
    to = path,
    recursive = TRUE
  )

  # -------------------------------------------------------------------------
  # 3. VSCode / Positron settings and snippets
  # -------------------------------------------------------------------------
  file.copy(
    from = fp(".vscode"),
    to = path,
    recursive = TRUE
  )

  # -------------------------------------------------------------------------
  # 4. Project-level config and reproducibility files
  # -------------------------------------------------------------------------
  for (f in c(
    "_quarto.yml",
    "references.bib",
    "Makefile",
    "air.toml",
    "rix_setup.R",
    "default.nix",
    ".gitignore",
    ".Rprofile",
    ".lintr",
    "AGENTS.md"
  )) {
    file.copy(from = fp(f), to = file.path(path, f))
  }

  # -------------------------------------------------------------------------
  # 5. Analysis setup script
  # -------------------------------------------------------------------------
  file.copy(from = fp("B_Prog", "0setup.R"), to = file.path(path, "B_Prog", "0setup.R"))

  # -------------------------------------------------------------------------
  # 6. Quarto template documents (renamed for the user's project)
  # -------------------------------------------------------------------------
  file.copy(
    from = fp("Paper", "template_paper.qmd"),
    to = file.path(path, "Paper", "Paper_TITLE.qmd")
  )
  file.copy(
    from = fp("Slides", "template_slides.qmd"),
    to = file.path(path, "Slides", "Slides_TITLE.qmd")
  )

  # -------------------------------------------------------------------------
  # 7. Partner logo placeholders (replace with actual logo if needed)
  # -------------------------------------------------------------------------
  file.copy(
    from = fp("Slides", "partnerlogo.png"),
    to = file.path(path, "Slides", "partnerlogo.png")
  )

  invisible(NULL)
}

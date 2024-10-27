#' Create zewwww project
#'
#' @description This function creates an R project which includes markdown or
#' quarto files as well as additional supporting files. These files create a
#' project in ZEW style. Important information on the usage can be found in the
#' README of the project as well as in the documents.
#'
#' @param path Path automatically set by research_project.dcf (see
#'    \code{./rstudio/templates/project/})
#'
#' @details This function is employed when
#' a user selects ZEW Project.
#'
#' @importFrom tidyverse tidyverse_logo
#' @importFrom conflicted conflict_prefer
#' @importFrom bookdown html_document2
#' @importFrom rmarkdown html_document
#' @importFrom table1 t1kable
#' @importFrom rlang abort
#' @importFrom utils download.file
#' @importFrom usethis create_project
#'
#' @return Returns nothing.  See description above.
#'
#' @export


make_project <- function(
    path,
    type = c("Paper")
) {

  type <- match.arg(type)
  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)


  # Prevent user from overwriting a report file
  if (file.exists(paste0(path, "/skeleton.Rmd")) ||
      file.exists(paste0(path, "/skeleton.qmd"))
  ) {
    abort(
      "The directory you choose already has a report file. Stopping."
    )
  }

  # Create directory for original data

  dir.create(paste0(path, "/A_OrigData"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for analysis scripts

  dir.create(paste0(path, "/B_Prog"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for temporary data files

  dir.create(paste0(path, "/C_TempData"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for output files

  dir.create(paste0(path, "/D_Out"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for slides

  dir.create(paste0(path, "/Slides"), recursive = TRUE, showWarnings = FALSE)

  dir.create(paste0(path, "/Slides/zewwwImages"), recursive = TRUE, showWarnings = FALSE)

  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/skeleton.qmd"),
            to = paste0(path, "/Slides/Slides.qmd"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwwSlidesTemplate.tex"),
            to = paste0(path, "/Slides/zewwwwSlidesTemplate.tex"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewslides_qmd/skeleton/zewwwwImages/bg.png"),
            to = paste0(path, "/Slides/zewwwwImages/bg.png"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewslides_qmd/skeleton/zewwwwImages/bgmain.pdf"),
            to = paste0(path, "/Slides/zewwwwImages/bgmain.pdf"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewslides_qmd/skeleton/zewwwwImages/betitle.png"),
            to = paste0(path, "/Slides/zewwwwImages/bgtitle.png"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewslides_qmd/skeleton/zewwwwImages/empty.png"),
            to = paste0(path, "/Slides/zewwwwImages/empty.ong"))
  file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewslides_qmd/skeleton/zewwwwImages/yourlogo.png"),
            to = paste0(path, "/Slides/zewwwwImages/yourlogo.png"))


    dir.create(paste0(path, "/Paper"), recursive = TRUE, showWarnings = FALSE)
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwwpaper_qmd/skeleton/0_master.R"),
              to = paste0(path, "/0_master.R"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/skeleton.qmd"),
              to = paste0(path, "/Paper/Paper.qmd"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/zewwwwPaperTemplate.tex"),
              to = paste0(path, "/Paper/zewwwwPaperTemplate.tex"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/references.bib"),
              to = paste0(path, "/Paper/references.bib"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_R.ttf"),
              to = paste0(path, "/Paper/LinLibertine_R.ttf"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_RB.ttf"),
              to = paste0(path, "/Paper/LinLibertine_RB.ttf"))
    file.copy(from = paste0(temp_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_RI.ttf"),
              to = paste0(path, "/Paper/LinLibertine_RI.ttf"))


  } else {
    abort(
      "Something is wrong"
    )
  }

}

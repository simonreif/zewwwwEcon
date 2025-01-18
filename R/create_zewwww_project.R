#' Create zewwww project
#'
#' @description This function creates an R project which includes a quarto 
#' template as well as additional supporting files and a folder structure. 
#'
#' @param path Path automatically set by zewwww_project.dcf
#'
#' @param check_example Choose whether to have examples or not
#'
#' @details This function is employed behind the scenes when
#' a user creates a new zewwww project.
#'
#'
#' @return Returns nothing.  See description above.
#'
#' @export


create_zewwww_project <- function(path, check_example) {

  
  # Create path if it does not exist
  dir.create(path, recursive = TRUE, showWarnings = FALSE)


  # Prevent from overwriting a report file
  if (file.exists(paste0(path, "/skeleton.qmd"))
  ) {
    rlang::abort(
      "This directory already contains a Paper file."
    )
  }
  
  # Find package location
  
  pkg_loc <- find.package("zewwwwEcontemplates")
  
  
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
  
  # Copy the files

  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/skeleton.qmd"),
            to = paste0(path, "/Slides/Slides.qmd"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwwSlidesTemplate.tex"),
            to = paste0(path, "/Slides/zewwwwSlidesTemplate.tex"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwImages/bg.png"),
            to = paste0(path, "/Slides/zewwwImages/bg.png"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwImages/bgmain.pdf"),
            to = paste0(path, "/Slides/zewwwImages/bgmain.pdf"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwImages/bgtitle.png"),
            to = paste0(path, "/Slides/zewwwImages/bgtitle.png"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwImages/empty.png"),
            to = paste0(path, "/Slides/zewwwImages/empty.png"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwslides_qmd/skeleton/zewwwImages/yourlogo.png"),
            to = paste0(path, "/Slides/zewwwImages/yourlogo.png"))
  
  if (check_example == TRUE) {
    file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Makefile"),
              to = paste0(path, "/Makefile"))
    #file.copy(from = paste0(pkg_loc, "/examples/Makefile"),
     #         to = paste0(path, "/Makefile"))
  } 

  # Create directory for slides

  dir.create(paste0(path, "/Paper"), recursive = TRUE, showWarnings = FALSE)
  
  # Copy the files
  
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwwpaper_qmd/skeleton/0_master.R"),
              to = paste0(path, "/0_master.R"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/skeleton.qmd"),
              to = paste0(path, "/Paper/Paper.qmd"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/zewwwwPaperTemplate.tex"),
              to = paste0(path, "/Paper/zewwwwPaperTemplate.tex"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/references.bib"),
              to = paste0(path, "/Paper/references.bib"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_R.ttf"),
              to = paste0(path, "/Paper/LinLibertine_R.ttf"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_RB.ttf"),
              to = paste0(path, "/Paper/LinLibertine_RB.ttf"))
  file.copy(from = paste0(pkg_loc, "/extdata/_extensions/zewwwwpaper_qmd/skeleton/LinLibertine_RI.ttf"),
              to = paste0(path, "/Paper/LinLibertine_RI.ttf"))


  }

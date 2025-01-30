#' Create zewwww project
#'
#' @description This function creates an R project which includes a quarto 
#' template as well as additional supporting files and a folder structure. 
#'
#' @param path Path automatically set by zewwww_project.dcf
#'
#' @details This function is employed behind the scenes when
#' a user creates a new zewwww project.
#'
#' @return Returns nothing.  See description above.
#'
#' @export


create_zewwww_project <- function(path) {

  
  # Create path if it does not exist
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  
  # Find package location
  
  pkg_loc <- find.package("zewwwwEcontemplates")
  
  
  # Create directory for original data

  dir.create(paste0(path, "/A_Orig"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for analysis scripts

  dir.create(paste0(path, "/B_Prog"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for temporary data files

  dir.create(paste0(path, "/C_Temp"), recursive = TRUE, showWarnings = FALSE)

  # Create directory for output files

  dir.create(paste0(path, "/D_Out"), recursive = TRUE, showWarnings = FALSE)
  
  # Create directory for paper
  
  dir.create(paste0(path, "/Paper"), recursive = TRUE, showWarnings = FALSE)
  
  dir.create(paste0(path, "/Paper/paper_cache"), recursive = TRUE, showWarnings = FALSE)
  
  dir.create(paste0(path, "/Paper/paper_files"), recursive = TRUE, showWarnings = FALSE)
  

  # Create directory for slides

  dir.create(paste0(path, "/Slides"), recursive = TRUE, showWarnings = FALSE)

  dir.create(paste0(path, "/Slides/zewwwImages"), recursive = TRUE, showWarnings = FALSE)
  
  dir.create(paste0(path, "/Slides/pictures"), recursive = TRUE, showWarnings = FALSE)
  
  dir.create(paste0(path, "/Slides/slides_cache"), recursive = TRUE, showWarnings = FALSE)
  
  dir.create(paste0(path, "/Slides/slides_files"), recursive = TRUE, showWarnings = FALSE)
  
  
  
  ## Copy general files (not paper and slides)
  
  # Makefile
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Makefile"),
            to = paste0(path, "/Makefile"), recursive = TRUE)
  
  # Original Data
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/A_Orig"),
            to = paste0(path), recursive = TRUE)
  
  # Analysis Code
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/B_Prog"),
            to = paste0(path), recursive = TRUE)
  
  # Temporary file
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/C_Temp"),
            to = paste0(path), recursive = TRUE)
  
  # Output
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/D_Out"),
            to = paste0(path), recursive = TRUE)
  
  # References
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/references.bib"),
            to = paste0(path, "/references.bib"))
  
  
  ## Copy files for paper

  # Quarto file
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Paper/example_paper.qmd"),
            to = paste0(path, "/Paper/paper.qmd"))
  
  # Font normal
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Paper/LinLibertine_R.ttf"),
            to = paste0(path, "/Paper/LinLibertine_R.ttf"))
  
  # Font bold
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Paper/LinLibertine_RB.ttf"),
            to = paste0(path, "/Paper/LinLibertine_RB.ttf"))
  
  # Font italic
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Paper/LinLibertine_RI.ttf"),
            to = paste0(path, "/Paper/LinLibertine_RI.ttf"))
  
  # Template
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Paper/zewwwwPaperTemplate.tex"),
            to = paste0(path, "/Paper/zewwwwPaperTemplate.tex"))
  
  
  ## Copy files for slides
  
  # Quarto file
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Slides/example_slides.qmd"),
            to = paste0(path, "/Slides/slides.qmd"))
  
  # Example pirctures
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Slides/pictures"),
            to = paste0(path, "/Slides"), recursive = TRUE)
  
  # Template images
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Slides/zewwwwImages"),
            to = paste0(path, "/Slides"), recursive = TRUE)
  
  # Template
  file.copy(from = paste0(pkg_loc, "/examples/ComplexProject/Slides/zewwwwSlidesTemplate.tex"),
            to = paste0(path, "/Paper/zewwwwSlidesTemplate.tex"))
  
  
}

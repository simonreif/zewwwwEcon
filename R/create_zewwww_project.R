#' Create zewwwww project
#'
#' @description This function creates an R project which includes a quarto 
#' template as well as additional supporting files and a folder structure. 
#'
#' @param path Path automatically set by zewwwww_project.dcf
#'
#' @details This function is employed behind the scenes when
#' a user creates a new zewwwww project.
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

  # Create directory for slides
  dir.create(paste0(path, "/Slides"), recursive = TRUE, showWarnings = FALSE)
  dir.create(paste0(path, "/Slides/zewwwwImages"), recursive = TRUE, showWarnings = FALSE)
  
   ## Copy general files (not paper and slides)
  
  # Makefile
  file.copy(from = paste0(pkg_loc, "/FullProject/Makefile"),
            to = paste0(path, "/Makefile"), recursive = TRUE)
  
  # gitignore
  file.copy(from = paste0(pkg_loc, "/FullProject/.gitignore"),
            to = paste0(path, "/.gitignore"), recursive = TRUE)
  
  # LintR Settings
  file.copy(from = paste0(pkg_loc, "/FullProject/.lintr"),
            to = paste0(path, "/.lintr"), recursive = TRUE)
  
  # Setup Code
  file.copy(from = paste0(pkg_loc, "/FullProject/B_Prog"),
            to = paste0(path), recursive = TRUE)
  
  # References
  file.copy(from = paste0(pkg_loc, "/FullProject/references.bib"),
            to = paste0(path, "/references.bib"))
  
  ## Copy files for Paper
  # Quarto file
  file.copy(from = paste0(pkg_loc, "/FullProject/Paper/paper_skeleton.qmd"),
            to = paste0(path, "/Paper/Paper_TITLE.qmd"))
  
  # Font normal
  file.copy(from = paste0(pkg_loc, "/FullProject/Paper/LinLibertine_R.ttf"),
            to = paste0(path, "/Paper/LinLibertine_R.ttf"))
  
  # Font bold
  file.copy(from = paste0(pkg_loc, "/FullProject/Paper/LinLibertine_RB.ttf"),
            to = paste0(path, "/Paper/LinLibertine_RB.ttf"))
  
  # Font italic
  file.copy(from = paste0(pkg_loc, "/FullProject/Paper/LinLibertine_RI.ttf"),
            to = paste0(path, "/Paper/LinLibertine_RI.ttf"))
  
  # Template
  file.copy(from = paste0(pkg_loc, "/FullProject/Paper/zewwwwPaperTemplate.tex"),
            to = paste0(path, "/Paper/zewwwwPaperTemplate.tex"))
  
  ## Copy files for Slides
  # Quarto file
  file.copy(from = paste0(pkg_loc, "/FullProject/Slides/slides_skeleton.qmd"),
            to = paste0(path, "/Slides/Slides_TITLE.qmd"))

  # Template images
  file.copy(from = paste0(pkg_loc, "/FullProject/Slides/zewwwwImages"),
            to = paste0(path, "/Slides"), recursive = TRUE)
  
  # Template
  file.copy(from = paste0(pkg_loc, "/FullProject/Slides/zewwwwSlidesTemplate.tex"),
            to = paste0(path, "/Slides/zewwwwSlidesTemplate.tex"))
  
}

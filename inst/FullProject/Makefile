# Project Makefile
###################

## Define Variables
# Output
PAPER_SRC  = Paper/Paper_TITLE.qmd
PAPER_OUT  = Paper/Paper_TITLE.pdf
SLIDES_SRC = Slides/Slides_TITLE.qmd
SLIDES_OUT = Slides/Slides_TITLE.pdf
REPORT_SRC = Report/Report_TITLE.qmd
REPORT_OUT = Report/Report_TITLE.pdf

# Templates and references
TEMPLATE = _extensions/
REFS     = references.bib

# Default target
all: $(PAPER_OUT) $(SLIDES_OUT) $(REPORT_OUT)

# Input — add D_Out/*.rds produced by B_Prog scripts here
GRAPHS =
TABLES =

# Raw data files — add A_Orig/* files here to track data dependencies
DATA =

# Setup
R_SETUP = B_Prog/0setup.R

## Render Output
$(PAPER_OUT): $(PAPER_SRC) $(TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(PAPER_SRC)
$(SLIDES_OUT): $(SLIDES_SRC) $(TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(SLIDES_SRC)
$(REPORT_OUT): $(REPORT_SRC) $(TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(REPORT_SRC)
	
## Generate Graphs
# Pattern: D_Out/g_name.rds: $(R_SETUP) B_Prog/script.R
# 	Rscript B_Prog/script.R
## Generate Tables
# Pattern: D_Out/t_name.rds: $(R_SETUP) B_Prog/script.R
# 	Rscript B_Prog/script.R
## Data Preparation
# Pattern: C_Temp/file.rds: $(R_SETUP) $(DATA) B_Prog/script.R
# 	Rscript B_Prog/script.R
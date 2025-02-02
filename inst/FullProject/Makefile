# Makefile
####################

## Define Variables 
# Output
PAPER_SRC = Paper/Paper_TITLE.qmd
PAPER_OUT = Paper/Paper_TITLE.pdf
PAPER_TEMPLATE = Paper/zewwwwPaperTemplate.tex
SLIDES_SRC = Slides/Slides_TITLE.qmd
SLIDES_OUT = Slides/Slides_TITLE.pdf
SLDIES_TEMPLATE = Slides/zewwwwSlidesTemplate.tex
REFS = references.bib

# Default target
all: $(PAPER_OUT) $(SLIDES_OUT)

# Input
GRAPHS = \
D_Out/g_XXXXX.rds

TABLES = \
D_Out/t_XXXXX.rds

DATA = \
A_Orig/XXXXX.csv

# Setup
R_SETUP = B_Prog/0setup.R


## Data Preparation
C_Temp/XXXXX_df.rds: $(R_SETUP) $(DATA) B_Prog/ZZZZZ.R
	Rscript B_Prog/ZZZZZ.R
	
## Generate Graphs
D_Out/g_XXXXX.rds: $(R_SETUP) B_Prog/XXXXX.R 
	Rscript B_Prog/XXXXX.R
	
## Generate Tables 
D_Out/t_XXXXX.rds: $(R_SETUP) B_Prog/YYYYY.R 
	Rscript B_Prog/YYYYY.R

## Render Output
$(PAPER_OUT): $(PAPER_SRC) $(PAPER_TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(PAPER_SRC)
	
$(SLIDES_OUT): $(SLIDES_SRC) $(SLIDES_TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(SLIDES_SRC)
	
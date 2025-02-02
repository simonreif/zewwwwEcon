# Template Makefile
####################

## Define Variables 
# Output
PAPER_SRC = Paper/example_paper.qmd
PAPER_OUT = Paper/example_paper.pdf
PAPER_TEMPLATE = Paper/zewwwwPaperTemplate.tex
SLIDES_SRC = Slides/example_slides.qmd
SLIDES_OUT = Slides/example_slides.pdf
SLDIES_TEMPLATE = Slides/zewwwwSlidesTemplate.tex
REFS = references.bib

# Default target
all: $(PAPER_OUT) $(SLIDES_OUT)

# Input
GRAPHS = \
D_Out/g_hist.rds \
D_Out/g_bar.rds \
D_Out/g_tsplot.rds \
D_Out/g_scatterplot.rds \
D_Out/g_dotplot.rds \
D_Out/g_eventstudy.rds \
D_Out/g_choro.rds \
D_Out/g_indic.rds

TABLES = \
D_Out/t_descriptives.rds \
D_Out/t_regression.rds

DATA = \
A_Orig/45412-03-02-4-B_flat.csv \
A_Orig/VG2500_KRS.cpg \
A_Orig/VG2500_KRS.dbf \
A_Orig/VG2500_KRS.prj \
A_Orig/VG2500_KRS.shp \
A_Orig/VG2500_KRS.shx 

# Setup
R_SETUP = B_Prog/0setup.R

## Render Output
$(PAPER_OUT): $(PAPER_SRC) $(PAPER_TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(PAPER_SRC)
	
$(SLIDES_OUT): $(SLIDES_SRC) $(SLIDES_TEMPLATE) $(REFS) $(GRAPHS) $(TABLES)
	quarto render $(SLIDES_SRC)
	
## Generate Graphs
D_Out/g_hist.rds: $(R_SETUP) B_Prog/histogram.R 
	Rscript B_Prog/histogram.R

D_Out/g_bar.rds: $(R_SETUP) B_Prog/barchart.R 
	Rscript B_Prog/barchart.R
	
D_Out/g_tsplot.rds: $(R_SETUP) B_Prog/tsplot.R 
	Rscript B_Prog/tsplot.R
	
D_Out/g_scatterplot.rds: $(R_SETUP) B_Prog/scatterplot.R 
	Rscript B_Prog/scatterplot.R
	
D_Out/g_dotplot.rds: $(R_SETUP) B_Prog/dotplot.R 
	Rscript B_Prog/dotplot.R
	
D_Out/g_eventstudy.rds: $(R_SETUP) B_Prog/eventstudy.R 
	Rscript B_Prog/eventstudy.R
	
D_Out/g_choro.rds: $(R_SETUP) B_Prog/choropleth_map.R C_Temp/analysis_df.rds
	Rscript B_Prog/choropleth_map.R
	
D_Out/g_indic.rds: $(R_SETUP) B_Prog/indicator_map.R C_Temp/analysis_df.rds
	Rscript B_Prog/indicator_map.R
	
## Generate Tables 
D_Out/t_descriptives.rds: $(R_SETUP) B_Prog/descriptives.R 
	Rscript B_Prog/descriptives.R

D_Out/t_regression.rds: $(R_SETUP) B_Prog/regression.R 
	Rscript B_Prog/regression.R

## Data Preparation
C_Temp/analysis_df.rds: $(R_SETUP) $(DATA) B_Prog/1dataprep_shape.R
	Rscript B_Prog/1dataprep_shape.R

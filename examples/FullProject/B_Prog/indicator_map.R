# This file creates a Barchart
# - Input:  analysis.df
# - Output: g_indicator.rds

# Load setup
source("B_Prog/0setup.R")



# Get data
analysis_df <- readRDS("C_Temp/analysis_df.rds")

# Plot the map with ggplot2 and geom_sf
g_indic <- ggplot(data = analysis_df) +
  geom_sf(aes(fill = uniklinik)) +
  scale_fill_manual(values = c("University Hospital" = "#900000FF", "No University Hospital" = "white")) +
  annotate("point", x = 11.079113, y = 49.452265, color = "white", size = 4) +
  annotate("point", x = 11.079113, y = 49.452265, color = "#900000FF", size = 3) +
  annotate("label", x = 11.079113, y = 49.65, label = "FAU",
           color = "#900000FF", fill = "white", size = 4, label.size = 0.5, label.r = unit(0.15, "lines")) +
  annotate("point", x = 8.4658811, y = 49.481899, color = "white", size = 4) +
  annotate("point", x = 8.4658811, y = 49.481899, color = "#900000FF", size = 3) +
  annotate("label", x = 8.4658811, y = 49.28, label = "ZEW",
           color = "#900000FF", fill = "white", size = 4, label.size = 0.5, label.r = unit(0.15, "lines")) +
  theme_void() +
  theme(legend.position = "none")

saveRDS(g_indic, "D_Out/g_indic.rds")
rm(analysis_df, g_indic) # Clean workspace

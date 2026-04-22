# This file creates a Barchart
# - Input:  analysis.df
# - Output: g_indic.rds

# Load setup
source("B_Prog/0setup.R")

# Get data
analysis_df <- readRDS("C_Temp/analysis_df.rds")

# Plot the map with ggplot2 and geom_sf
g_indic <- ggplot(data = analysis_df) +
  geom_sf(aes(fill = uniklinik)) +
  scale_fill_manual(values = c("University Hospital" = "#c8d202", "No University Hospital" = "white")) +
  annotate("point", x = 11.079113, y = 49.452265, color = "grey10", size = 4) +
  annotate(
    "label",
    x = 11.079113,
    y = 49.65,
    label = "FAU",
    color = "white",
    fill = "grey10",
    size = 5,
    label.r = unit(0.15, "lines")
  ) +
  annotate("point", x = 8.4658811, y = 49.481899, color = "grey10", size = 4) +
  annotate(
    "label",
    x = 8.4658811,
    y = 49.28,
    label = "ZEW",
    color = "white",
    fill = "grey10",
    size = 5,
    label.r = unit(0.15, "lines")
  ) +
  theme_void() +
  theme(legend.position = "none")

saveRDS(g_indic, "D_Out/g_indic.rds")
rm(analysis_df, g_indic) # Clean workspace

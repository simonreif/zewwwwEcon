# This file creates a Barchart
# - Input:  analysis.df
# - Output: g_choromap.rds

# Load setup
source("B_Prog/0setup.R")

# Get data
analysis_df <- readRDS("C_Temp/analysis_df.rds")

# Plot
g_choro <- ggplot(analysis_df) +
  geom_sf(aes(fill = overnight_stays / 1000)) +
  scale_fill_gradient_custom(
    name = "in 1000 Visitors"
  )  +
  annotate("point", x = 11.079113, y = 49.452265, color = "white", size = 6) +
  annotate("point", x = 11.079113, y = 49.452265, color = "#A7B3CDFF", size = 3) +
  annotate("label", x = 11.079113, y = 49.65, label = "FAU",
           color = "#A7B3CDFF", fill = "white", size = 4, label.size = 0.5, label.r = unit(0.15, "lines")) +
  annotate("point", x = 8.4658811, y = 49.481899, color = "white", size = 6) +
  annotate("point", x = 8.4658811, y = 49.481899, color = "#A7B3CDFF", size = 3) +
  annotate("label", x = 8.4658811, y = 49.28, label = "ZEW",
           color = "#A7B3CDFF", fill = "white", size = 4, label.size = 0.5, label.r = unit(0.15, "lines")) +
  theme_void()

saveRDS(g_choro, "D_Out/g_choro.rds")
rm(analysis_df, g_choro) # Clean workspace

# This file creates a Scatterplot
# - Input:  None
# - Output: g_scatter.rds

# Load setup
source("B_Prog/0setup.R")

# Generate Data
set.seed(123)
data <- data.frame(
  x = c(rnorm(50, mean = 5), rnorm(50, mean = 10)),
  y = c(rnorm(50, mean = 5), rnorm(50, mean = 10)),
  group = factor(c(rep("Group A", 50), rep("Group B", 50))),
  count = sample(1:10, 100, replace = TRUE)  # count for dot size
)

# Plot
g_scatterplot <- ggplot(data, aes(x = x, y = y, color = group, size = count)) +
  geom_point() +
  labs(x = "X Axis",
       y = "Y Axis",
       color = NULL) +
  guides(size = "none") +
  theme(legend.position = "right")

saveRDS(g_scatterplot, "D_Out/g_scatterplot.rds")
rm(data, g_scatterplot) # Clean workspace

# This file creates a Dotplot
# - Input:  None
# - Output: g_dotplot.rds

# Load setup
library(here)
source(here("B_Prog/0setup.R"))

# Create a simple data frame
set.seed(123)
data <- data.frame(
  group = rep(c("Group A", "Group B", "Group C"), each = 20),
  value = c(round(rnorm(20, mean = 5)), round(rnorm(20, mean = 7)), round(rnorm(20, mean = 9)))
)

# Create the dot plot
g_dotplot <- ggplot(data, aes(x = group, y = value, fill = group)) +
  geom_dotplot(binaxis = "y", stackdir = "center", stackratio = 1.1) +
  labs(x = " ", y = " ", fill = NULL) +
  scale_y_continuous(limits = c(0, NA)) +
  theme(
    axis.title.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.line.x = element_blank(),
    legend.position = "none"
  )

saveRDS(g_dotplot, here("D_Out/g_dotplot.rds"))
rm(data, g_dotplot) # Clean workspace

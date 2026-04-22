# This file creates a Histogram
# - Input:  None
# - Output: g_hist.rds

# Load setup
library(here)
source(here("B_Prog/0setup.R"))

set.seed(1234)
df <- data.frame(
  sex = factor(rep(c("Female", "Male"), each = 200)),
  height = round(c(rnorm(200, mean = 160, sd = 9), rnorm(200, mean = 175, sd = 10)))
)

# Make plot
g_hist <- ggplot(df) +
  geom_histogram(mapping = aes(x = height, fill = sex), color = "white", binwidth = 2) +
  labs(
    x = "",
    y = "",
    fill = "Sex"
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)))

saveRDS(g_hist, here("D_Out/g_hist.rds"))
rm(df, g_hist) # Clean workspace

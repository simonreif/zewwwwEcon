# This file creates a Time Series Plot
# - Input:  None
# - Output: g_tsplot.rds

# Load setup
source("B_Prog/0setup.R")

# Generate data
set.seed(123)
time <- seq(as.Date("2023-01-01"), by = "month", length.out = 12)
series1 <- cumsum(rnorm(12, 0, 1))
series2 <- cumsum(rnorm(12, 0, 1))

df <- data.frame(
  time = rep(time, 2),
  value = c(series1, series2),
  series = rep(c("Series 1", "Series 2"), each = 12)
)

#Plot1
g_tsplot <- ggplot(df, aes(x = time, y = value, color = series)) +
  geom_line() +
  labs(x = "", y = "") +
  theme(legend.position = "none")

saveRDS(g_tsplot, "D_Out/g_tsplot.rds")
rm(df, g_tsplot) # Clean workspace

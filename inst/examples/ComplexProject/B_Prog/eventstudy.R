# This file creates an Event Study Graph
# - Input:  None
# - Output: g_eventstudy.rds

# Load setup
source("B_Prog/0setup.R")

# Create a simple data frame
set.seed(42)

# Create rel_time from -5 to 5
rel_time <- -5:5

# Generate random coefficients
# Coefficients increase sharply at rel_time == 1 and stay elevated, with 0 at rel_time == -1
coefficients <- c(rnorm(5, mean = 0, sd = 0.1), 0, rnorm(5, mean = 1, sd = 0.2))

# Generate random standard errors for each time point, with 0 at rel_time == -1
std_errors <- c(rnorm(5, mean = 0.1, sd = 0.05), 0, rnorm(5, mean = 0.1, sd = 0.05))

# Compute confidence intervals (95%)
conf_min <- coefficients - 1.96 * std_errors
conf_max <- coefficients + 1.96 * std_errors

# Create the data frame
event_study_df <- data.frame(
  rel_time = rel_time,
  coefficient = coefficients,
  std_error = std_errors,
  conf_min = conf_min,
  conf_max = conf_max
)

# Get rid of intermediate files
rm(rel_time, coefficients, std_errors, conf_min, conf_max)

# Plot
g_eventstudy <- ggplot(event_study_df, aes(x = rel_time, y = coefficient)) +
  geom_errorbar(aes(ymin = conf_min, ymax = conf_max), width = 0.2) +
  geom_point(size = 2) +
  labs(x = "",
       y = "") +
  scale_x_continuous(labels = scales::number_format(accuracy = 1)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_vline(xintercept = 0, linetype = "dashed")

saveRDS(g_eventstudy, "D_Out/g_eventstudy.rds")
rm(event_study_df, g_eventstudy) # Clean workspace

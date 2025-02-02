# This file creates a Barchart
# - Input:  None
# - Output: g_bar.rds

# Load setup
source("B_Prog/0setup.R")

# Get data
states <- data.frame(
  country = c("Germany", "USA", "Brazil", "Austria"),
  value = c(16, 50, 26, 9)
)

# Make plot
g_bar <- ggplot(states) +
  geom_bar(mapping = aes(x = country, y = value, fill = country),
           color = "white", stat = "identity") +
  labs(y = " ") +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  scale_x_discrete(expand = c(0, 0)) +
  theme(axis.title.x = element_blank(), axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(), legend.position = "none")

saveRDS(g_bar, "D_Out/g_bar.rds")
rm(states, g_bar) # Clean workspace

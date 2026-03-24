# Script to import DURIN Data Overview
# Created: October 14, 2025

# Load required libraries
library(tidyverse)

# Import Durin Data Overview
data_overview <- read_csv("DURIN - Data overview - Data overview.csv")

# Create a plot showing count of datasets by Status
status_plot <- data_overview %>% 
  filter(!is.na(Status)) %>% 
  count(Status) %>% 
  mutate(Status = factor(Status, levels = c("Planned", "Collecting", "Collected", "Cleaning data", "Finalized"))) %>% 
  ggplot(aes(x = Status, y = n, fill = Status)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = n), hjust = -0.3, size = 4) +
  coord_flip() +
  scale_x_discrete(limits = rev) +
  labs(
    x = "",
    y = "Number of Datasets",
    caption = paste("Total datasets:", nrow(data_overview %>% filter(!is.na(Status))))
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.text = element_text(size = 11),
    axis.title = element_text(size = 12, face = "bold")
  )

# Display the plot
print(status_plot)

# Optional: Save the plot
# ggsave("plots/data_overview_status.png", status_plot, width = 10, height = 6, dpi = 300)


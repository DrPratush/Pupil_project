# coverage_analysis.R

# Load required libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# Load the dataset
df <- read.csv("data/PupilBioTest_PMP_revA.csv")

# Group by CpG_Coordinates and Tissue, calculate coverage
coverage_stats <- df %>%
  group_by(CpG_Coordinates, Tissue) %>%
  summarize(Coverage = sum(X.111), .groups = 'drop') %>%
  pivot_wider(names_from = Tissue, values_from = Coverage, values_fill = 0) %>%
  summarize(
    Islet_Median = median(Islet, na.rm = TRUE),
    Islet_CV = sd(Islet, na.rm = TRUE) / mean(Islet, na.rm = TRUE),
    cfDNA_Median = median(cfDNA, na.rm = TRUE),
    cfDNA_CV = sd(cfDNA, na.rm = TRUE) / mean(cfDNA, na.rm = TRUE)
  )

# Print coverage statistics
print("Coverage Statistics (Median and CV):")
print(coverage_stats)

# Plotting Coverage Distribution
coverage_long <- df %>%
  pivot_longer(cols = c(Islet, cfDNA), names_to = "Tissue", values_to = "Coverage")

# Boxplot
ggplot(coverage_long, aes(x = Tissue, y = Coverage, fill = Tissue)) +
  geom_boxplot() +
  labs(title = "CpG Coverage Comparison", x = "Tissue", y = "Coverage") +
  theme_minimal()

ggsave("results/figures/CpG_Coverage_Comparison.png")

# Histogram
ggplot(coverage_long, aes(x = Coverage, fill = Tissue)) +
  geom_histogram(bins = 30, alpha = 0.7, position = 'identity') +
  labs(title = "CpG Coverage Distribution", x = "Coverage", y = "Frequency") +
  theme_minimal()

ggsave("results/figures/CpG_Coverage_Distribution.png")

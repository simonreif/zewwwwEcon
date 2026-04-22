# This file creates a Descriptives Table
# - Input:  None
# - Output: t_descriptives.rds

# Load setup
library(here)
source(here("B_Prog/0setup.R"))

set.seed(123)
# Generate random data
n <- 500
treatment <- rbinom(n, 1, 0.5)
female <- rbinom(n, 1, 0.5)
severity <- rbinom(n, 1, 0.4)
age <- runif(n, min = 20, max = 80)
logit_survival <- -1 + 1.5 * treatment - 2 * severity + 0.01 * (age - 50)
prob_survival <- 1 / (1 + exp(-logit_survival))
survival <- rbinom(n, 1, prob_survival)
df <- data.frame(
  treatment = treatment,
  survival = survival,
  age = age,
  female = female,
  severity = severity
)

# Remove temp variables
rm(treatment, survival, age, female, severity, logit_survival, prob_survival, n)
library(tinytable)
library(gtsummary)
library(dplyr)

desc_tib <- tbl_summary(
  df,
  type = everything() ~ "continuous",
  by = treatment,
  statistic = list(all_continuous() ~ "{mean} ({sd})"),
  label = list(
    survival = "Survival",
    age = "Age in years",
    female = "Female",
    severity = "Severity Score"
  ),
  digits = all_continuous() ~ 2
) |>
  as_tibble()

names(desc_tib) <- gsub("\\*\\*", "", names(desc_tib))
desc_tib <- desc_tib |>
  mutate(across(everything(), ~ gsub("\\*\\*", "", .x)))

t_descriptives <- tt(desc_tib) |>
  style_tt(i = 0, bold = TRUE)

saveRDS(t_descriptives, here("D_Out/t_descriptives.rds"))
rm(df, desc_tib, t_descriptives) # Clean workspace

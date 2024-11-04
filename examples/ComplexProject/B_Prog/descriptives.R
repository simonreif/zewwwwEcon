# This file creates a Descriptives Table
# - Input:  None
# - Output: t_descriptives.rds

# Load setup
source("B_Prog/0setup.R")

set.seed(123)

# Generate randm rada
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

# Make table
t_descriptives <- tbl_summary(df,
                              type = everything() ~ "continuous",
                              by = treatment,
                              statistic = list(all_continuous() ~ "{mean} ({sd})"),
                              label = list(
                                           survival = "Survival",
                                           age = "Age in years",
                                           female = "Female",
                                           severity = "Severity Score"),
                              digits = all_continuous() ~ 2) |>
  as_gt() |>
  rm_footnotes() |>
  tab_source_note(source_note = md("­")) |>
  tab_source_note(source_note = md("**Notes:** Here is additional information 
                                   on the table, which can be lengthy. It does 
                                   not have to be but in order to check for line 
                                   breaks, it makes sense to have it this way. 
                                   It does not have to be but in order to check 
                                   for line breaks, it makes sense to have it 
                                   this way."))

saveRDS(t_descriptives, "D_Out/t_descriptives.rds")
rm(df, t_descriptives) # Clean workspace

# This file creates a Regression Table
# - Input:  None
# - Output: t_regression.rds

# Load setup
library(here)
source(here("B_Prog/0setup.R"))

# Generate random data
set.seed(123)
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

# Clean workspace
rm(n, treatment, female, severity, age, logit_survival, prob_survival, survival)

# Make table
models <- list(
  "(I)" = lm_robust(survival ~ treatment, data = df),
  "(II)" = lm_robust(survival ~ treatment + female + age + severity, data = df),
  "(III)" = lm_robust(survival ~ treatment, data = df |> filter(female == 0)),
  "(IV)" = lm_robust(survival ~ treatment + female + age + severity, data = df |> filter(female == 0)),
  "(V)" = lm_robust(survival ~ treatment, data = df |> filter(female == 1)),
  "(VI)" = lm_robust(survival ~ treatment + female + age + severity, data = df |> filter(female == 1))
)

# Format summary statistics
gm <- tibble::tribble(
  ~raw        ,
  ~clean      ,
  ~fmt        ,
  "nobs"      ,
  "N"         ,
            0 ,
  "r.squared" ,
  "R²"        ,
            2
)

# Format coefficients
cm <- c(treatment = "Treatment")

# Create tinytable output (works with both Typst and LaTeX)
# NO stars parameter - avoid asterisks entirely
t_regression <- modelsummary(
  models,
  output = "tinytable",
  coef_map = cm,
  gof_map = gm,
  statistic = "std.error",
  stars = c("*" = 0.1, "**" = 0.05, "***" = 0.01) # Use + instead of *
) |>
  group_tt(
    j = list(
      "Full Sample" = 2:3,
      "Men" = 4:5,
      "Women" = 6:7
    ),
    bold = TRUE
  )

saveRDS(t_regression, here("D_Out/t_regression.rds"))
rm(df, models, gm, cm, t_regression) # Clean workspace

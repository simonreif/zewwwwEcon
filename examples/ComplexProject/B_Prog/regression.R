# This file creates a Regression Table
# - Input:  None
# - Output: t_regression.rds

# Load setup
source("B_Prog/0setup.R")

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
  "(I)" = lm_robust(survival ~ treatment,
                    data = df),
  "(II)" = lm_robust(survival ~ treatment + female + age + severity,
                     data = df),
  "(III)" = lm_robust(survival ~ treatment,
                      data = df |> filter(female == 0)),
  "(IV)" = lm_robust(survival ~ treatment + female + age + severity,
                     data = df |> filter(female == 0)),
  "(V)" = lm_robust(survival ~ treatment,
                    data = df |> filter(female == 1)),
  "(VI)" = lm_robust(survival ~ treatment + female + age + severity,
                     data = df |> filter(female == 1))
)

# Format summary statistics
gm <- tibble::tribble(
                      ~raw,        ~clean,          ~fmt,
                      "nobs",      "N",             0,
                      "r.squared", "R²",            2)

# Format coefficients
cm <- c(treatment = "Treatment")

t_regression <- modelsummary(models,
                             stars = c("*" = .1, "**" = .05, "***" = 0.01),
                             coef_rename = c(),
                             statistic = "std.error",
                             gof_map = gm,
                             coef_map = cm,
                             escape = FALSE,
                             output = "gt") |>
  tab_spanner(
    label = "Full Sample",
    columns = c(2, 3)
  ) |>
  tab_spanner(
    label = "Men",
    columns = c(4, 5)
  ) |>
  tab_spanner(label = "Women",
              columns = c(6, 7)) |>
  rm_source_notes() |>
  tab_source_note(source_note = md("­")) |>
  tab_source_note(source_note = md(
    "**Notes:** Here is additional information on the table, which can be 
    lengthy. It does not have to be but in order to check for line breaks, 
    it makes sense to have it this way. It does not have to be but in order 
    to check for line breaks, it makes sense to have it this way."
  )) |>
  tab_style(style = cell_borders(sides = c("bottom"),
                                 color = "red", weight = px(1.5)),
            locations = cells_body(rows = c(2))) #ATM not converted to TeX!

saveRDS(t_regression, "D_Out/t_regression.rds")
rm(df, models, gm, cm, t_regression) # Clean workspace

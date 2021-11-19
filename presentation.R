library(finalfit)
library(dplyr)

# Load example dataset, modified version of survival::colon
data("colon_s")

# Table 1 - Patient demographics by variable of interest ----
explanatory = c("age", "age.factor", "sex.factor", "obstruct.factor")
dependent = "perfor.factor" # Bowel perforation
colon_s %>%
  summary_factorlist(dependent, explanatory,
                     p=TRUE, add_dependent_label=TRUE) -> t1
knitr::kable(t1, row.names=FALSE, align=c("l", "l", "r", "r", "r"))

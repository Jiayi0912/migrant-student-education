
## apa theme
theme_apa <- function(...) papaja::theme_apa(...)

## define plot palette
palette_apa <- c("#56B4E9", "#009E73")

## define a function that can compute formatted table reporting regression results
report_lmer <- function(model, use_lmerTest = TRUE) {
  # extract results
  if (use_lmerTest) {
    # use lmerTest to summary the p.value
    results <- summary(model)$coefficients
    results <- as.data.frame(results)
    colnames(results) <- c("Estimate", "Std. Error", "df", "t.value", "p.value")
    results$term <- rownames(results)  # extract term from rownames
    rownames(results) <- NULL  # remove rownames
  } else {
    # use broom.mixed::tidy to extract the result
    results <- broom.mixed::tidy(model, effects = "fixed")
  }
  
  # ensure the order of columns
  results <- results[, c("term", setdiff(names(results), "term"))]
  
  # round numeric columns
  numeric_cols <- sapply(results, is.numeric)  
  results[numeric_cols] <- round(results[numeric_cols], 3)
  
  # Use flextable to create a nicely formatted table
  ft <- flextable(results)
  
  # Set column headers
  ft <- set_header_labels(ft,
                          term = "Term",
                          estimate = "Estimate",
                          std.error = "Std. Error",
                          statistic = "T.Value",
                          p.value = "P.Value")
  
  # Adjust the table width to avoid overflow in PDF, use `opts_pdf` to set row height
  ft <- set_table_properties(ft, layout = "autofit", align = "center", opts_pdf = list(arraystretch = 1))

  # Return the flextable
  return(ft)
}
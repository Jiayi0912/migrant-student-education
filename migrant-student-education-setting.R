
## apa theme
theme_apa <- function(...) papaja::theme_apa(...)

## define plot palette
palette_apa <- c("#56B4E9", "#009E73")

## define a function that can compute formatted table reporting regression results
report_reg <- function(model) {
  
  # Extract coefficients and p-values
  m_glance <- glance(model)
  # Format the p-value
  p_value <- apa_p(m_glance$p.value, add_equals = TRUE)
  # Create a string with the results
  report <- paste0("$F$(", 
                   m_glance$df, 
                   ", ", m_glance$df.residual, 
                   ") = ", round(m_glance$statistic, 3), 
                   ", $p$ = ", p_value, ", $R^2$ = ", round(m_glance$r.squared, 3))
  
  return(report)    
  
}
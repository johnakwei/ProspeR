##################################################
##################################################
##
## AccountSummary.R
##
##################################################
##################################################

# Accesses the user's account and return the summary data.
# The data points include available cash, total account balance,
# and the number of notes in the portfolio.

Accounts <- function(searchURL){
  r <- GET("https://api.prosper.com/v1/summary")
  
  parsed <- fromJSON(content(r, "text", encoding="UTF-8"),
                     simplifyVector = TRUE)
  
  if (httr::http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message, parsed$documentation_url
    ), call. = FALSE)}
  
  parsed <- {y <- unlist(parsed)
  data.frame("Field"= names(y), "Value"= as.character(y),
             stringsAsFactors = F, row.names = NULL)}
  
  structure(list(content = parsed, response = r),
            class = "Prosper_API")
}

# Example
#
# Accounts <- Accounts()
# print(Accounts)

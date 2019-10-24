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
  searchURL <- paste0(searchURL, "/", "summary", sep="")
  
  r <- GET(searchURL,
           add_headers("Accept": "application/json",
                       "Authorization": "bearer",
                       oauthToken.access_token))
  
  if(httr::status_code(r)!=200){
    stop("Prosper API request failed")}
  
  parsed <- fromJSON(content(r, "text", encoding="UTF-8"),
                     simplifyVector = TRUE)
  
  if (httr::http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message, parsed$documentation_url
    ), call. = FALSE)
  }
  
  parsed <- {y <- unlist(parsed)
  data.frame("Field"= names(y), "Value"= as.character(y),
             stringsAsFactors = F, row.names = NULL)
  }
  
  structure(list(content = parsed, response = r),
            class = "Prosper_API")
}

# Example
#
# Prosper_Base_Address <- "https://api.prosper.com/v1"
# clientID <- "b7cdc9351d6d41c984bca165f00dd52e"
# auth <- "1098273"
# Accounts <- Accounts(Prosper_Base_Address, clientid, auth)
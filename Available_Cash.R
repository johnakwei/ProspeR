##################################################
##################################################
##
## Available_Cash.R
##
##################################################
##################################################

# Retrieves the available cash in the user's account. Cash 
# committed to open buy orders is excluded from the total.

Available_Cash <- function(){
  r <- GET(paste0("https://api.prosper.com/v1/accounts/prosper/",
                  "?", "filters=AVAILABLE_CASH", sep=""))
  
  if (httr::http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message,
                 parsed$documentation_url),
         call. = FALSE)
  }
  content(r)
}

# Example
# Available_Cash()
##################################################
##################################################
##
## Loans.R
##
##################################################
##################################################

# Listing of all loans on the primary market
#
# showAll (logical), indicates whether all loans should be retured.
# Use FALSE to limit the results to those loans listed in the most recent
# listing period.

Loans <- function(showAll=TRUE){
  searchURL <- "https://api.prosper.com/v1/loans/"
  r <- GET(searchURL, query=list("showAll" = showAll))
  
  if (httr::http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message,
                 parsed$documentation_url),
         call. = FALSE)
  }
  
  r
}

# Example
# All_Loans <- Loans()
# print(All_Loans)

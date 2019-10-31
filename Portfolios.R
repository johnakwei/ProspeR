##################################################
##################################################
##
## Portfolios.R
##
##################################################
##################################################

# Downloads a dataframe of all portfolios owned by the investor.

Portfolios <- function(){

  r <- GET("https://api.prosper.com/v1/accounts/prosper/portfolios")
  
  if (http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message, parsed$documentation_url
    ), call. = FALSE)
  }
  
  content(r)
}

# Example
#
# PortfolioList <- Portfolios()
# print(PortfolioList)

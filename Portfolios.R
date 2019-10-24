##################################################
##################################################
##
## Portfolios.R
##
##################################################
##################################################

# Listing of investor's portfolios

# Provides a dataframe of all portfolios owned by the investor.

Portfolios <- function(){
  searchURL <- paste0("https://api.prosper.com/v1/accounts/prosper/",
                      "?", "portfolios", sep="")
  r <- GET(searchURL)
  r
}

# Example
# Portfolios()
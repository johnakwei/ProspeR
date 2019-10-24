##################################################
##################################################
##
## Create_Portfolio.R
##
##################################################
##################################################

# Create a new portfolio
#
# Create a new portfolio to assign loans to. Notes can be assigned to
# a portfolio using the API when they are purhcased from the primary
# market.
#
#  port_name String. Name of the new portfolio
#  port_desc String. Portfolio description

Create_Portfolio <- function(investorID, port_name,
                             port_desc, authKey){
  postURL <- paste0(investorID,"portfolios")
  params <- list("actorId" = investorID,
                 "portfolioName" = port_name,
                 "portfolioDescription" = port_desc)
  resp <- POST(postURL, params, authKey)
}

# Example
#
# clientid <- "<prosper api key>"
# portfolio_name <- "<portfolio name>"
# portfolio_desc <- "<portfolio description>"
# auth <- "<prosper api authorization key>"
# Create_Portfolio(clientid, portfolio_name,
#                  portfolio_desc, auth)
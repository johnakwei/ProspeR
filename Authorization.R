##################################################
##################################################
##
## Authorization.R
##
##################################################
##################################################

# A wrapper to obtain the authorization key for
# access to the Prosper API.
# "authURL", the prosper.com authorization url
# "AuthHeader", authorization header from "AuthHeader()"
# "data", a list created with the "AuthData()"
# "auth", a prosper authorization key from "RequestToken.R"

Authorization <- function(authURL, authKey){
  response <- POST(authURL, encode="json",
                   add_headers("Accept": "application/json",
                               "Authorization": "bearer",
                               oauthToken.access_token))
  response
}


# Example
#
# Prosper_Base_Address <- "https://api.prosper.com/v1/"
# auth <- "<authoriztion key>"
# Authorization(Prosper_Base_Address, auth)

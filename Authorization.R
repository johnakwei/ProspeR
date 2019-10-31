##################################################
##################################################
##
## Authorization.R
##
##################################################
##################################################

# A function to obtain the authorization key for access to the Prosper API.
# "authKey", a prosper authorization key from "RequestToken.R"

Authorization <- function(authKey){
  response <- POST(paste0("https://api.prosper.com/v1/", authKey, sep = ""))
  
  if (httr::http_error(response)) {
    stop(sprintf("Authorization failed [%s]\n%s\n<%s>",
                 status_code(response), parsed$message, parsed$documentation_url
    ), call. = FALSE)}
  
  response
}


# Example
#
# auth <- "<authoriztion key>"
# AuthoriztionKey <- Authorization(authKey)

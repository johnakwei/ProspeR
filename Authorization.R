##################################################
##################################################
##
## Authorization.R
##
##################################################
##################################################

# A function to obtain the authorization key for access to the Prosper API.
# "authKey", a prosper access token from "Token_Request.R"

Authorization <- function(tokenKey){
  
  access_token <- content(tokenKey)$access_token
  
  authorization.header <- paste('bearer', access_token)
  
  response <- GET(paste0("https://api.prosper.com/v1/accounts/prosper/",
                          tokenKey, sep = ""),
                  add_headers('accept'= 'application/json',
                              'content-type'= 'application/x-www-form-urlencoded',
                              'Authorization'= authorization.header),
                  query = list(offset='25', limit=10))
  
  if (httr::http_error(response)) {
    stop(sprintf("Authorization failed [%s]\n%s\n<%s>",
                 status_code(response), parsed$message, parsed$documentation_url
    ), call. = FALSE)}
  
  content(response)
}


# Example
#
# token <- "<token key>"
# AuthoriztionKey <- Authorization(token)

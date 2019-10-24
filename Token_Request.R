##################################################
##################################################
##
## Token_Request.R
##
##################################################
##################################################

# A function to obtain the token for Prosper API authorization.

# "requestURL", the prosper.com authorization url, i.e.
# "https://api.prosper.com/v1/accounts/prosper/"
# "requestHeader", the request header from "Access_Header()"
# "data", a dataframe created with "Access_Data()"

Token_Request <- function(requestURL, requestHeader, data){
  prosper_endpoints <- oauth_endpoint(NULL, "authorize",
                                      "accessToken",
                                      base_url = requestURL)
  prosper_app <- oauth_app("prosper_endpoints",
                           key = data[[1]]$client_id,
                           secret = data[[1]]$client_secret)
  prosper_token <-  oauth2.0_token(prosper_endpoints,
                                   prosper_app,
                                   config_init = requestHeader,
                                   user_params = data[[1]])
  
  if(status_code(prosper_token)!=200){
    stop("Failed to auth", status_code(prosper_token))}
  
  parsed <- fromJSON(content(prosper_token,
                             "text", encoding="UTF-8"),
                     simplifyVector = TRUE)
  
  if(httr::http_error(prosper_token)) {
    stop(sprintf(
      "Prosper API authization request failed [%s]\n%s\n<%s>",
      status_code(prosper_token), parsed$message,
      parsed$documentation_url),
      call. = FALSE)
  }
  
  structure(list(content = parsed, response = prosper_token),
            class = "Prosper_API")
}

# Example
#
# Request_URL <- 'https://api.prosper.com/v1/security/oauth/token'
# header <- Access_Header()
# clientid <- "<prosper.com client id>"
# clientsecret <- "<prosper.com client secret>"
# clientusername <- "<prosper.com username>"
# clientpassword <- "<prosper.com password>"
# data <- AccessData(clientid, clientsecret,
#                    clientusername,
#                    clientpassword)
# Token_Request(Request_URL, header, data)
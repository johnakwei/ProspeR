##################################################
##################################################
##
## Token_Request.R
##
##################################################
##################################################

# A function to obtain the token for Prosper API authorization.

# "requestURL", the prosper.com token request url, i.e. "https://api.prosper.com/v1/security/oauth/token"
# "requestHeader", the request header from "Access_Header()"
# "data", a dataframe created with "Access_Data()"

Token_Request <- function(requestURL, requestHeader, data){
  prosper_endpoints <- oauth_endpoint(NULL, "authorize", "accessToken",
                                      base_url = requestURL)
  prosper_app <- oauth_app("prosper_endpoints", key = data[2],
                           secret = data[3])
  prosper_token <-  oauth2.0_token(prosper_endpoints, prosper_app,
                                   config_init = requestHeader,
                                   user_params = data)
  
  if(status_code(prosper_token)!=200){
    stop("Prosper API Token Request Failed", status_code(prosper_token))}
  
  parsed <- fromJSON(content(prosper_token, "text", encoding="UTF-8"),
                     simplifyVector = TRUE)
  
  structure(list(content = parsed, response = prosper_token),
            class = "Prosper_API")
}

# Example
#
# Request_URL <- "https://api.prosper.com/v1/security/oauth/token"
# header <- Access_Header()
# clientid <- "<prosper.com client id>"
# clientsecret <- "<prosper.com client secret>"
# clientusername <- "<prosper.com username>"
# clientpassword <- "<prosper.com password>"
# payload <- AccessData(client_id, client_secret, username,
#                    password)
#
# AuthorizationKey <- Token_Request(Request_URL, header, payload)

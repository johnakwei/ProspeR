##################################################
##################################################
##
## Token_Request2.R
##
##################################################
##################################################

# A function to obtain the token for Prosper API authorization.

# "requestURL", the prosper.com token request url, i.e. "https://api.prosper.com/v1/security/oauth/token"
# "requestHeader", the request header from "Access_Header()"
# "data", a dataframe created with "Access_Data()"

Token_Request2 <- function(requestURL, requestHeader, data){
  
  # API Call to get the access token
  prosper_token <- POST(
    url = auth.url,
    add_headers(.headers = c('accept'= 'application/json',
                             'content-type'= 'application/x-www-form-urlencoded')),
    query = list(grant_type=data[1],
                 client_id=data[2],
                 client_secret=data[3],
                 username=data[4],
                 password=data[5]))
  
  if(status_code(prosper_token)!=200){
    stop("Prosper API Token Request Failed",
         status_code(prosper_token))}
  
  prosper_token
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
# TokenKey <- Token_Request2(Request_URL, header, payload)

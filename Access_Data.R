##################################################
##################################################
##
## Access_Data.R
##
##################################################
##################################################

# AccessData function
Access_Data <- function(investorID, investorSecret,
                        prosperUsername, prosperPassword){
  data <- toJSON(data.frame(list(
    grant_type='password',
    client_id=investorID,
    client_secret=investorSecret,
    username=prosperUsername,
    password=prosperPassword
  )))
  data
}

# Example
# payload <- Access_Data(clientid, clientsecret,clientusername,
#                        clientpassword)
# payload
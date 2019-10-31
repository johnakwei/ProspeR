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
  data <-  list(grant_type='password',
                client_id=investorID,
                client_secret=investorSecret,
                username=prosperUsername,
                password=prosperPassword)
  data
}

# Example
# payload <- Access_Data(client_id, client_secret,username,
                       # password)
# payload

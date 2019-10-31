##################################################
##################################################
##
## Pending_Transfers.R
##
##################################################
##################################################

# Obtains a list of the investor's pending transfers from prosper.com.
# "authKey" is the authorization key from "Token_Request()".

Pending_Transfers <- function(authKey){
  searchURL <- paste0("https://api.prosper.com/v1/accounts/prosper/",
                      "?", "funds/pending", sep="")
  
  r <- GET(searchURL, add_headers("Accept": "application/json",
                       "Authorization": "bearer ", authKey))
  
  if (http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r), parsed$message, parsed$documentation_url
    ), call. = FALSE)
  }
  
  parsed <- fromJSON(content(r, "text", encoding="UTF-8"),
                    simplifyVector = TRUE)
  
  parsed <- {y <- unlist(parsed)
  data.frame("Field"= names(y), "Value"= as.character(y),
             stringsAsFactors = F, row.names = NULL)}
  
  structure(list(content = parsed, response = r),
            class = "Prosper_API")
}

# Example
#
# auth <- "<prosper api authentication key>"
# PendingTransfers <- Pending_Transfers(auth)
# print(PendingTranfers)

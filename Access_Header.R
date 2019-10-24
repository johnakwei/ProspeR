##################################################
##################################################
##
## Access_Header.R
##
##################################################
##################################################

library(httr)
library(jsonlite)

# Create Prosper authorization headers
Access_Header <- function(){
  headers <- gsub("\\[|\\]", "",
                  toJSON(data.frame(Accept='application/json',
                                    `Content-Type` = 'application/json')))
  headers
}

# Example
# header <- Access_Header()
# header
# {"accept":"application/json","Content.Type":"application/x-www-form-urlencoded"}

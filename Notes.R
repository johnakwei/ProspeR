##################################################
##################################################
##
## Notes.R
##
##################################################
##################################################

# Report of the investor's notes owned

Notes <- function(){
  r <- GET("https://api.prosper.com/v1/notes")
  
  if (httr::http_error(r)) {
    stop(sprintf("Prosper API request failed [%s]\n%s\n<%s>",
                 status_code(r),parsed$message, parsed$documentation_url),
         call. = FALSE)
  }
  content(r)
}

# Example
# Notes()
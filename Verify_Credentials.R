##################################################
##################################################
##
## Verify_Credentials.R
##
##################################################
##################################################

Check_Header <- function(x = NULL){
  
  # If "header" is null, then a value was not passed in
  # the calling function. If it isn't null, then return it.
  
  if(!is.null(x)) {
    return(x)
  } else {
    stop("Please create the header object using the AccessHeader() function",
         call.= FALSE)
  }
  
  # If header is null, then check if it exists in the global
  # environment
  
  if (!exists("header", envir= .GlobalEnv)){
    stop("Please create the header object using the AccessHeader() function",
         call.= FALSE)
  }
  get("header")
}

# Example
# Check_Header(header)

Check_Data <- function(x = NULL){
  
  # If data is null, then a value was not passed in the calling
  # function. If it isn't null, then return it.
  
  if(!is.null(x)) {
    return(x)
  } else {
    stop("Please create the data object using the AccessData() function",
         call.= FALSE)
  }
  
  # If data is null, then check if it exists in the global environment
  
  if (!exists("data", envir= .GlobalEnv)){
    stop("Please create the data object using the AccessData() function",
         call.= FALSE)
  }
  get("data")
}

# Example
# Check_Data(data)

##################################################
##################################################
##
## Orders.R
##
##################################################
##################################################

# Submit a new investment order

SubmitOrder <- function(loanId, amount){
  postURL <- "https://api.prosper.com/v1/orders/"
  orders <- data.frame("loanId" = loanId,
                       "requestedAmount" = amount)
  
  orders <- as.data.frame(cbind(orders, portfolioId),
                          stringsAsFactors=F)
  
  params <- list("aid" = investorID, "orders"= orders)
  resp <- POST(postURL, params)
}

# Example
#
# loan_id <- "<prosper loan id>"
# SubmitOrder(loan_id, amount=25)

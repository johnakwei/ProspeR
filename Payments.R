##################################################
##################################################
##
## Payments.R
##
##################################################
##################################################

# The payments API allows you to retrieve your prosper.com payment history
# on a single loan, or a list of loans that you own. If you
# have purchased a Note on the loan, the payments API will
# return historical payment history on your pro-rata portion
# of the loan. The payments API returns all payments in historical order in
# which the loan payments have been made. If you pass in multiple
# loan numbers as query parameters to the API, you will receive
# payments made to the loans in historical order.

# GET /loans/payments/?loan_number={loan_number}
# GET /loans/payments/?loan_number={loan_number1},{loan_number2},{loan_number3}

Payments <- function(showAll=TRUE){
  searchURL <- "https://api.prosper.com/v1/loans/payments/"
  result <- GET(searchURL, query=list("showAll" = showAll))
  result
}

# Example
#
# Payment_History <- Payments(showAll=TRUE)
# print(Payment_History)

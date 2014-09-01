rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  setwd("C:/git/ProgrammingAssignment3")
  d <-read.csv("outcome-of-care-measures.csv",colClasses="character") #start w/out colClasses="character"
  #d <-read.csv("sample.csv",colClasses="character") #start w/out colClasses="character"
  
  ## Check that state and outcome are valid
  sl <- d[,7]
  if (sum(state == sl) == 0) { stop("invalid state")}
  #else { print("OK state")}
  
  ocname <- c("heart attack" = 11, "heart failure" =17 ,"pneumonia" = 23)
  
  if (sum(outcome == names(ocname)) == 0) {stop("invalid outcome")}
  #else {print("OK outcome")}
  
  # Get the column number from the input name
  colnbr <- as.numeric(ocname[outcome])

  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  ## split the data frame d by state list
  sd <- split(d,sl)  # list of lists of length 1 containing data.frames
  ss <- (sd[[state]]) ## get at the data frame at the bottom
  
  # Get the death rates for this state
  ss[,colnbr] <- as.numeric(ss[,colnbr])
  rates <- (sort(as.numeric(ss[,colnbr])))
  
  # Figure out "best" and "worst" and test num
  if (num == "best") { num <- 1}
  if (num == "worst") {num <- length(rates)}
  if (num > length(rates)) { return(NA)} # bail out if we are out of range
  if (num <= 0 || !is.numeric(num)) {stop("invalid rank")}
  rank <- rates[num]
  result <- subset(ss[,2], ss[,colnbr] == rank)
  result = sort(result)
  result[1]
}
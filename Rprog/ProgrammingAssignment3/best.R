best <- function(state, outcome) {
  ## Read outcome data
  setwd("C:/git/ProgrammingAssignment3")
  d <-read.csv("outcome-of-care-measures.csv",colClasses="character") #start w/out colClasses="character"
  #d <-read.csv("sample.csv",colClasses="character") #start w/out colClasses="character"
  
  ## Check that state and outcome are valid; make a state list for splitting later
  sl <- d[,7]
  if (sum(state == sl) == 0) { stop("invalid state")}
  #else { print("OK state")}
  
  ocname <- c("heart attack" = 11, "heart failure" =17 ,"pneumonia" = 23)
  
  if (sum(outcome == names(ocname)) == 0) {stop("invalid outcome")}
  #else {print("OK outcome")}
  
  # Get the column number from the input name
  colnbr <- as.numeric(ocname[outcome])
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  ## split the data frame d by state list
  sd <- split(d,sl)  # list of lists of length 1 containing data.frames
  ss <- (sd[[state]]) ## get at the data frame at the bottom
  minval <- min(as.numeric(ss[,colnbr]),na.rm=TRUE)
  test <- ss[,colnbr] == minval
  result <- subset(ss[,2], test)
  result <- sort(result)
  # Handle duplicates by sorting
  result[1]
}
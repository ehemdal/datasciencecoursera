rankall <- function(outcome, num = "best") {
  ## Read outcome data
  setwd("C:/git/ProgrammingAssignment3")
  d <-read.csv("outcome-of-care-measures.csv",colClasses="character") 
  #d <-read.csv("test.csv",colClasses="character") #start w/out colClasses="character"
  
  ## Check that outcome is valid and get a list of states from the data
  ocname <- c("heart attack" = 11, "heart failure" = 17 ,"pneumonia" = 23)
  if (sum(outcome == names(ocname)) == 0) {stop("invalid outcome")}
  # else {print("OK outcome")}
  
  # check num for "best" and numeric, do "worst" later
  if (num == "best") { count <- 1}
  if (num <= 0) {stop("invalid rank")}
  
  sl <- d[,7]
  # Get the column number from the input name
  colnbr <- as.numeric(ocname[outcome])
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  ## Get into vector form
  sd <- split(d,sl)  # list of lists of length 1 containing data.frames
  states <- unique(sl) # use to get unique state codes to loop over
  #loop over the list of data frames
  hospital <- NULL
  state <- NULL
  for (i in seq(along=states)) {
    #print(i)
    ss <- (sd[[states[i]]]) ## get at the data frame at the bottom
    
    # Get the death rates for this state
    ss[,colnbr] <- as.numeric(ss[,colnbr])
    rates <- (sort(as.numeric(ss[,colnbr])))
    # set the count right
    if (num == "best") { count <- 1}
    if (num == "worst") {count <- length(rates)}
      else { count <- num }
    if (count > length(rates)) {
      # This is the NA case
      hospital <- c(hospital, "<NA>")
      state <- c(state, states[i])
      next
      } # bail out if we are out of range
    rank <- rates[count]
    result <- subset(ss[,2], ss[,colnbr] == rank)
    result = sort(result)
    hospital <- c(hospital, result[1])
    state <- c(state,states[i])
  }
  
  # Now put together the answer data frame
  answer <- data.frame(hospital, state, row.names = state)
  answer

}
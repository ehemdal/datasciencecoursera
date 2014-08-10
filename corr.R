corr <- function(directory ="specdir", threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ## Strategy:
  #  Use complete.R to get a data frame with the count of complete cases.
  #  Traverse that data frame to get at the files that have the data we need
  #  Use cor() to do the work
  #  
  #  Assumes you are in the parent of directory
  
  # Get to the right directory
  olddir <- getwd()
  setwd(directory)

  # Find the sites with complete cases higher than threshold
  cases <- complete(directory) #relies on the default for id
  cases <- subset(cases, cases[,"nobs"] > threshold)
  
  # Format filenames to open
  # Get id's to look at
  ids <- as.vector(cases[,"id"])
  fns <- formatC(ids, width = 3, format = "d", flag = "0")
  fns <- paste(fns, ".csv", sep = "")

  # Work on each file
  for (file in fns){
    d <- read.csv(file)
    d <- d[complete.cases(d),]
    x <- as.vector(d[,"nitrate"])
    y <- as.vector(d[,"sulfate"])
    if(exists("res")) {res <- signif(c(res,cor(x,y)),4)}
       else {res <- signif(cor(x,y),4)}
       
    
  }
  
  # Do correlations
  
  setwd(olddir)
  return(res)
}
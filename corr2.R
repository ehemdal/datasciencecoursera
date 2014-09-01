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

    id <- 1  #:332
    
    #Set default variables
    if (directory == "") directory <- "specdata"
    debug <- 0
    
    # Format filenames
    fn <- formatC(id, width = 3, format = "d", flag = "0")
    filename <- paste(fn, ".csv", sep ="")
    
    # Set up directories
    olddir <- getwd()
    setwd("C:/DataScience/") 
    setwd(directory)
    
    # Loop over all the id's, and for each:
    for (site in 1:length(id)) {
      if (debug == 1) print( site)
      
      # Read  the file into a data frame
      
      d <- read.csv(filename[site])
      if (debug == 2) print(d)
      
      # Count the complete cases and add to the data frame
      n <- sum(complete.cases(d))
      if (n < threshold) next
      
      # Now go calculate the correlation
      x <-d[,"nitrate"]
      x <-x[complete.cases(d)]
      y <-d[,"sulfate"]
      y <-y[complete.cases(d)]
      
      cor(x,y)
          
    }
    
    
    setwd(olddir)
    return()
  }
  

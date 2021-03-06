complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
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
    if(!exists("res")) {
      res <-data.frame(id = id[site], nobs = n)
    }
    else {res <- (rbind(res, c(id = id[site], nobs = n)))}
    
    
  }
    

  setwd(olddir)
  return(res)
}

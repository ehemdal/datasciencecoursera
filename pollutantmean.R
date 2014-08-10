pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Note: Specification of the directory presumes that it is just below
  ## the CWD; no effort has been made to do anything fancier
  
  # Strategy:
  # Loop over all the id's, and for each:
  # Build a filename to read from directory, id and ".csv"
  # Read the file into a data frame
  # Subset the data frame by pollutant
  # Add the data to a vector of data points
  # After looping over all the means, return the mean of this vector.
  # Call mean(vector, na.rm=TRUE)  
  
  #Set default variables
  if (directory == "") directory <- "C:/DataScience/specdata/"
  debug <- 0
  
  # Format filenames
  id <- formatC(id, width = 3, format = "d", flag = "0")
  
  if (debug == 1) print("Debugging started") 
  # Loop over all the id's, and for each:
  for (site in id) {
    if (debug == 1) print( site)
    
    # Build a filename to read from directory, id and ".csv"
    filename <- paste(site, ".csv", sep = "")
    if (debug == 1) print(filename)

    # Read the file into a data frame
    olddir <- getwd()
    setwd("C:/DataScience/") 
    setwd(directory)
    d <- read.csv(filename)
    if (debug == 2) print(d)
    # Subset the data frame by pollutant
    subset <- d[,pollutant]
    subset <- subset[!is.na(subset)]
    
    # Add the data to a vector of data points 
    if(exists("datav") == TRUE) {
      datav <- c(datav, subset)
    }
    else {
      datav <- subset # first time through only
    } 
  }
    
  # Cleanup
  setwd(olddir)
  return(round(mean(datav, rm.na = TRUE),3)) #sample results rounded to 3 places
}
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
  debug <- 2
  
  if (debug == 1) print("Debugging started") 
  # Loop over all the id's, and for each:
  for (site in id) {
    if (debug == 1) print( site)
    
    # Build a filename to read from directory, id and ".csv"
    # Fix the site to be 3 chars long
    if (site < 10) site <- paste("00", site, sep = "")
    else if (site < 99) site <- paste("0", site)
    filename <- paste(site, ".csv", sep = "")
    if (debug == 1) print(filename)

    # Read the file into a data frame
    olddir <- getwd()
    setwd(directory)
    d <- read.csv(filename)
    if (debug == 2) print(d)
  }

}
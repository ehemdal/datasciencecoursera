# run_analysis.R

# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Here are the data for the project: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 

# Obtain the data, unless we already have it
# Grab our current WD, and save it; then go to the chosen work directory so 
# that we'll leave the WD where it started
oldWD <- getwd()
setwd("C:/git/datasciencecoursera/GetCleanData")
if (!file.exists("rawdata.zip")) {
  setInternet2(TRUE)
  sourceurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destfile <-"./rawdata.zip"
  download.file(url = sourceurl, destfile = destfile, method = "internal", mode = "wb")
} else {
  print("File already exists in directory, not downloading.")
}

# Unzip the rawdata.zip file, if necessary
print("Unzipping the raw data.")
unzip(destfile)
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Cleanup
setwd(oldWD)

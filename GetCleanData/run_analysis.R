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
if (!file.exists("UCI HAR Dataset")) {
print("Unzipping the raw data.")
unzip(destfile)
} else {
  print ("Dataset already unzipped.")
}
# Merges the training and the test sets to create one data set.
  # 1) Get the activity labels and features
    setwd("UCI HAR Dataset")
    activities <- read.table("activity_labels.txt")
    activities <- as.vector(activities$V2)
    features <- read.table("features.txt")
    features <- as.vector(features$V2)
  # 2) Read the test dataset into td
    setwd("test")
    # td is a data.frame holding the test data with activity numbers in first col.
    data <- read.table("X_test.txt")
    acts <- read.table("y_test.txt")
    testd <- cbind(acts,data)

  # 3) Read the training dataset into traind; remove data and acts when done
    setwd("../train")
    data <- read.table("X_train.txt")
    acts <- read.table ("y_train.txt")
    traind <- cbind(acts,data)
    rm(acts,data)

  # 4) Combine the two datasets 
  #    Add column names
  #    Change first column to descriptive activity names
    data <- rbind(testd, traind)
    rm(testd, traind)
    vars <- c("Activity", as.vector(features))
    colnames(data) <- vars
    for(i in 1:nrow(data)){
      index <- as.integer(data[i,1])
      data[i,1] <- activities[index]
    }
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Cleanup - run this after the rest is working OK
#setwd(oldWD)
return()


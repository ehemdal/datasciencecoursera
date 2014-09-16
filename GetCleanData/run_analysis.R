# run_analysis.R
library(dplyr)
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

  # 2) Read the test dataset into data
    setwd("test")
    # testd is a data.frame holding the test data with activity numbers in first col.
    data <- read.table("X_test.txt")
    acts <- read.table("y_test.txt")
    subjects <- read.table("subject_test.txt")
    testd <- cbind(subjects,acts,data)

  # 3) Read the training dataset into traind; remove data and acts when done
    setwd("../train")
    data <- read.table("X_train.txt")
    acts <- read.table ("y_train.txt")
    subjects <- read.table("subject_train.txt")
    traind <- cbind(subjects,acts,data)
    rm(subjects,acts,data)

  # 4) Combine the two datasets 
  #    Add column names
  #    Change first column to descriptive activity names
    data <- rbind(testd, traind)
    rm(testd, traind)
    vars <- c("Subject_ID","Activity", as.vector(features))
    colnames(data) <- vars
    for(i in 1:nrow(data)){
      index <- as.integer(data[i,2])
      data[i,2] <- activities[index]
    }

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   
  data2 <- tbl_df(data)
  rm(data) # save space
  data3 <- group_by(data2, Subject_ID, Activity)

# next steps: make sure group_by is OK and figure out summarize() from dplyr
  
# Go pull out the right columns
# Cleanup - run this after the rest is working OK
setwd(oldWD)
return()


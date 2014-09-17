---
title: "CodeBook.md"
author: "Erik Hemdal"
date: "Tuesday, September 16, 2014"
output: html_document
---

# Introduction
This is a data cleanup project for the course "Getting and Cleaning Data" at 
Johns Hopkins University.

I acknowledge use of this original data:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

# The Original data

The dataset was created from the original data, which is described here and which I have provided verbatim from the original codebook.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

# The Modified Dataset

The R script run_analysis.R performs the following actions:

- 1) Downloads the raw data to directory "C:/git/datasciencecoursera/GetCleanData", unless the dataset is already downloaded.
- 2) Unzips the resulting .ZIP file, which populates the UCI HAR Dataset subdirectory, unless the subdirectory already exists.
- 3) Uses the provided activity labels and subject ID's to reconstruct these items for both the test and training datasets.  It then combines the two datasets, using rbind(), because the two sets were originally created by randomly extracting records from the starting data.
- 4) Extracts the variables related to mean and standard deviation by dropping columns that do not include "std()" and "mean()" in the column names. 
- 5) Replaces the activity numbers with the Activity names.
- 6) Calculates the means of the subsets of each variable found by filtering on Subject_ID and Activity.
- 7) Writes the resulting dataset to a file tidy_avg.txt in the working directory c:/git/datasciencecoursera using data.table().

# THe Variables:

"Subject_ID": The identification number for each test subject, an integer value from 1 to 30.

"Activity": Activity names from the following list: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS" "SITTING", "STANDING", "LAYING"       

"tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" 
"tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" 
"tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" 
"tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" 
"tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" 
"tBodyAccMag-mean()" "tGravityAccMag-mean()" "tBodyAccJerkMag-mean()" 
"tBodyGyroMag-mean()" "tBodyGyroJerkMag-mean()" 
"fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" 
"fBodyAcc-meanFreq()-X" "fBodyAcc-meanFreq()-Y" "fBodyAcc-meanFreq()-Z" 
"fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" 
"fBodyAccJerk-meanFreq()-X" "fBodyAccJerk-meanFreq()-Y" "fBodyAccJerk-meanFreq()-Z" 
"fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" 
"fBodyGyro-meanFreq()-X" "fBodyGyro-meanFreq()-Y" "fBodyGyro-meanFreq()-Z" 
"fBodyAccMag-mean()" "fBodyAccMag-meanFreq()" "fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-meanFreq()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroMag-meanFreq()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-meanFreq()" 

"tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" 
"tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" 
"tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" 
"tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" 
"tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" 
"tBodyAccMag-std()" "tGravityAccMag-std()" "tBodyAccJerkMag-std()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-std()" 
"fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" 
"fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" 
"fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" 
"fBodyAccMag-std()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-std()" 
"fBodyBodyGyroJerkMag-std()"


    ===================================================================================================================                                                Getting and Cleaning Data: Course Project
    ===================================================================================================================
Using a source data set obtained from 'Human Activity Recognition Using Smartphones created by Davide Anguita et al., 2012', a tidy data set that estimated the mean and standard deviation of human activity measurements has been created and saved at tidy_data.txt. Human Activity Recognition Using Smartphones, was initially an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years, where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.For each record it is provided:

- Triaxial (3 axis) acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The zip file containing the source data is located at:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S II smartphone was retrieved, cleaned, merged, and transformed to get a tidy data that can be used for later analysis.

key steps of this project are the following:
• Source data were downloaded and unzipped, and read in R.
• The training and test sets were merged to create one data set.
• Only the measurements on the mean and standard deviation for each measurement have been extracted.
• Integer-coded activity identifiers (1-6) were replaced with descriptive activity names.
• The variable names were replaced with descriptive variable names.
• Finally, an independent tidy data set with the mean and standard deviation of each variable for each activity and each                subject has been created

This repository contains the following files:

README.md: this file provides an overview of the source data set, and how the final tidy data set was created.
CodeBook.md: describes the contents of the data set (data, variables and transformations used to generate the data).
run_analysis.R: this is the R script used to create the final tidy data set
tidy_data.txt: this is the final tidy data set obtained from the source data.


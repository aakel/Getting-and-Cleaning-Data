
##  Getting and Cleaning Dtata: Course Project
##  This script is intended to create a tidy data set named 'tidy_data.txt' using a source data from 
##  "Human Activity Recognition Using Smartphones Dataset, by Davide Anguita et al., 2012)
##  The link to this source data set is provided in the 'ReadMe.md' and 'Code Book' sections of the repository


# 1. Download the source data
################################

library(dplyr)

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
File <- "UCI HAR Dataset.zip"

if (!file.exists(File)) {
        download.file(Url, File, mode = "wb")
}

# unzip file 
filepath <- "UCI HAR Dataset"
if (!file.exists(filepath)) {
        unzip(File)
}

# 2. Reading the data into R
#############################

# Training data
trainSubjects <- read.table(file.path(filepath, "train", "subject_train.txt"))
trainValues <- read.table(file.path(filepath, "train", "X_train.txt"))
trainActivity <- read.table(file.path(filepath, "train", "y_train.txt"))

# Test data
testSubjects <- read.table(file.path(filepath, "test", "subject_test.txt"))
testValues <- read.table(file.path(filepath, "test", "X_test.txt"))
testActivity <- read.table(file.path(filepath, "test", "y_test.txt"))

# Features
features <- read.table(file.path(filepath, "features.txt"), as.is = TRUE)

# Activity labels
activities <- read.table(file.path(filepath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

# 3. Merge the training and test data sets 
##########################################
train <- cbind(trainSubjects, trainValues, trainActivity)
test <-  cbind(testSubjects, testValues, testActivity)

mergeddata <- rbind(train, test)
colnames(mergeddata) <- c("subject", features[, 2], "activity")


# 4. Extract only the measurements on the mean and standard deviation  for each measurement
##########################################################################################

# sub-setting only the mean and Std measurements
data_MeanStd <- grepl("subject|activity|mean|std", colnames(mergeddata))
mergeddata <- mergeddata[, data_MeanStd]

# 5. Use descriptive activity names to name the activities in the data set
##########################################################################
mergeddata$activity <- factor(mergeddata$activity, 
                                 levels = activities[, 1], labels = activities[, 2])

# 6. Label the data set with descriptive variable names
#######################################################

# Column names
mergeddataCols <- colnames(mergeddata)
mergeddataCols <- gsub("[\\(\\)-]", "", mergeddataCols) ## remove unnecessary characters

# use descriptive variable names
mergeddataCols <- gsub("^t", "time", mergeddataCols)
mergeddataCols <- gsub("^f", "frequency", mergeddataCols)
mergeddataCols <- gsub("Acc", "Accelerometer", mergeddataCols)
mergeddataCols <- gsub("Gyro", "Gyroscope", mergeddataCols)
mergeddataCols <- gsub("Mag", "Magnitude", mergeddataCols)
mergeddataCols <- gsub("Freq", "Frequency", mergeddataCols)
mergeddataCols <- gsub("mean", "Mean",mergeddataCols)
mergeddataCols <- gsub("std", "StandardDeviation", mergeddataCols)

# Remove redundent variable description
mergeddataCols <- gsub("BodyBody", "Body", mergeddataCols)
colnames(mergeddata) <- mergeddataCols

# 6. Creating the final tidy data set
#####################################
tidydata <- mergeddata %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

# write tidydata to a file name "tidy_data.txt"
write.table(tidydata, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)









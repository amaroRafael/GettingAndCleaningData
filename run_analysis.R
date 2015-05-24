## Coursera course: "Getting and CLeaning Data"
## Author: Rafael Luis Neves Amaro
## Date: 5/24/15
## This script takes data from UCI HAR and provides a tidy data set with averages for mean
## and standard deviation for each subject and activity

##
##
## Download and extract the files
##
###############################################################################

## load libraries

allPackages <- installed.packages()
list <- allPackages[,1]

if (!is.element("dplyr", list)) {
    install.packages("dplyr")
}
library(dplyr)

if (!is.element("stringr", list)) {
    install.packages("stringr")
}
library(stringr)

##
##
## Download data into a data folder and unzip data
##
###############################################################################

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "./UCI_HAR_Dataset.zip"
dataDirectory <- "./UCI HAR Dataset"

if (!file.exists(zipFile)) { 
    download.file(fileURL, destfile = zipFile) 
}
rm(fileURL)

## unzip the file
if (!file.exists(dataDirectory)) { 
    unzip(zipFile, exdir = "./") 
}
rm(zipFile)


## assigning variables to the files
train.Sub    <- "UCI HAR Dataset/train/subject_train.txt"
train.Labels <- "UCI HAR Dataset/train/y_train.txt"
train.Values <- "UCI HAR Dataset/train/X_train.txt"

test.Sub     <- "UCI HAR Dataset/test/subject_test.txt"
test.Labels  <- "UCI HAR Dataset/test/y_test.txt"
test.Values  <- "UCI HAR Dataset/test/X_test.txt"

activities  <- "UCI HAR Dataset/activity_labels.txt"
features    <- "UCI HAR Dataset/features.txt"


existingFiles <- list.files(recursive = T)
requiredFiles <- c(train.Sub, train.Values, train.Labels, test.Sub, test.Values, test.Labels, activities, features)
missingFiles <- setdiff(requiredFiles,existingFiles)
if (length(missingFiles) > 0) {
    stop("Processing stopped, missing ", missingFiles, " required files not found.")
}
rm(existingFiles)
rm(requiredFiles)
rm(missingFiles)


##
##
## Read in the variable name data
## Create descriptive variable name
##
###############################################################################

## get the feature names
## these correspond to the 561 columns in the X data files
features <- read.table(features, colClasses = "character")

## remove parentheses from var names
features[,2] <- str_replace_all(features[,2], "\\(", "")
features[,2] <- str_replace_all(features[,2], "\\)", "")

## replace commas with underscores
features[,2] <- str_replace_all(features[,2], ",", "_")

## replace dashes with underscores
features[,2] <- str_replace_all(features[,2], "-", "_")

## check for names that begin with the letter t
## change the t to time
features[,2] <- str_replace(features[,2], "^t", "time")

## check for names that begin with the letter f
## change the f to frequency
features[,2] <- str_replace(features[,2], "^f", "frequency")

## check for names with "BodyBody"
## change this to "Body"
features[,2] <- str_replace(features[,2], "BodyBody", "Body")


#reading in the activity descriptions
activities <-read.table(activities, colClasses = "character")

##
##
## Read in the data
## Appropriately label the data set with descriptive variable names
##
###############################################################################

## read in the files
## assign column names (cleaned above) on ingest
train.Sub    <- read.table(train.Sub, col.names = "Subject")
train.Labels <- read.table(train.Labels, col.names = "Activity")
train.Values <- read.table(train.Values, col.names = features[,2])

test.Sub     <- read.table(test.Sub, col.names = "Subject")
test.Labels  <- read.table(test.Labels, col.names = "Activity")
test.Values  <- read.table(test.Values, col.names = features[,2])

#combining traininglabels with trainingValues
train.Data <- cbind(train.Sub, train.Labels, train.Values)

#combining testinglabels with testingValues
test.Data <- cbind(test.Sub, test.Labels, test.Values)

## remove old data sets from memory
rm(train.Sub)
rm(train.Labels)
rm(train.Values)

rm(test.Sub)
rm(test.Labels)
rm(test.Values)

#combine testing and training sets
mergedData <- rbind(train.Data, test.Data)

## remove old data sets from memory
rm(train.Data)
rm(test.Data)


##
##
## Extract only the measurements on the mean 
## and standard deviation for each measurement
##
###############################################################################
extractedData <- select(mergedData, Subject, Activity, contains("mean"), contains("std"))

## reduce activtyTable to a simple factor variable (instead of table)
## the index retains the assigned number
activityNames <- activities[, 2] 

## use the above factor to convert the activity number
## to the activity name
extractedData$Activity <- activityNames[extractedData$Activity]


##
##
## Write out the data set
##
###############################################################################

## write the dataset to a file
write.table(extractedData, file = "./tidyDataset1.txt")


##
##
## Create a second tidy data set with 
## the average of each variable for each activity and each subject
##
###############################################################################

## group the data by Activity and Subject
## calculate the mean of each column
## within each group
tidyData <- extractedData %>% 
    group_by(Activity, Subject) %>%
    summarise_each(funs(mean))

## write the dataset to a file
write.table(tidyData, file = "./tidyDataset2.txt", row.name = F)

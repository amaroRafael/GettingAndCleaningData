---
title: "Run Analysis"
author: "Rafael Luis Neves Amaro"
date: "Monday, May 24, 2015"
output: html_document
---

# Getting and cleaning data

This document describes the script **run_analysis.R**

# Libraries

This code uses the following libraries

* stringr
* dplyr

# Overview of Process

###This repo includes the following files:

- README.md - Contains scripts for downloading data and running the analysis
- Codebook.md - Provides detailed information describing the orginal variables in the UCI HAR dataset and the steps for transformating the data into a tidy data set
- run_analysis.r - Script for tidying up the data
- tidyDataset1.txt - output file for tidy data
- tidyDataset2.txt - output file for tidy data


###run_analysis.R 

- Use this script to process the raw data into the run_analysis tidy dataset.
- This script takes data from UCI HAR and provides a tidy data set with averages for mean and standard deviation for each subject and activity


#### Download and extract the files

- This script downloads and unzips the UCI HAR data set to your working directory


#### Process variable names

- Variable name data found in the **features.txt** file, it will save as *features*
- Modify *features* to create the most descriptive variable names
+ Remove parentheses
+ Replace commas with underscores
+ Replace dashes with underscores
+ For names beginning with "t" expand to "time"
+ For names beginning with "f" expand to "frequency"
+ For names containing "BodyBody" replace with "Body"


#### Activity label data

- Activity labels found in the **activity_labels.txt** file


#### Test and training data

* Appropriately label the data set with descriptive variable names
+ **subject_train.txt** and **subject_test.txt** files receive column name "Subject"
+ **y_train.txt** and **y_test.txt** files receive column name "Activty"
+ **x_train.txt** and **x_test.txt** files receive column names *features* processed above


#### Combine various files for the training and the testing data set

- Use *cbind()* to combine the subject column, activity column and feature data into one table


#### Merge the training and the test sets to create one data set

- use *rbind()* to combine the training data table and the testing data table into one table


#### Remove old data sets from memory

- The files are large, remove old variables once the combining is complete


#### Extract only the measurements on the mean and standard deviation

- Subset the data to extract only the columns with names we want to keep


#### Modify the "Activity" column to use descriptive names instead of numbers

- Reduce activtyTable (read in earlier from **activity_labels.txt** to a simple factor variable (instead of table)
+ *activityNames <- activities[, 2]* (the index retains the activity number)

- Use the factor to convert the activity number to the activity name
+ *activityNames[extractedData$Activity]*


#### Write out the data set

- This dataset is saved as **tidyDataset1.txt**
- To read in this dataset, use *read.table("./tidyDataset1.txt", header = T)*


#### Create a second tidy data set with the average of each variable for each activity and each subject

- Group the data by Activity name
- Calculate the mean of each column within each group


#### Write the dataset to a file

- This dataset is saved as **tidyDataset2.txt**
- To read in this dataset, use 

data <- read.table("./tidyDataset2.txt", header = T)

View(data)
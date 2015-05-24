---
title: "Code book"
author: "Rafael Luis Neves Amaro"
date: "Sunday, May 24, 2015"
output: html_document
---


## Orignal Data Source


The original data used in this analysis come from a dataset of information gathered from the accelerometer and 
gyroscope of a Sumsung Galaxy II smartphone worn by 30 different participants. The data obtained from the smartphone was expanded on to add data about the 3-axial (XYZ) linear acceleration and 3-axial angular velocity of the device. Subsequently, the data was summarize in a variety of ways (mean, standard deviation, maximum absolute deviation, etc.) More information on the original data can be found here

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Original data set citation:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


## Study Design

This study was designed as a project for the Getting and Cleaning Data course on Coursera. The study was designed to test the implementation of tidy data principles. 


## Feature Selection

In this analysis, we chose to focus on the measures of mean and standard deviation found in the original dataset. To do so, we extracted just the columns that contained the phrases [mean] and [std]. Because of the original feature labeling, mean calculations were labeled in a variety of ways (hence, mean and Mean were matched on), while standard deviation was consistently labeled as std. Variables that labeled the particular participant ("Subject") and the activity being performed ("Activty") were also retained in the dataset.

This subset of data can be found in **tidyDataset1.txt**.


## Summarization

The data was summarized by first grouping the data by activity type (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS). The mean of each variable (mean and standard deviation values retained above) was then calculated for each activity type. 

The dataset containing this summary information can be found in **tidyDataset2.txt**.


## Instructions

- Select your working directory
- Run run_analysis.R
- The data will be downloaded to your working directory
- The analysis will be performed on the downloaded data
- Resulting data will be stored in your working directory


## CodeBook

###List of subjects:

Each subject is identified with a label 1 thru 30.


###List of activities:

1 "WALKING"
2 "WALKING_UPSTAIRS"
3 "WALKING_DOWNSTAIRS"
4 "SITTING"
5 "STANDING"
6 "LAYING"


###For the Run_Analyss tidy dataset, the mean and standard deviation were included for each feature as described below:

The following variables can be found in each dataset:

Subject                 
- Integer  1:30
- Id of each subject included in the "Human Activity Recognition Using Smartphones Dataset"

Activity                
- Character
- Name of each activity tested during the experiment:

angletBodyAccJerkMean_gravityMean
- Numerical
- Mean of angle between to vectors time body accellerator jerk / gravity

angletBodyAccMean_gravity
- Numerical
- Mean of angle between to vectors time body accellerator / gravity

angletBodyGyroJerkMean_gravityMean
- Numerical
- Mean of angle between to vectors time body gyro jerk / gravity

angletBodyGyroMean_gravityMean
- Numerical
- Mean of angle between to vectors time body gyro / gravity

angleX_gravityMean
- Numerical
- Mean of angle between to vectors gravity for direction X

angleY_gravityMean
- Numerical
- Mean of angle between to vectors gravity for direction Y

angleZ_gravityMean
- Numerical
- Mean of angle between to vectors gravity for direction Z

frequencyBodyAcc_mean_X
- Numerical
- Mean of frequency body accellerator for direction X

frequencyBodyAcc_mean_Y
- Numerical
- Mean of frequency body accellerator for direction Y

frequencyBodyAcc_mean_Z
- Numerical
- Mean of frequency body accellerator for direction Z

frequencyBodyAcc_meanFreq_X
- Numerical
- Weighted average of the frequency body accellerator for direction X

frequencyBodyAcc_meanFreq_Y
- Numerical
- Weighted average of the frequency body accellerator for direction Y

frequencyBodyAcc_meanFreq_Z
- Numerical
- Weighted average of the frequency body accellerator for direction Z

frequencyBodyAcc_std_X
- Numerical
- Standard deviation of frequency body accellerator for direction X

frequencyBodyAcc_std_Y
- Numerical
- Standard deviation of frequency body accellerator for direction Y

frequencyBodyAcc_std_Z
- Numerical
- Standard deviation of frequency body accellerator for direction Z		

frequencyBodyAccJerk_mean_X
- Numerical
- Mean of frequency body accellerator jerk for direction X

frequencyBodyAccJerk_mean_Y
- Numerical
- Mean of frequency body accellerator jerk for direction Y

frequencyBodyAccJerk_mean_Z
- Numerical
- Mean of frequency body accellerator jerk for direction Z

frequencyBodyAccJerk_meanFreq_X
- Numerical
- Weighted average of the frequency body accellerator jerk for direction X

frequencyBodyAccJerk_meanFreq_Y
- Numerical
- Weighted average of the frequency body accellerator jerk for direction Y

frequencyBodyAccJerk_meanFreq_Z
- Numerical
- Weighted average of the frequency body accellerator jerk for direction Z

frequencyBodyAccJerk_std_X
- Numerical
- Standard deviation of frequency body accellerator jerk for direction X

frequencyBodyAccJerk_std_Y
- Numerical
- Standard deviation of frequency body accellerator jerk for direction Y

frequencyBodyAccJerk_std_Z
- Numerical
- Standard deviation of frequency body accellerator jerk for direction Z

frequencyBodyAccJerkMag_mean
- Numerical
- Mean of frequency body accellerator magnitude

frequencyBodyAccJerkMag_meanFreq
- Numerical
- Weighted average of the frequency body accellerator magnitude

frequencyBodyAccJerkMag_std
- Numerical
- Standard deviation of frequency body accellerator magnitude

frequencyBodyAccMag_mean
- Numerical
- Mean of frequency body accellerator magnitude

frequencyBodyAccMag_meanFreq
- Numerical
- Weighted average of the frequency body accellerator magnitude

frequencyBodyAccMag_std
- Numerical
- Standard deviation of frequency body accellerator magnitude

frequencyBodyGyro_mean_X
- Numerical
- Mean of frequency body gyro for direction X

frequencyBodyGyro_mean_Y
- Numerical
- Mean of frequency body gyro for direction Y

frequencyBodyGyro_mean_Z
- Numerical
- Mean of frequency body gyro direction Z

frequencyBodyGyro_meanFreq_X
- Numerical
- Weighted average of the frequency body gyro for direction X

frequencyBodyGyro_meanFreq_Y
- Numerical
- Weighted average of the frequency body gyro for direction Y

frequencyBodyGyro_meanFreq_Z
- Numerical
- Weighted average of the frequency body gyro for direction Z

frequencyBodyGyro_std_X
- Numerical
- Standard deviation of frequency body gyro for direction X      

frequencyBodyGyro_std_Y
- Numerical
- Standard deviation of frequency body gyro for direction Y

frequencyBodyGyro_std_Z
- Numerical
- Standard deviation of frequency body gyro direction Z

frequencyBodyGyroJerkMag_mean
- Numerical
- Mean of frequency body gyro jerk magnitude

frequencyBodyGyroJerkMag_meanFreq
- Numerical
- Weighted average of the frequency body gyro jerk magnitude

frequencyBodyGyroJerkMag_std
- Numerical
- Standard deviation of frequency body gyro jerk magnitude

frequencyBodyGyroMag_mean
- Numerical
- Mean of frequency body gyro magnitude

frequencyBodyGyroMag_meanFreq
- Numerical
- Weighted average of the frequency body gyro magnitude

frequencyBodyGyroMag_std
- Numerical
- Standard deviation of frequency body accellerator magnitude

timeBodyAcc_mean_X
- Numerical
- Mean of time body accellerator for direction X

timeBodyAcc_mean_Y
- Numerical
- Mean of time body accellerator for direction Y

timeBodyAcc_mean_Z
- Numerical
- Mean of time body accellerator for direction Z

timeBodyAcc_std_X
- Numerical
- Standard deviation of time body accellerator for direction X

timeBodyAcc_std_Y
- Numerical
- Standard deviation of time body accellerator for direction Y

timeBodyAcc_std_Z
- Numerical
- Standard deviation of time body accellerator for direction Z

timeBodyAccJerk_mean_X
- Numerical
- Mean of time body accellerator jerk for direction X

timeBodyAccJerk_mean_Y
- Numerical
- Mean of time body accellerator jerk for direction Y

timeBodyAccJerk_mean_Z
- Numerical
- Mean of time body accellerator jerk for direction Z

timeBodyAccJerk_std_X
- Numerical
- Standard deviation of time body accellerator jerk for direction X

timeBodyAccJerk_std_Y
- Numerical
- Standard deviation of time body accellerator jerk for direction Y

timeBodyAccJerk_std_Z
- Numerical
- Standard deviation of time body accellerator jerk for direction Z

timeBodyAccJerkMag_mean
- Numerical
- Mean of time body accellerator jerk magnitude

timeBodyAccJerkMag_std
- Numerical
- Standard deviation of time body accellerator jerk magnitude

timeBodyAccMag_mean
- Numerical
- Mean of time body accellerator magnitude

timeBodyAccMag_std
- Numerical
- Standard deviation of time body accellerator magnitude

timeBodyGyro_mean_X
- Numerical
- Mean of time body gyro for direction X

timeBodyGyro_mean_Y
- Numerical
- Mean of time body gyro for direction Y

timeBodyGyro_mean_Z
- Numerical
- Mean of time body gyro for direction z

timeBodyGyro_std_X
- Numerical
- Standard deviation of time body gyro for direction X

timeBodyGyro_std_Y
- Numerical
- Standard deviation of time body gyro for direction Y

timeBodyGyro_std_Z
- Numerical
- Standard deviation of time body gyro for direction z

timeBodyGyroJerk_mean_X
- Numerical
- Mean of time body gyro jerk for direction X

timeBodyGyroJerk_mean_Y
- Numerical
- Mean of time body gyro jerk for direction Y

timeBodyGyroJerk_mean_Z
- Numerical
- Mean of time body gyro jerk for direction Z

timeBodyGyroJerk_std_X
- Numerical
- Standard deviation of time body gyro jerk for direction X

timeBodyGyroJerk_std_Y
- Numerical
- Standard deviation of time body gyro jerk for direction Y

timeBodyGyroJerk_std_Z
- Numerical
- Standard deviation of time body gyro jerk for direction Z

timeBodyGyroJerkMag_mean
- Numerical
- Mean of time body gyro jerk magnitude

timeBodyGyroJerkMag_std
- Numerical
- Standard deviation of time body gyro jerk magnitude

timeBodyGyroMag_mean
- Numerical
- Mean of time body gyro magnitude

timeBodyGyroMag_std
- Numerical
- Standard deviation of time body gyro magnitude

timeGravityAcc_mean_X
- Numerical
- Mean of time gravity accellerator for direction X

timeGravityAcc_mean_Y
- Numerical
- Mean of time gravity accellerator for direction Y

timeGravityAcc_mean_Z
- Numerical
- Mean of time gravity accellerator for direction Z

timeGravityAcc_std_X
- Numerical
- Standard deviation of time gravity accellerator for direction X

timeGravityAcc_std_Y
- Numerical
- Standard deviation of time gravity accellerator for direction Y

timeGravityAcc_std_Z
- Numerical
- Standard deviation of time gravity accellerator for direction Z

timeGravityAccMag_mean
- Numerical
- Mean of time gravity accellerator magnitude

timeGravityAccMag_std
- Numerical
- Standard deviation of time gravity accellerator magnitude
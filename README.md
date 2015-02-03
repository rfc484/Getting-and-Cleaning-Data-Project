# Getting-and-Cleaning-Data-Project

## Instructions
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## My Solution

First I downloaed and extracted the data.  My script then performs the following steps:

1. Read the training and test data
2. Add the features as column names
3. Chose the columns that contain mean or STD in their names
4. Combine the training and test dataframes
5. Combine all the tables
6. Reshape using melt and dcast as in the lecture videos
7. Write the tidy dataset

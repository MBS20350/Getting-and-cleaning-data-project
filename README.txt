## Getting and Cleaning Data course project
## Mark Sucato

## This README file discusses the associated run_analysis.R script.  For more information about the HAR dataset as it pertains to this
## project, please see the provided Codebook.RMD file.

## The five tasks of this project are:

## 1.  Merge the training and test sets to create one data set
## 2.  Extract only the measurements on the mean and standard deviation for each measurement
## 3.  Use descriptive activity names to name the activities within the data set
## 4.  Appropriately label the data set with descriptive variable names
## 5.  Create a second independent tidy data set with the average of each variable for each activity and subject

## The run_analysis.R script uses the dplyr package and assumes the UCI HAR Dataset folder is saved in current working directory.  The 
## script is internally notated by task.  The command source("run_analysis.R") will perform the five tasks, to include saving a file
## "getting_and_cleaning_data_project_task5.txt" within the working directory.

## The script loads both training and test data sets into 'train' and 'test' respectively, and renames the feature variable columns ## with the names from the "features.txt" file.  This partially completes Tasks 1 and 4.  Task 4 was partially completed
## out of order in the interests of simplicity at a cost of one potentially extraneous line of code.

** chunk **

## Tasks 1, 3 and 4 were completed by combining 'train' and 'test' into 'data', renaming the subject_ID and activity columns with more
## descriptive names than before, and recoding the activity identifiers with the actual activities taken from 'activity_labels.txt'
## As before, the order of tasks was driven by simplicity.

** chunk **

## Task 2 was completed by parsing the combined data set for all variables using the terminology 'mean' and 'std.'  

         
    
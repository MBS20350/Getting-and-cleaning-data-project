## Getting and Cleaning Data course project
## Mark Sucato

## Script assumes UCI HAR Dataset folder saved in current working directory

library(dplyr)
current <- getwd()

## Load activity & feature labels

setwd("UCI HAR Dataset")    
activ_key <-read.table("activity_labels.txt")
data_labels <- read.table("features.txt")

## Load training / test sets, and rename data variables (Partial Task 1 and 4)

setwd("./train")    
train_data <- read.table("X_train.txt")
colnames(train_data) <- data_labels$V2
train <- bind_cols(read.table("subject_train.txt"), read.table("y_train.txt"), train_data)

setwd("../test")    
test_data <- read.table("X_test.txt")
colnames(test_data) <- data_labels$V2
test <- bind_cols(read.table("subject_test.txt"), read.table("y_test.txt"), test_data)
setwd(current)    

## Create unified data set "data" with descriptive variable & activity names (Tasks 1, 3, 4)

data <- bind_rows(train, test)
data <- data %>%
  rename(subject_ID = V1...1) %>%
  rename(activity = V1...2)
data$activity <- recode(data$activity, "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")

## Extract means and standard deviations for each measurement in "task1_to_4" data set (Task 2, final data for Tasks 1-4)

task1_to_4 <- data %>%
  select(subject_ID, activity, contains("mean") & !(contains("angle") | contains("Freq")), contains("std"))

## Create second Tidy data set "task5" with the average of each variable for each activity and each subject (Task 5)

task5 <- task1_to_4 %>%
  group_by(subject_ID, activity) %>%
  summarise(across("tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-std()", mean))

write.table(task5, file = "getting_and_cleaning_data_project_task5.txt", row.name = FALSE)
  

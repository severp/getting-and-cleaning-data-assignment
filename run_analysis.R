## read data in R
test_data <- read.table("dataset/test/X_test.txt")
train_data <- read.table("dataset/train/X_train.txt")
subject_test <- read.table("dataset/test/subject_test.txt")
subject_train <- read.table("dataset/train/subject_train.txt")
test_activityID <- read.table("dataset/test/y_test.txt")
train_activityID <- read.table("dataset/train/y_train.txt")

## merges test and train data
library(dplyr)
all_data <- bind_rows(test_data, train_data)
all_subjects <- bind_rows(subject_test, subject_train)
all_activityID <- bind_rows(test_activityID, train_activityID)
rm(test_data, train_data, subject_test, subject_train, test_activityID, train_activityID)

## labels the data set with descriptive variable names
features <-read.table("dataset/features.txt")
names(all_data) <- features$V2
names(all_subjects) <- "subjects"
names(all_activityID) <- "activityID"

## Extracts only the mesurements of the mean and standard deviation
## for each mesurement
n <- c(grep("mean",features$V2), grep("std", features$V2))
selected_data <- all_data[, n]

## Uses descriptive activity names to name the activities in the dataset.
activities <- read.table("dataset/activity_labels.txt")
activity <- merge(all_activityID, activities, by.x = "activityID", by.y = "V1")
activity <- select(activity,2)
names(activity) <- "activity"
final_data <- bind_cols(all_subjects, activity, selected_data)

## Creates an independent tidy data set with the average of each
## variable for each activity and each subject
grouped <- group_by(final_data, subjects, activity)
final_tidy_data <- summarize_each(grouped, funs(mean), 3:81)

## Saves the data set as text file in the working directory.
write.table(final_tidy_data, file = "my_tidy_data.txt")
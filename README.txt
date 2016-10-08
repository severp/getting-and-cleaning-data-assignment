The script provided under the name "run_analysis.R" will process the dataset from:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

The data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and unzipped in a folder named "dataset".

The script works as follows:
1. Reads the data, providing "dataset" folder is in the working directory. Otherwise the read.table arguments should be modified accordingly.
2. Merges the test and train data.
3. Labels the dataset with descriptive variable names.
4. Extracts only the mesurements of the mean and standard deviation for each mesurement.
5. Uses descriptive activity names to name the activities in the dataset.
6. Groups the dataset by subject and by activity.
7. Summarizes the grouped dataset into a new independent dataset with the average of each variable.
8. Saves the new dataset as a text file named "my_tidy_data.txt" into the working directory.

The above steps can be read from the comments in the script.

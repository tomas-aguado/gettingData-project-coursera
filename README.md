# README

# General description
This script performs the following operations over the UCI HAR dataset:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Detailed process
The following actions are performed by the script in order to obtain an independent tidy data set with the average of each variable for each activity and each subject. This information is contained in the script as code comments:

1. First of all the needed data is loaded into different dataframes, we load only the activity labels in order to correctly merge it with the activity codes.
2. Once the data is loaded, we prepare a template to filter only the fields containing standard and mean deviation using the grepl command. This template will be used later to filter the data we don't need.
3. Then the test and train data is prepared following a similar process: first we change the column names to fit with descriptive names using the right column of the Feature dataset, then we update the Y dataframe with the activity labels.
4. Finally we filter the train and test dataframes with the template prepared in step 2 and we fuse the columns using cbind.
5. Once done, we fuse the rows of both train and test data using the rbind command
6. The next step changes the columns names just for them to be a bit more comprehensive.
7. Before creating the final dataset, first we melt the data taking into account which are the identification variables (activity and subject id).
8. Once molten, we create a dataframe again specifying that the mean should be applied to everything but the id columns
9. We write the dataframe to a txt file.

# Installation and script running process
1. Download the UHCI dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) folder following the exact folder structure of the ZIP.
2. Copy the run_analysis.R script in the parent folder of the dataset (just next to the UCI HAR dataset created after descompressing the dataset).
3. Change the working directory to the folder where the R script is contained if needed using the setwd() command
4. Install the reshape2 library if needed 
5. Run the script using source(run_analysis.R) from this folder, and file called tidydata.txt containing the tidy dataset should be generated.

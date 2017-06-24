# Codebook

## The dataset is included in the UCI HAR Dataset that can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) it's mandatory to follow the folder structure defined in the ZIP provided in order for the script to work. It contains the following files:

* **_features_info.txt_**: Shows information about the variables used on the feature vector.

* **_features_info.txt_**: Shows information about the variables used on the feature vector.

* **_features.txt_**: List of all features.

* **_activity_labels.txt_**: Links the class labels with their activity name.

* **_train/X_train.txt_**: Training set.

* **_train/y_train.txt_**: Training labels.

* **_test/X_test.txt_**: Test set.

* **_test/y_test.txt_**: Test labels.

## The following files are available for the train and test data. Their descriptions are equivalent. 

* **_train/subject_train.txt_**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* **_train/Inertial Signals/total_acc_x_train.txt_**: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* **_train/Inertial Signals/body_acc_x_train.txt_**: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* **_train/Inertial Signals/body_gyro_x_train.txt_**: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## The root folder contains the following files:

* **_run_analysis.R_**: The script used to tidy and fuse the information contained in the dataset. 

* **_Readme.md_**: Readme file used to describe the analysis process. 

* **_Codebook.md_**: This file which modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information 

* **_tidydata.txt_**: This file contains the tidy data set with the average of each variable for each activity and each subject. 



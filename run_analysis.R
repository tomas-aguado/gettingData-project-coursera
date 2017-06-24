library(reshape2)

#First we merge the training and the test sets to create one data set.
Feature_data <- read.table(".\\UCI HAR Dataset\\features.txt")
Activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")[,2]

X_Test_data <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
Y_Test_data <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
Subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

X_Train_data <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
Y_Train_data <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
Subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

#Now we get only the columns having mean and std deviation 
#Template to extract only the measurements on the mean and standard deviation for each measurement
Rqfields_template = grepl ("*mean*|*std*",Feature_data[,2])


#TEST DATA
#We change the column names to fit with descriptive names
names(X_Test_data) = Feature_data[,2]
names(Subject_test) = "SUBJECT_ID"
names(Y_Test_data) = ("ACTIVITY_ID")
Y_Test_data$ACTIVITY_NAME = Activity_labels[Y_Test_data$ACTIVITY_ID]
X_Test_data <- X_Test_data [,Rqfields_template]
Activity_test <- cbind(Subject_test,X_Test_data,Y_Test_data)




#TRAIN DATA
names(X_Train_data) = Feature_data[,2]
names(Subject_train) = "SUBJECT_ID"
names(Y_Train_data) = ("ACTIVITY_ID")
Y_Train_data$ACTIVITY_NAME = Activity_labels[Y_Train_data$ACTIVITY_ID]
X_Train_data <- X_Train_data [,Rqfields_template]
Activity_train <-cbind(Subject_train,X_Train_data,Y_Train_data)


#Now we put together everything
Activity = rbind(Activity_train,Activity_test)




#Then we set appropriate labels to the data set and descriptive variable names.
names(Activity) <-gsub("^t","Time",names(Activity))
names(Activity) <-gsub("Freq","Frequency",names(Activity))
names(Activity) <-gsub("-mean\\(\\)*","Mean",names(Activity))
names(Activity) <-gsub("^f","Frequency",names(Activity))
names(Activity) <-gsub("*Acc*","Acceleration",names(Activity))
names(Activity) <-gsub("*BodyBody*","Body",names(Activity))
names(Activity) <-gsub("*Mag*","Magnitude",names(Activity))
names(Activity) <-gsub("*-mean*","Mean",names(Activity))
names(Activity) <-gsub("-std\\(\\)","Standard",names(Activity))
names(Activity) <-gsub("\\(\\)","",names(Activity))


#Finally we create a tidy data set with the average of each variable for each activity and each subject.
Molten_Activity = melt(Activity, id = c("SUBJECT_ID","ACTIVITY_ID","ACTIVITY_NAME"))
#Now when molted, we create the data frame again using the ID for each activity and subject combination we get the mean
Final_data <- dcast(Molten_Activity,SUBJECT_ID+ACTIVITY_ID+ACTIVITY_NAME ~ variable,mean)
#Finally, we write the final data frame to a file
write.table(Final_data,file="tidydata.txt",row.name=FALSE)
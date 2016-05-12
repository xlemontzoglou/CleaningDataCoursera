# (1)Merges the training and the test sets to create one data set.
# (2)Extracts only the measurements on the mean and standard deviation for each measurement.
# (3)Uses descriptive activity names to name the activities in the data set
# (4) (Done mostly at step 2)Appropriately labels the data set with descriptive variable names.
# (5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#download file-data
setwd("/home/xanthippe/Documents/CleansingData/week4")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("assignment")) {
    dir.create("assignment")    
}
setwd("./assignment")
download.file( url = fileurl, destfile = "./data.zip")
unzip("data.zip")
list.files(".")
datecreation <- date()
list.files("./UCI HAR Dataset")

#read train set files - extract as data frames
list.files("./UCI HAR Dataset/train")
X_train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
str(X_train) 
Y_train <- read.table(file = "./UCI HAR Dataset/train/y_train.txt")
str(Y_train)
subject_train <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
str(subject_train)
#read test set files -extract as data frames
list.files("./UCI HAR Dataset/test")
X_test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
str(X_test)
Y_test <- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
str(Y_test)
subject_test <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
str(subject_test)

#read features and activities file- extract as data frame
list.files("./UCI HAR Dataset")
features <- read.table(file = "./UCI HAR Dataset/features.txt")
str(features)
activities <- read.table(file = "./UCI HAR Dataset/activity_labels.txt")
str(activities)

#merges into one data frame the train set and assigns descriptive feature names
train_set <- cbind(subject_train, X_train, Y_train)
str(train_set)
names(train_set) <- c("subject", as.character(features[,2]), "activity")
str(train_set)
tail(train_set)

#merge into one data frame the test set
test_set <- cbind(subject_test, X_test, Y_test)
str(test_set)
names(test_set) <- c("subject", as.character(features[,2]), "activity")
str(test_set)
tail(test_set)

#merge train and test data frames into one and assigns descriptive feature names

data_set <- rbind(train_set, test_set)
str(data_set)
dim(data_set)[1] == dim(test_set)[1]  + dim(train_set)[1]

#get for each measurement std and mean and 
library(plyr)
library(dplyr)
columns <- grep('-std[()]|-mean[()]', names(data_set))
tidy_data1 <- cbind(subject = data_set$subject, data_set[,columns], activity = data_set$activity)
str(tidy_data1)

#replace code of activities with descriptive name
tidy_data1$activity <- tidy_data1$activity %>% 
    mapvalues(from = 1:6, to = as.character(activities[,2])) %>%
    as.factor 
levels(tidy_data1$activity)

#replace/alter wherever needed variable names

names(tidy_data1) <-gsub("-", "_", names(tidy_data1)) 
names(tidy_data1) <- gsub("\\()", "", names(tidy_data1))

#creating second tidy data set
#mean value of each measurement for each subject and each activity

tidy_data2 <- tidy_data1 %>% 
    group_by(subject, activity) %>%
    summarize_each(funs(mean))
str(tidy_data2)

#file creation
write.table( tidy_data2, file = 'tidy_data_set.txt', row.names = FALSE)
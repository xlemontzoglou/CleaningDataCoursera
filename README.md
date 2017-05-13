# CleaningDataCoursera

The script, the data set and the files were created in order to complete the coursera course "Getting and cleaning data", as an assignment at the end of the 4th week. (https://www.coursera.org/learn/data-cleaning/home/welcome). We were given raw data and specific instrtuctions in order to create a tidy data set. The instructions are described at https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project, part of them follows: 

"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected."

"You should create one R script called run_analysis.R that does the following.

    (1)Merges the training and the test sets to create one data set.
    (2)Extracts only the measurements on the mean and standard deviation for each measurement.
    (3)Uses descriptive activity names to name the activities in the data set
    (4)Appropriately labels the data set with descriptive variable names.
    (5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

======================================================

The raw data were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
The source of the data and the raw data are described at the README.txt and features_info.txt files that are contained in the above zip file/folder.

======================================================

The process for raw to tidy data is described at the codebook file. 

The dataset includes the following files
=====================================================

README.md

CodeBook.md 	:describes the variables, the data, and any transformations or work that you performed to clean up the data)

run_analysis.R	:script from downloading the file to tidying the data, as requested/described by the instructors, and extracting the final tidy data set at tidy_data_set.txt )

tidy_data_set.txt contains the final tidy data set as described at step (5) for creating run_analysis.R script

======================================================

The tidy data set file is consisted of 68 features, where the 2 first were used to group the results by subject and activity as described at cookbook.md 
Subject:identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
Activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
The rest 66 are the calculated average -during the assignment- of the mean and standard deviation of the measurenents, as given by the original/raw data.




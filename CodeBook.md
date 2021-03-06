
The data were provided from the source described at README.md. 

It was given a number of signal/measurments as described at features_info.txt  of the link providing the folder with the raw data. 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
The signals/measurements were the ones presented below. The '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

There were a few more as well. All the variables are described at the file features.txt of the raw data folder (link of folder at the beggining of the current file)

===========================================================================

(1)The first step was to create a data frame- table for train and test set separetely, containing all the features including the subject id and activity and assign the corresponding feature names, as given by features.txt by the raw data folder. Then test and train set were merged in one data frame, containing at the first row the subject id, at the following ones all the given features and at the final row the activity- labeled with numbers.

===========================================================================

(2) Using the above mentioned data frame/ data set, the measurments refering to the mean value ('mean()') and standard deviation ('std()') were selected, while keeping subject id as the first row and activity as the last one. So, at this point the 68 features to be used had been selected.

===========================================================================

(3) The activity labels 1:6 were  replaced by descriptive names 

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

============================================================================

(4) Then a few alterations at the feature names were made. Although the given names by the original data set were used, which are extremely descriptive with the help of the corresponding file features_info.txt (raw data file). The symbol "-" was replaced by "_" and "()" by "" for better parsing of the feature names. 

=============================================================================

At this point the features kept were (apart from subject and activity): 

By reference number at the features.txt file of the raw data 

1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85
86 121 122 123 124 125 126 161 162 163 164 165 166 201 202 214 215
227 228 240 241 253 254 266 267 268 269 270 271 345 346 347 348 349
350 424 425 426 427 428 429 503 504 516 517 529 530 542 543

By name (after the alterations)

"subject"                   "tBodyAcc_mean_X"
"tBodyAcc_mean_Y"           "tBodyAcc_mean_Z" 
"tBodyAcc_std_X"            "tBodyAcc_std_Y"
"tBodyAcc_std_Z"            "tGravityAcc_mean_X"
"tGravityAcc_mean_Y"        "tGravityAcc_mean_Z"
"tGravityAcc_std_X"         "tGravityAcc_std_Y"
"tGravityAcc_std_Z"         "tBodyAccJerk_mean_X"
"tBodyAccJerk_mean_Y"       "tBodyAccJerk_mean_Z"
"tBodyAccJerk_std_X"        "tBodyAccJerk_std_Y"
"tBodyAccJerk_std_Z"        "tBodyGyro_mean_X"
"tBodyGyro_mean_Y"          "tBodyGyro_mean_Z"
"tBodyGyro_std_X"           "tBodyGyro_std_Y"
"tBodyGyro_std_Z"           "tBodyGyroJerk_mean_X"
"tBodyGyroJerk_mean_Y"      "tBodyGyroJerk_mean_Z"
"tBodyGyroJerk_std_X"       "tBodyGyroJerk_std_Y"
"tBodyGyroJerk_std_Z"       "tBodyAccMag_mean"
"tBodyAccMag_std"           "tGravityAccMag_mean"
"tGravityAccMag_std"        "tBodyAccJerkMag_mean"
"tBodyAccJerkMag_std"       "tBodyGyroMag_mean"
"tBodyGyroMag_std"          "tBodyGyroJerkMag_mean"
"tBodyGyroJerkMag_std"      "fBodyAcc_mean_X"
"fBodyAcc_mean_Y"           "fBodyAcc_mean_Z"
"fBodyAcc_std_X"            "fBodyAcc_std_Y"
"fBodyAcc_std_Z"            "fBodyAccJerk_mean_X"
"fBodyAccJerk_mean_Y"       "fBodyAccJerk_mean_Z"
"fBodyAccJerk_std_X"        "fBodyAccJerk_std_Y"
"fBodyAccJerk_std_Z"        "fBodyGyro_mean_X"
"fBodyGyro_mean_Y"          "fBodyGyro_mean_Z"
"fBodyGyro_std_X"           "fBodyGyro_std_Y"
"fBodyGyro_std_Z"           "fBodyAccMag_mean"
"fBodyAccMag_std"           "fBodyBodyAccJerkMag_mean" 
"fBodyBodyAccJerkMag_std"   "fBodyBodyGyroMag_mean"
"fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_mean"
"fBodyBodyGyroJerkMag_std"  "activity"

where, as described at the raw data feature file 

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

and mean stands for average value, std for standard deviation.

====================================================================
(5) In order to create the final tidy data set, the tidy set from step (4) was grouped by subject and activity and for each of the of the features (except subject and activity) the average was calculated (for each subject by activity). The feature names weren't altered BUT at the final file are containig the average value of each feature from the previous tidy data set (step (4)). An overview of the features follows (containing the corresponding average value)

 $ subject                  : int  1 1 1 1 1 1 2 2 2 2 ...
 $ activity                 : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ tBodyAcc_mean_X          : num  0.222 0.261 0.279 0.277 0.289 ...
 $ tBodyAcc_mean_Y          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ tBodyAcc_mean_Z          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ tBodyAcc_std_X           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ tBodyAcc_std_Y           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ tBodyAcc_std_Z           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ tGravityAcc_mean_X       : num  -0.249 0.832 0.943 0.935 0.932 ...
 $ tGravityAcc_mean_Y       : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 $ tGravityAcc_mean_Z       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ tGravityAcc_std_X        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ tGravityAcc_std_Y        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ tGravityAcc_std_Z        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ tBodyAccJerk_mean_X      : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ tBodyAccJerk_mean_Y      : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ tBodyAccJerk_mean_Z      : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ tBodyAccJerk_std_X       : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ tBodyAccJerk_std_Y       : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ tBodyAccJerk_std_Z       : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ tBodyGyro_mean_X         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ tBodyGyro_mean_Y         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ tBodyGyro_mean_Z         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ tBodyGyro_std_X          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ tBodyGyro_std_Y          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ tBodyGyro_std_Z          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ tBodyGyroJerk_mean_X     : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ tBodyGyroJerk_mean_Y     : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ tBodyGyroJerk_mean_Z     : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ tBodyGyroJerk_std_X      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ tBodyGyroJerk_std_Y      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ tBodyGyroJerk_std_Z      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ tBodyAccMag_mean         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tBodyAccMag_std          : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tGravityAccMag_mean      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ tGravityAccMag_std       : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ tBodyAccJerkMag_mean     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ tBodyAccJerkMag_std      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ tBodyGyroMag_mean        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ tBodyGyroMag_std         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ tBodyGyroJerkMag_mean    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ tBodyGyroJerkMag_std     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ fBodyAcc_mean_X          : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ fBodyAcc_mean_Y          : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ fBodyAcc_mean_Z          : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ fBodyAcc_std_X           : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ fBodyAcc_std_Y           : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ fBodyAcc_std_Z           : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ fBodyAccJerk_mean_X      : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ fBodyAccJerk_mean_Y      : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ fBodyAccJerk_mean_Z      : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ fBodyAccJerk_std_X       : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ fBodyAccJerk_std_Y       : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ fBodyAccJerk_std_Z       : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ fBodyGyro_mean_X         : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ fBodyGyro_mean_Y         : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ fBodyGyro_mean_Z         : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ fBodyGyro_std_X          : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ fBodyGyro_std_Y          : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ fBodyGyro_std_Z          : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ fBodyAccMag_mean         : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ fBodyAccMag_std          : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ fBodyBodyAccJerkMag_mean : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ fBodyBodyAccJerkMag_std  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ fBodyBodyGyroMag_mean    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ fBodyBodyGyroMag_std     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ fBodyBodyGyroJerkMag_mean: num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ fBodyBodyGyroJerkMag_std : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...






###############
#CODE BOOK#
###############

###STUDY DESIGN###
- The original dataset (UCI HAR Dataset) used is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- The aformentioned dataset includes additional relevant descriptions such as feature information, activity label schema; and further description of how this data was collected (see 'UCI HAR Dataset/README.txt').

###SUMMARY###
- The original dataset is made up of several related files (additional files i.e.,'Inertial Signals/*' were not deemed necessary/useful as part of this analysis):
```
-[a]- 'UCI HAR Dataset/train/X_train.txt': Training set.
-[b]- 'UCI HAR Dataset/train/y_train.txt': Training labels.
-[c]- 'UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
-[d]- 'UCI HAR Dataset/test/X_test.txt': Test set.
-[e]- 'UCI HAR Dataset/test/y_test.txt': Test labels.
-[f]- 'UCI HAR Dataset/test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
-[g]- 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.
-[h]- 'UCI HAR Dataset/features.txt': List of all features.
```
Using the run_analysis.R script, the data is processed as followed:

1. The train [a] and test [c] datasets are reconstructed (combined with their corresponding labels: [b], [d], respectively); and subsequently the train and test data are combined into a single dataset or a R data table (for further processing).
-- see the corresponding function in run_analysis.R: .readData()

2. Set descriptive data labels (using the provided schema: [g]) instead of the integer representation [b, e].
-- see the corresponding function in run_analysis.R: .setDataLabel()

3. Set descriptive variable names (as provided: [h]).
-- see the corresponding function in run_analysis.R: .setVariableNames()

4. Subsets the dataset to variables that only include the measurements on the mean and standard deviation for each measurement (all variables that include any mean or standard deviation).
-- see the corresponding function in run_analysis.R: .subSetData()
-- the variable 'slice.data' represents the tranformed dataset (1-4), and should be visible in your .GlobalEnv

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
-- see the corresponding function in run_analysis.R: .final()
-- a second tidy dataset ('summarised_mean_std') representing the transformation from subsetted_dataset should be visable in your .GlobalEnv
-- print the tidy dataset to a text file: 'data_analysis/q5.txt'

###DATA VARIABLES###
```
LABEL 6
   Activity Label (as defined in 'UCI HAR Dataset/activity_labels.txt').
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

SUBJECT 30
   Subject Identification Number.
	1
	..
	30

Variables are defined in 'UCI HAR Dataset/features_info.txt' (and therefore not described herein). 
Values correspond to average of each variable for each activity and each subject.
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-meanFreq()
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()
```	


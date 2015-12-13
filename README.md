#SUMMARY

This file describes the run_analysis.R, a script to collect, tranform, and analyse the UCI HAR Dataset.
The run_analysis.R satisfies the following requirements:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The script performs the above requirements in the following order: 1,3,4,2, and 5.


#ARCHITECTURE
The run_analysis.R consists of six functions:

run():
	This is the script interface and the only function that the user needs to execute.
	This function will (1) create a folder ('data_analysis'), (2) download the UCI HAR 
	Dataset, and (3) execute the several functions (described below and in the 
	CodeBook.md) that will satisfy the aformentioned requirements.

.readData(): 
	The train and test data are combined into one dataset (requirement 1).

.setDataLabel(): 
	Sets descriptive activity labels (requirement 3).

.setVariableNames(): 
	Sets descriptive variable names (requirement 4).

.sliceData(): 
	Subsets data based on given requirements (requirement 2).

.final():
	Creates a second tidy dataset based on requirement 5. This dataset is also outputted to 'data_analysis/output_req_5.txt'.


#HOW TO RUN SCRIPT:
1. Import run_analysis.R
2. Run the function: run().

##DEPENDENCIES:
R Packages: dplyr









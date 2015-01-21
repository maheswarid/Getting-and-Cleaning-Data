# Getting-and-Cleaning-Data
Created for the John Hopkins Data Science course module "Getting and Cleaning Data"

# Introduction

Human Activity Recognition Using Smartphones Data Set 

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING,
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.

The data can be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##1.Merges the training and the test sets to create one data set.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
   Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and 
   Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are 
   radians/second. 

For step1 the Inertial signals data is excluded. The dataset is obtained by combining 
- "Subject" information from test and training data stream
- "Activity" information from the test and training data stream
- "features" information from the test and training data stream

The above the data sets are combined to form a data table using the "rbind" function. 



##2.Extracts only the measurements on the mean and standard deviation for each measurement. 

A subset of data is formed by selecting only the mean and standard deviation for each of the activity(i.e walking, upstairs, downstairs etc) measured.

##3.Uses descriptive activity names to name the activities in the data set

Using the "features.txt" from the input data files, the "features" data set is set with proper descriptive column names.

##4. Appropriately labels the data set with descriptive variable names. 
    #change features variable names --> meaningful readable names
    "Acc", --> "Accelerator"
    "Mag", -->"Magnitude"
    "Gyro", --> "Gyroscope"
    "^t", -->"time"
    "^f", -->"frequency"
    "BodyBody", -->"Body"
	
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.	

A new tidy data set is generated from the above data set by first grouping the activities per person / volunteer and taking average for each each 
of the activities carried out by the person.

Using the plyr library do the average of variable grouped by person subject per activity 

Fields in the tidydata  are

"subject" 

"activity" 

"timeBodyAccelerator-mean()-X" "timeBodyAccelerator-mean()-Y" "timeBodyAccelerator-mean()-Z" 

"timeBodyAccelerator-std()-X" "timeBodyAccelerator-std()-Y" "timeBodyAccelerator-std()-Z" 

"timeGravityAccelerator-mean()-X" "timeGravityAccelerator-mean()-Y" "timeGravityAccelerator-mean()-Z" 

"timeGravityAccelerator-std()-X" "timeGravityAccelerator-std()-Y" "timeGravityAccelerator-std()-Z" 

"timeBodyAcceleratorJerk-mean()-X" "timeBodyAcceleratorJerk-mean()-Y" "timeBodyAcceleratorJerk-mean()-Z" 

"timeBodyAcceleratorJerk-std()-X" "timeBodyAcceleratorJerk-std()-Y" "timeBodyAcceleratorJerk-std()-Z" 

"timeBodyGyroscope-mean()-X" "timeBodyGyroscope-mean()-Y" "timeBodyGyroscope-mean()-Z" 

"timeBodyGyroscope-std()-X" "timeBodyGyroscope-std()-Y" "timeBodyGyroscope-std()-Z" 

"timeBodyGyroscopeJerk-mean()-X" "timeBodyGyroscopeJerk-mean()-Y" "timeBodyGyroscopeJerk-mean()-Z" 

"timeBodyGyroscopeJerk-std()-X" "timeBodyGyroscopeJerk-std()-Y" "timeBodyGyroscopeJerk-std()-Z" 

"timeBodyAcceleratorMagnitude-mean()" "timeBodyAcceleratorMagnitude-std()" 

"timeGravityAcceleratorMagnitude-mean()" "timeGravityAcceleratorMagnitude-std()" 

"timeBodyAcceleratorJerkMagnitude-mean()" "timeBodyAcceleratorJerkMagnitude-std()" 

"timeBodyGyroscopeMagnitude-mean()" "timeBodyGyroscopeMagnitude-std()" 

"timeBodyGyroscopeJerkMagnitude-mean()" "timeBodyGyroscopeJerkMagnitude-std()" 

"frequencyBodyAccelerator-mean()-X" "frequencyBodyAccelerator-mean()-Y" "frequencyBodyAccelerator-mean()-Z" 

"frequencyBodyAccelerator-std()-X" "frequencyBodyAccelerator-std()-Y" "frequencyBodyAccelerator-std()-Z" 

"frequencyBodyAcceleratorJerk-mean()-X" "frequencyBodyAcceleratorJerk-mean()-Y" "frequencyBodyAcceleratorJerk-mean()-Z" 

"frequencyBodyAcceleratorJerk-std()-X" "frequencyBodyAcceleratorJerk-std()-Y" "frequencyBodyAcceleratorJerk-std()-Z" 

"frequencyBodyGyroscope-mean()-X" "frequencyBodyGyroscope-mean()-Y" "frequencyBodyGyroscope-mean()-Z" 

"frequencyBodyGyroscope-std()-X" "frequencyBodyGyroscope-std()-Y" "frequencyBodyGyroscope-std()-Z" 

"frequencyBodyAcceleratorMagnitude-mean()" "frequencyBodyAcceleratorMagnitude-std()" 

"frequencyBodyAcceleratorJerkMagnitude-mean()" "frequencyBodyAcceleratorJerkMagnitude-std()" 

"frequencyBodyGyroscopeMagnitude-mean()" "frequencyBodyGyroscopeMagnitude-std()" 

"frequencyBodyGyroscopeJerkMagnitude-mean()" "frequencyBodyGyroscopeJerkMagnitude-std()"

##Steps to execute run_analysis.R
1. Download the data set from"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Unzip the "UCI HAR Dataset" to the working directory
3. Make sure the libraries "data.table" and "plyr" are loaded
4. setwd() to the directory which has the extracted data 
5. source the run_analysis.R file and execute function run_analysis("data_directory")
   pass the directory in which the data is extracted. The default value is set to "UCI HAR Dataset"
6. tidydata.txt output data file is written in the data_directory path.

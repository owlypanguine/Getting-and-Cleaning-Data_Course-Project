#Code Book

##About the original data set

The data set used to create the "tidy data set" for this project comes from a set of experiments that used wearable smartphones (Samsung Galaxy S II) to measure acceleration and velocity in human subjects during six different activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying down). 

The subjects consisted of 30 volunteers between the ages of 19 and 48. Each volunteer performed the six activities while wearing a Samsung Galaxy S II smartphone on his or her waist. The accelerometer and gyroscope embedded in the smartphones were used to measure acceleration and velocity as the volunteers engaged in the activities. 

A total of 561 features were measured. These consist of acceleration and velocity signals in the time and frequency domains.

See the README.txt file in the UCI HAR data set for more details. 

##List of variables (total count: 68)

####ID variables (count: 2)

Units: N/A

<p><strong>Activity</strong> - activity label. 
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

<p><strong>Subject</strong> - subject ID number, ranging from 1 to 30

####Features variables (count: 66)

Units: None. The measures were normalized to a range of [-1, 1]. 

See 'About the original data set'

TimeBodyAcceleration-mean-X
TimeBodyAcceleration-mean-Y
TimeBodyAcceleration-mean-Z
TimeBodyAcceleration-std-X
TimeBodyAcceleration-std-Y
TimeBodyAcceleration-std-Z
TimeGravityAcceleration-mean-X
TimeGravityAcceleration-mean-Y
TimeGravityAcceleration-mean-Z
TimeGravityAcceleration-std-X
TimeGravityAcceleration-std-Y
TimeGravityAcceleration-std-Z
TimeBodyAccelerationJerk-mean-X
TimeBodyAccelerationJerk-mean-Y
TimeBodyAccelerationJerk-mean-Z
TimeBodyAccelerationJerk-std-X
TimeBodyAccelerationJerk-std-Y
TimeBodyAccelerationJerk-std-Z
TimeBodyGyro-mean-X
TimeBodyGyro-mean-Y
TimeBodyGyro-mean-Z
TimeBodyGyro-std-X
TimeBodyGyro-std-Y
TimeBodyGyro-std-Z
TimeBodyGyroJerk-mean-X
TimeBodyGyroJerk-mean-Y
TimeBodyGyroJerk-mean-Z
TimeBodyGyroJerk-std-X
TimeBodyGyroJerk-std-Y
TimeBodyGyroJerk-std-Z
TimeBodyAccelerationMagnitude-mean
TimeBodyAccelerationMagnitude-std
TimeGravityAccelerationMagnitude-mean
TimeGravityAccelerationMagnitude-std
TimeBodyAccelerationJerkMagnitude-mean
TimeBodyAccelerationJerkMagnitude-std
TimeBodyGyroMagnitude-mean
TimeBodyGyroMagnitude-std
TimeBodyGyroJerkMagnitude-mean
TimeBodyGyroJerkMagnitude-std
FreqBodyAcceleration-mean-X
FreqBodyAcceleration-mean-Y
FreqBodyAcceleration-mean-Z
FreqBodyAcceleration-std-X
FreqBodyAcceleration-std-Y
FreqBodyAcceleration-std-Z
FreqBodyAccelerationJerk-mean-X
FreqBodyAccelerationJerk-mean-Y
FreqBodyAccelerationJerk-mean-Z
FreqBodyAccelerationJerk-std-X
FreqBodyAccelerationJerk-std-Y
FreqBodyAccelerationJerk-std-Z
FreqBodyGyro-mean-X
FreqBodyGyro-mean-Y
FreqBodyGyro-mean-Z
FreqBodyGyro-std-X
FreqBodyGyro-std-Y
FreqBodyGyro-std-Z
FreqBodyAccelerationMagnitude-mean
FreqBodyAccelerationMagnitude-std
FreqBodyBodyAccelerationJerkMagnitude-mean
FreqBodyBodyAccelerationJerkMagnitude-std
FreqBodyBodyGyroMagnitude-mean
FreqBodyBodyGyroMagnitude-std
FreqBodyBodyGyroJerkMagnitude-mean
FreqBodyBodyGyroJerkMagnitude-std

#####Changes Made from the Original Dataset

The activity labels, which were numeric values ranging from 1 to 6, were replaced with the corresponding descriptive labels from "activity_labels.txt".

From "activity_labels.txt":

<p><p>1 WALKING
<p><p>2 WALKING_UPSTAIRS
<p><p>3 WALKING_DOWNSTAIRS
<p><p>4 SITTING
<p><p>5 STANDING
<p><p>6 LAYING

The feature variables included in the "tidy data set" include only measurements on the mean and standard deviation for each filter, per the assignment instructions. These were selected based on whether or not the variable names included "mean()" or "std()".

The following variables were not included:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

This is because according to "features_info.txt", these are "additional vectors obtained by averaging the signals in a signal window sample".

The variable names were edited to be more descriptive and readable. Specifically:
* the "t" at the front of many of the variable names was changed to "Time", indicating a time domain variable
* the "f" at the front of many of the variable names was changed to "Freq", indicating a frequency domain variable
* "Acc" was changed to "Acceleration"
* the "()" in many of the variable names were removed

I elected to keep the variable names mostly as they were to avoid error on my part, and also because they seemed already fairly descriptive, especially with the descriptions provided along with the data set.

##Source
<p>Human Activity Recognition Using Smartphones Dataset (Version 1.0)
<p>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
<p>Smartlab - Non Linear Complex Systems Laboratory
<p>Università degli Studi di Genova
<p>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


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

See 'About the original data set' and 'features_info.txt'

<p><strong>TimeBodyAcceleration-mean-X</strong>
<p><strong>TimeBodyAcceleration-mean-Y</strong>
<p><strong>TimeBodyAcceleration-mean-Z</strong>
<p><strong>TimeBodyAcceleration-std-X</strong>
<p><strong>TimeBodyAcceleration-std-Y</strong>
<p><strong>TimeBodyAcceleration-std-Z</strong>
<p><strong>TimeGravityAcceleration-mean-X</strong>
<p><strong>TimeGravityAcceleration-mean-Y</strong>
<p><strong>TimeGravityAcceleration-mean-Z</strong>
<p><strong>TimeGravityAcceleration-std-X</strong>
<p><strong>TimeGravityAcceleration-std-Y</strong>
<p><strong>TimeGravityAcceleration-std-Z</strong>
<p><strong>TimeBodyAccelerationJerk-mean-X</strong>
<p><strong>TimeBodyAccelerationJerk-mean-Y</strong>
<p><strong>TimeBodyAccelerationJerk-mean-Z</strong>
<p><strong>TimeBodyAccelerationJerk-std-X</strong>
<p><strong>TimeBodyAccelerationJerk-std-Y</strong>
<p><strong>TimeBodyAccelerationJerk-std-Z</strong>
<p><strong>TimeBodyGyro-mean-X</strong>
<p><strong>TimeBodyGyro-mean-Y</strong>
<p><strong>TimeBodyGyro-mean-Z</strong>
<p><strong>TimeBodyGyro-std-X</strong>
<p><strong>TimeBodyGyro-std-Y</strong>
<p><strong>TimeBodyGyro-std-Z</strong>
<p><strong>TimeBodyGyroJerk-mean-X</strong>
<p><strong>TimeBodyGyroJerk-mean-Y</strong>
<p><strong>TimeBodyGyroJerk-mean-Z</strong>
<p><strong>TimeBodyGyroJerk-std-X</strong>
<p><strong>TimeBodyGyroJerk-std-Y</strong>
<p><strong>TimeBodyGyroJerk-std-Z</strong>
<p><strong>TimeBodyAccelerationMagnitude-mean</strong>
<p><strong>TimeBodyAccelerationMagnitude-std</strong>
<p><strong>TimeGravityAccelerationMagnitude-mean</strong>
<p><strong>TimeGravityAccelerationMagnitude-std</strong>
<p><strong>TimeBodyAccelerationJerkMagnitude-mean</strong>
<p><strong>TimeBodyAccelerationJerkMagnitude-std</strong>
<p><strong>TimeBodyGyroMagnitude-mean</strong>
<p><strong>TimeBodyGyroMagnitude-std</strong>
<p><strong>TimeBodyGyroJerkMagnitude-mean</strong>
<p><strong>TimeBodyGyroJerkMagnitude-std</strong>
<p><strong>FreqBodyAcceleration-mean-X</strong>
<p><strong>FreqBodyAcceleration-mean-Y</strong>
<p><strong>FreqBodyAcceleration-mean-Z</strong>
<p><strong>FreqBodyAcceleration-std-X</strong>
<p><strong>FreqBodyAcceleration-std-Y</strong>
<p><strong>FreqBodyAcceleration-std-Z</strong>
<p><strong>FreqBodyAccelerationJerk-mean-X</strong>
<p><strong>FreqBodyAccelerationJerk-mean-Y</strong>
<p><strong>FreqBodyAccelerationJerk-mean-Z</strong>
<p><strong>FreqBodyAccelerationJerk-std-X</strong>
<p><strong>FreqBodyAccelerationJerk-std-Y</strong>
<p><strong>FreqBodyAccelerationJerk-std-Z</strong>
<p><strong>FreqBodyGyro-mean-X</strong>
<p><strong>FreqBodyGyro-mean-Y</strong>
<p><strong>FreqBodyGyro-mean-Z</strong>
<p><strong>FreqBodyGyro-std-X</strong>
<p><strong>FreqBodyGyro-std-Y</strong>
<p><strong>FreqBodyGyro-std-Z</strong>
<p><strong>FreqBodyAccelerationMagnitude-mean</strong>
<p><strong>FreqBodyAccelerationMagnitude-std</strong>
<p><strong>FreqBodyBodyAccelerationJerkMagnitude-mean</strong>
<p><strong>FreqBodyBodyAccelerationJerkMagnitude-std</strong>
<p><strong>FreqBodyBodyGyroMagnitude-mean</strong>
<p><strong>FreqBodyBodyGyroMagnitude-std</strong>
<p><strong>FreqBodyBodyGyroJerkMagnitude-mean</strong>
<p><strong>FreqBodyBodyGyroJerkMagnitude-std</strong>

##Differences from the original data set

The activity labels, which were numeric values ranging from 1 to 6, were replaced with the corresponding descriptive labels from "activity_labels.txt".

From "activity_labels.txt":

<p><p>1 WALKING
<p><p>2 WALKING_UPSTAIRS
<p><p>3 WALKING_DOWNSTAIRS
<p><p>4 SITTING
<p><p>5 STANDING
<p><p>6 LAYING

The feature variables included in the "tidy data set" include only measurements on the mean and standard deviation for each filter, per the assignment instructions. These were selected based on whether or not the variable names included "mean()" or "std()".

The following variables from the original data set were not included:

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

I elected to keep the variable names mostly as they were, firstly to avoid error on my part, and also because they already seemed fairly descriptive, especially with the explanations provided along with the original data set.

##Source
<p>Human Activity Recognition Using Smartphones Dataset (Version 1.0)
<p>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
<p>Smartlab - Non Linear Complex Systems Laboratory
<p>Università degli Studi di Genova
<p>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


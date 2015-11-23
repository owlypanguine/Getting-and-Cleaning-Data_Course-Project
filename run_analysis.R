#This script does the following:
##1. Merges the training and the test sets from the UCI HAR dataset to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names. 
##5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##each variable for each activity and each subject.

#####################################
#Step 1
#####################################

#Reads the training data
X_train <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")

#Merges the training data
training_data <- cbind(c(y_train, subject_train), X_train)

#Reads the test data
X_test <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")

#Merges the test data
test_data <- cbind(c(y_test, subject_test), X_test)

#Merges the training and test data into one data set
merged <- rbind(training_data, test_data)

#####################################
#Step 2
#####################################

#Labels the data

#From the README provided with the dataset, we see that the two files beginning with "y" 
#provide test/activity labels for the training and test data, respectively,
#and that the two files beginning with "subject" provide identifiers for the subjects performing 
#the activity in each observation. Because the data from these files were column-binded to 
#the front of the new data set created in Step 1, the first two columns in the assembled data set
#provide values for the activity label, then the subject label. The 561 columns that follow are 
#labelled according to the features list provided in "features.txt". 

#Reads the list of all features
features <- read.table("features.txt")

featurelist <- sapply(features[,2], as.character) #The list of features, column 2 of features,
##must first be changed from factor variables into string variables.
labels <- c(c("Activity", "Subject"), featurelist)
names(merged) <- labels #Labels all of the columns

#Uses regular expressions to separate out variable names that indicate mean and standard
#deviation measurements for each (non-ID) feature in the data set. These are the measurements
#we want to extract and keep. 

meanFreq <- names(merged)[grep("meanFreq", names(merged), ignore.case = FALSE)]
mean_labels <- names(merged)[grep("mean()", names(merged), ignore.case = FALSE)]
mean_labels <- mean_labels[! mean_labels %in% meanFreq]

std_labels <- names(merged)[grep("std()", names(merged), ignore.case = FALSE)]

#This is the final list of relevant variable names.
mean_std_labels <- c(mean_labels, std_labels)

#Using the list of variable names, we extract from the "merged" data frame a data frame
#containing only the IDs and the mean and standard deviation measurements. 

mean_std <- merged[names(merged) %in% c(c("Activity", "Subject"),mean_std_labels)]

#####################################
#Step 3
#####################################

#Relabels the activity labels 1-5 to make them descriptive. 
activity_labels <- as.character(mean_std$"Activity")
activity_labels <- sub("1", "Walking", activity_labels)
activity_labels <- sub("2", "Walking Upstairs", activity_labels)
activity_labels <- sub("3", "Walking Downstairs", activity_labels)
activity_labels <- sub("4", "Sitting", activity_labels)
activity_labels <- sub("5", "Standing", activity_labels)
activity_labels <- sub("6", "Laying", activity_labels)

#Places the new activity labels into the data frame.
mean_std[,1] <- activity_labels

#####################################
#Step 4
#####################################

#Labeling the data:
#See Step 2.

#Re-labels the feature variable names to make them more descriptive and readable. 
#Note: Some of the operations below don't apply because some of the targetted patterns
#("mad", "sma", "iqr", etc.) were taken out in Step 2. But they may come in handy some other time. 

new_names <- names(mean_std)
new_names <- sub("tBody", "TimeBody", new_names)
new_names <- sub("tGravity", "TimeGravity", new_names)
new_names <- sub("fBody", "FreqBody", new_names)
new_names <- sub("fGravity", "FreqGravity", new_names)
new_names <- sub("BodyAcc", "BodyAcceleration", new_names)
new_names <- sub("GravityAcc", "GravityAcceleration", new_names)
new_names <- sub("Mag", "Magnitude", new_names, ignore.case = FALSE)
new_names <- sub("\\(\\)", "", new_names)
new_names <- sub("mad", "median_absolute_deviation", new_names)
new_names <- sub("sma", "signal_magnitude_area", new_names)
new_names <- sub("iqr", "interquartile_range", new_names)
new_names <- sub("arCoeff", "autoregression_Coeff", new_names)
new_names <- sub("maxInds", "maxIndex", new_names)

#Places the new variable names into the data frame.
names(mean_std) <- new_names

#####################################
#Step 5
#####################################

#Uses plyr operations to create a new, tidy data set that contains the average of each feature
#variable grouped by activity and subject. 

library(dplyr)

#Creatures a plyr tabular data frame from the data frame obtained from Steps 1-4. 
merged_plyr <- tbl_df(mean_std)

#Groups the data frame by activity and subject IDs. 
grouped <- group_by(merged_plyr, Activity, Subject)

#Tidy data!
final_tidy <- summarize_each(grouped, funs(mean(., na.rm=TRUE)))

#Writes the data set into a text file.
write.table(final_tidy, file = "tidy_data_set", row.name = FALSE)
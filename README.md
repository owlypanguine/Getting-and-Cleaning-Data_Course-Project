# Getting-and-Cleaning-Data_Course-Project

The script provided, 'run_analysis.R', does the following:
<p>1. Merges the training and the test sets from the UCI HAR dataset to create one data set.
<p>2. Extracts only the measurements on the mean and standard deviation for each measurement. 
<p>3. Uses descriptive activity names to name the activities in the data set
<p>4. Appropriately labels the data set with descriptive variable names. 
<p>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Step 1

First, the three files that compose the training data set ("X_train.txt", "subject_train.txt", and "y_train.txt") are read into R and column-binded into one data frame, "training_data".

The three files that compose the test data set ("X_test.txt", "subject_test.txt", and "y_test.txt" are likewise read into R and column-binded into another data frame, "test_data".

"training_data" and "test_data" are then row-binded to create a single data set ("merged") consisting of both training and test data. 

##Step 2

First, we assign variable names to the data set assembled in Step 1. 

From the README provided with the dataset, we see that the two files beginning with "y" provide test/activity labels for the training and test data, respectively, and that the two files beginning with "subject" provide identifiers for the subjects performing the activity in each observation. Because the data from these files were column-binded to the front of the new data set created in Step 1, the first two columns in the assembled data set provide values for the activity label, then the subject label. The 561 columns that follow are labelled according to the features list provided in "features.txt". 

To get the features list, the script reads "features.txt" into R and extracts its second column, which contains the list of variable names. The items in the list are converted from factor to string variables, then the resulting list of string objects is combined with the character vector ("Activity", "Subject") to create the list of variable names for the unlabelled "merged" data set from Step 1. 

After assigning variable names to the data set, regular expression operations are used to separate out variable names that indicate mean and standard deviation measurements for each (non-ID) feature in the data set. These are the measurements
we want to extract and keep. After obtaining the final list of relevant variable names this way, only the relevant measurements are extracted from "merged" and placed into a new data set, "mean_std".

##Step 3

The activity labels under the "Activity" column are presently numeric values ranging from 1 to 6. "activity_labels.txt" tells us that the numbers correspond to activities like so:

1 -> "Walking"
2 -> "Walking Upstairs"
3 -> "Walking Downstairs"
4 -> "Sitting"
5 -> "Standing"
6 -> "Laying"

The script relabels the activity values accordingly. The activity labels are then placed into the data frame. 

##Step 4

The data was previously labelled in Step 2. This step uses regular expression operations to re-label the feature variable names to make them more descriptive and readable. The new variable names are then placed into the data frame. 

##Step 5

This step uses plyr operations to create a new, tidy data set that contains the average of each feature variable grouped by activity and subject. 

First, the data frame from Step 4 is converted into a new, plyr tabular data frame. The data frame is then grouped by activity id and subject id. Then we use the summarize_each function to calculate the mean for each measurement by group. This gives us our "tidy data set." The final step is to write it into a text file, the cleverly named "tidy_data_set.txt". 

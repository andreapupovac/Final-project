**Project Codebook** 

This is the codebook to the clean dataset created in this project. Below you will find information concerning the source of the data, as well as descriptions of the variables used and the transformations applied. 

Sourcing the Data: 
 
The data used in this project is sourced from the UC Irvine Machine Learning Repository and is a database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors (Link: https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones  ) . The 30 subjects were within the age bracket of 19-48 years old. 

Each person performed 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) Using its embedded accelerometer and gyroscope 3-axial linear acceleration and 3-axial angular velocity were captured  at a constant rate of 50Hz. The dataset was then further randomly divided into two sets, where 70% of the subjects were selected for generating the training data and 30% the test data ( further detailed information is provided in the README.txt file in the original dataset). 

The data was sourced from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The R script 

To run the operations necessary to obtain the final clean dataset, execute the run_analysis.R  R script. The R script does the following tasks (in order), providing you with a clean version of the dataset from the ZIP file in which the data is originally stored:

Downloads data to R from web link above 
Reads and merges the appropriate tables 
Extracts only the mean and standard deviation 
Labels the activities in the dataset with descriptive activity names 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.




Variables 
Below is a list of all the variables (in order of appearance) created in the R script and what they contain: 


file_url: contains url to file for the original dataset 
train_set: reads table X_train.txt table form the original dataset into R, which contains table of the training set 
train_label: reads the table y_train.txt table from the original dataset into R, which contains the activity labels(numbered 1-6 for activities 1-6) that accompany the training set 
test_set: reads the table X_test.txt table from the original dataset into R, which contains the table of the test set
test_label: reads the table y_test.txt table from the original dataset into R, which contains the activity labels (numbered 1-6 for activities 1-6) that accompany the test set 
subject_train: reads the subject_train.txt table from the original dataset into R, which identifies the subject who performed the activity for each sample (range 1-30 for subjects 1-30) 
subject_test: reads the subject_test.txt table from the original dataset into R, which identifies the subject who performed the activity for each sample (range 1-30 for subjects 1-30) 
activityLabels:  reads the activity_labels.txt table from the original dataset into R, which is a table that matches the activity label (numbered 1-6 for activities 1-6), to the activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
features:  reads the features.txt  table from the original dataset into R, which lists all the features 
train: merges together the train_label, subject_train, and train_set tables so that we may have a df with the train set organized by subject and activity label 
test: merges together the test_label, subject_test and test_set tables so that we may have a df with the test set organized by subject and activity label 
cleandata: merges together the train and test dfs, so we have a clean dataset with the train and test sets by activity label and subject 
mean_std: a df with only the relevant measures ( the mean and std) extracted 
df_activity _names: merges activityLabels df with mean_std df so that the activity names or type will be included in the df 
Tidy_dataset: final tidy dataset with 

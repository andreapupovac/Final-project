#installs the dplyr package 
install.packages("dplyr") 
#reads the dplyr package into R
library(dplyr)
#install the stringr package for later use 
install.packages("stringr")
# reads stringr package into R 
library(stringr)



#1.DOWNLOADING AND READING THE DATA 

#checks if subdirectory data exists - if not creates that subdirectory 
  dir.create("./data")


# stores the url for the data in the fileUrl variable 
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


#Download the dataset 
# created destfile in subdirectory data where I am downloading the zipped data
# using method="curl" because I am working on a MacOS and it is an https link 
download.file(fileUrl,destfile= "./data/df.zip", method = "curl")

#unzipping data and extracting contents to subdirectory data 
unzip(zipfile = "./data/df.zip", exdir = "./data")

#exploring the files that now exist in the data directory 
list.files("./data")
list.files("./data/UCI HAR Dataset")
#from README - in UCI HAR Dataset X_train.txt is the training set while y_train.txt is the training label
##, X_test.txt is the test set and y_test.txt is the test labels
#subject_train.txt" identifies the subject who performed the activity
#subject_test.txt" identifies the subject who performed the activity
#activity_labels.txt links the class labels with their activity name.
#features_info.txt': Shows information about the variables used on the feature vector.
#features.txt': List of all features.


# reading each of these tables 
train_set<- read.table("data/UCI HAR Dataset/train/X_train.txt")
train_label<-read.table("data/UCI HAR Dataset/train/y_train.txt") 
test_set<-read.table ("data/UCI HAR Dataset/test/X_test.txt")
test_label<-read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("data/UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("data/UCI HAR Dataset/test/subject_test.txt")
activityLabels<-read.table("data/UCI HAR Dataset/activity_labels.txt")
features<- read.table("data/UCI HAR Dataset/features.txt")



#####################################################################################################################################################

#2. MERGINING THE DATA 

# renaming columns of activities so as to be able to merge 
colnames(activityLabels) <- c("activityLabel", "activityType")
colnames(test_label) <- "activityLabel" #renaming this to activitly label which is the information it dispalys ( so it can be merged by this col)
colnames(train_label)<- "activityLabel" #renaming this to activitly label which is the information it dispalys ( so it can be merged by this col)
colnames(train_set) <- features[, 2] # renaiming these so that they are labeled with their appropriate feature as the col 
colnames(test_set)<- features[, 2]# renaiming these so that they are labeled with their appropriate feature as the col 
colnames(subject_train)<-"ID"# naming this columns ID so that can be merged by subject ID 
colnames(subject_test)<- "ID"# naming this columns ID so that can be merged by subject ID 

train <- cbind(train_label, subject_train, train_set)
test <- cbind(test_label, subject_test, test_set)
cleandata <- rbind(train, test)
cleandata 

#####################################################################################################################################################

#3. EXTRACTING THE APPROPRIATE MEASUREMENTS 
mean_and_std <- grepl("activityLabel|ID|mean\\(\\)|std\\(\\)", colnames(cleandata))
mean_std <- cleandata[, mean_and_std]
mean_std 


#####################################################################################################################################################
# 4.USE DESCRIPTIVE ACTIVITY NAMES 
df_acitivty_names <- merge(mean_std, activityLabels, by = "activityLabel", all.x = TRUE)



#####################################################################################################################################################

#5. RENAMING COLUNMS USING REPLACE ALL FUNCTION
colnames(df_acitivty_names) <- str_replace_all(colnames(df_acitivty_names),
                                  c("^t" = "time", "^f" = "frequency","Acc" = "Accelerometer", 
                                  "Gyro" = "Gyroscope","Mag" = "Magnitude", "BodyBody" = "Body"))

#####################################################################################################################################################


# 6. CREATING TIDY DATASET WITH AVERAGE FOR EACH ACTIVITY AND SUBJECT 
tidy_dataset <- df_acitivty_names %>%
  group_by(ID, activityLabel, activityType) %>%
  summarise_all(mean)
tidy_dataset

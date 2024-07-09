# Project Overview

This project involves the creation of a clean dataset by performing various data cleaning and transformation tasks on the Human Activity Recognition Using Smartphones Dataset. The goal is to produce a tidy data set with the average of each variable for each activity and each subject.

## Instructions

Before running the script, ensure that you have the following R packages installed:
- `dplyr`
- `stringr`

You can install them using the following commands:

```R
install.packages("dplyr")
install.packages("stringr")
```
## Script Steps

### Downloading and Reading the Data

- Creates the `./data` subdirectory.
- Downloads the dataset from the provided URL and unzips it into the `./data` directory.
- Reads the necessary tables from the unzipped original dataset into R.

### Merging the Data

- Rename the columns of the tables including information about the training and test sets with the appropriate labels for easier merging.
- Merges the training and test set tables by columns to create one complete dataset.

### Extracting the Appropriate Measurements

- Extract only the measurements on the mean and standard deviation for each measurement.

### Using Descriptive Activity Names

- Uses descriptive activity names to name the activities in the dataset.

### Labeling the Data Set with Descriptive Variable Names

- Appropriately label the dataset with descriptive variable names.

### Creating a Tidy Dataset

- From the dataset in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the Script

To run the script, ensure that it is located in your working directory and execute the following command in R:

```R
source("run_analysis.R")
```

## Output

The script will output a tidy dataset named `tidy_dataset`, which contains the average of each variable for each activity and each subject.

## NOTES 
- The script uses the `curl` method for downloading the dataset because it works well with HTTPS links on macOS. If you are using a different operating system, you might need to modify this method.



# Coursera "Getting and Cleaning Data": Course Assignment

This repository contains the reproducible analysis for getting and cleaning a dataset that contains measurements of a Samsung wearable regarding human acitivity recognition. Further information regarding the data can be found under http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


## Repository Content

The folder *script* contains the R code to reproduce all steps that have been carried out. The file *initial_setup.R* contains code that creates the three folders and downloads the data. *run_analysis.R* contains the code that does the data cleaning task. *reshape_data.R* is optional and contains code to reshape the data into a longer format. 

The folder *data* contains the downloaded raw data in a zip-file as well as the unzipped data in an own folder.

The folder *output* contains the cleaned data set and the [codebook](https://github.com/renesiodlaczek/coursera_getting_cleaning_data/blob/main/output/generate_codebook.md) incl. a R Markdown file to generate the codebook.

Furthermore the repository contains an .Rproj file, an .gitignore file and the readme.


## Description of the R scripts

In all scripts only base R is used.

### Initial Setup

In *initial_setup.R* first of the three folders data, script and output are generated in the current working directory to make this step reproducible, too. Furthermore the data zip-file is downloaded and unzipped via R.

### Main Analysis

In *run_analysis.R* the downloaded data is read into the global environment. Because the complete dataset is split into separate files, multiple files need to be loaded. For both the training and testing data the activity labels and subject ids are immediately binded to the respecitve dataset.

After this the following data transformation steps are carried out:

1. The training and the test sets are merged to create one data set.
2. The measurements on the mean and standard deviation for each measurement are extracted. Only measurements with *mean()* and *std()* are selected.
3. Descriptive activity names are added to name the activities in the dataset. The activity names come frome a separate dataset.
4. The previously unnamed columns are labelled with descriptive variable names from another separate vector. The names are then cleaned to not include special characters and to only include lowercase letters separated by hyphen or underscore. This ensures that the data can be read by both human beings and computer programs without problems.
5. From the dataset in step 4 a second, independent tidy dataset is created with the average of each variable for each activity and each subject.
6. The resulting dataset is saved as a csv-file in the output folder.



### Optional Reshaping into a longer Format

In *reshape_data.R* the dataset from the previous file is reshaped into a longer format. The variables are split based on the signal domain *time (t)* and *frequency (f)*. This is just for trying out the function. For the coursera assignment the previous dataset in a wide format is used.


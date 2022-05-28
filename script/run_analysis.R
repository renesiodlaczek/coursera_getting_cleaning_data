# Download and unzip the dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "data/samsung_wearable.zip")

unzip("data/samsung_wearable.zip", exdir = "data", )

# Load data into R global environment
dat_training <- read.table("data/UCI HAR Dataset/train/X_train.txt")
activity_labels_train <- read.table("data/UCI HAR Dataset/train/y_train.txt", col.names = "activity_label")
subject_id_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")

dat_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
activity_labels_test <- read.table("data/UCI HAR Dataset/test/y_test.txt", col.names = "activity_label")
subject_id_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")

feature_names <- read.table("data/UCI HAR Dataset/features.txt", colClasses = c("NULL", "character"))
feature_names <- as.vector(feature_names[, "V2"])

activity_names <- read.table("data/UCI HAR Dataset/activity_labels.txt",
                             col.names = c("activity_label", "activity_name"))

# Add activity labels and subject id to complete the datasets
dat_training <- cbind(dat_training, activity_labels_train, subject_id_train)
dat_test <- cbind(dat_test, activity_labels_test, subject_id_test)
rm(activity_labels_train, subject_id_train, activity_labels_test, subject_id_test)


#### Begin of the Analysis ---------

# 1 Merge the training and the test sets to create one data set.
dat <- rbind(dat_training, dat_test) 

# 2 Extract the measurements on the mean and standard deviation for each
# measurement
# activity label and subject id are on position 562 and 563
dat <- dat[, c(562:563, grep("mean", feature_names), grep("std", feature_names))] 

# 3 Adds descriptive activity names to name the activities in the data set
dat <- merge(dat, activity_names, by = "activity_label", )

# 4 Appropriately labels the (unnamed) columns with descriptive variable names
names(dat)[3:81] <- feature_names[c(grep("mean", feature_names), grep("std", feature_names))]
dat$activity_label <- NULL

# 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 
dat_tidy <- aggregate(dat, 
                      by = list(dat$activity_name, dat$subject_id),
                      FUN = mean
                      )
    
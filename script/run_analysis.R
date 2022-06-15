#### Loading and initial data transformation --------

# Load data into R global environment
dat_training <- read.table("data/UCI HAR Dataset/train/X_train.txt")
activity_labels_train <- read.table("data/UCI HAR Dataset/train/y_train.txt", 
                                    col.names = "activity_label")
subject_id_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", 
                               col.names = "subject_id")

dat_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
activity_labels_test <- read.table("data/UCI HAR Dataset/test/y_test.txt", 
                                   col.names = "activity_label")
subject_id_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", 
                              col.names = "subject_id")

feature_names <- read.table("data/UCI HAR Dataset/features.txt", 
                            colClasses = c("NULL", "character"))
feature_names <- feature_names[["V2"]] # creates a vector

activity_names <- read.table("data/UCI HAR Dataset/activity_labels.txt",
                             col.names = c("activity_label", "activity_name"))

# Add activity labels and subject id to complete the datasets
dat_training <- cbind(dat_training, activity_labels_train, subject_id_train)
dat_test <- cbind(dat_test, activity_labels_test, subject_id_test)

# Remove data that is not needed anymore
rm(activity_labels_train, subject_id_train, activity_labels_test, subject_id_test)


#### Begin of the Analysis ---------

# 1 Merge the training and the test sets to create one data set.
dat <- rbind(dat_training, dat_test) 

# 2 Extract the measurements on the mean and standard deviation for each
# measurement
dat <- dat[c(grep("activity_label|subject_id", names(dat)), 
             grep("mean\\(\\)|std\\(\\)", feature_names))
           ] 

# 3 Adds descriptive activity names to name the activities in the data set
dat <- merge(dat, activity_names, by = "activity_label")
dat$activity_label <- NULL # drop not needed column

# 4 Appropriately labels the (unnamed) columns with descriptive variable names
names(dat)[grep("^V", names(dat))] <- 
    feature_names[grep("mean\\(\\)|std\\(\\)", feature_names)]
names(dat) <- gsub("\\(|\\)", "", names(dat))
names(dat) <- gsub("\\-", "_", names(dat))
names(dat) <- gsub("^(t|f)(.*)$", "\\1-\\2", names(dat))
names(dat) <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2", names(dat))
names(dat) <- tolower(names(dat))

# 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 
dat_aggregate <- aggregate(dat[grep("^(t|f)", names(dat))], 
                           by = list("subject" = dat$subject_id,
                                     "activity" = dat$activity_name),
                           FUN = mean
                           )
# Save the data
write.csv(dat_aggregate, "output/samsung_wearable_tidy.csv", row.names = FALSE)
write.table(dat_aggregate, "output/samsung_wearable_tidy.txt", row.names = FALSE)


# Create folders
lapply(c("data", "script", "output"),
       function(x) if(!file.exists(x)) dir.create(x)
)

# Download and unzip the dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "data/samsung_wearable.zip")

unzip("data/samsung_wearable.zip", exdir = "data", )

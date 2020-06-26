library(dplyr) ## dplyr is the package that will be used in this analysis

## download the file, if it doesn't exists
if (!file.exists("Coursera_DS3_Final.zip")) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile = "Coursera_DS3_Final.zip")
        
}

unzip("Coursera_DS3_Final.zip")         ## unzipping the downloaded file /zipped file
setwd("./UCI HAR Dataset")              ## setting directory to the dataset

## read all the necessary data
## assign the columns names n and functions
features <- read.table("./features.txt", col.names = c("n", "functions")) 

## assign the column names based on features$functions for both x values
x_test <- read.table("./test/X_test.txt", col.names = features$functions)       
x_train <- read.table("./train/X_train.txt", col.names = features$functions)    

## assign the column name id for both y values
y_test <- read.table("./test/y_test.txt", col.names = "id")
y_train <- read.table("./train/y_train.txt", col.names = "id")

## assign the column names subject for both subject values
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")

## rbind is a function that combined both table using row as the binder paramter
x_bind <- rbind(x_test, x_train)
y_bind <- rbind(y_test, y_train)
subject_binded <- rbind(subject_test, subject_train)

## Merged all three data into one main data using column bind (cbind) function
MergedData <- cbind(subject_binded, x_bind, y_bind)

## using piping method, select function will take the certain column within the data based on parameter mentioned
## in this case column equals subject, id, contains("mean"), and contains ("std")
data <- MergedData %>% select(subject, id, contains("mean"), contains("std"))

## This will assign the id column in the data with activites dataset with data$id as row parameter and column number 2 as column parameter
data$id <- activites[data$id, 2]

## Change the data name to descriptive variable names
## gsub function will look through a pattern and replaced with a character we assigned
names(data)[2] <- "activity"
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^freq", "Frequency", names(data), ignore.case = T)
names(data) <- gsub("-mean()", "Mean", names(data), ignore.case = T)
names(data) <- gsub("-std()", "STD", names(data), ignore.case = T)
names(data) <- gsub("angle", "Angle", names(data))
names(data) <- gsub("gravity", "Gravity", names(data))

## using the piping method, group the data by activity and summarize all with funs(mean) as the parameter
FinalData <- data %>% group_by(subject, activity) %>% 
        summarise_all(funs(mean))

## return the tidy table by write.table functions
write.table(FinalData, "Final Data2.txt", row.names = F)



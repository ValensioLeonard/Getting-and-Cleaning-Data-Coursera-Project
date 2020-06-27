# Getting-and-Cleaning-Data-Coursera-Project
Coursera Getting and Cleaning Data Final Assignment

## Dataset
### UCI HAR Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files
1. **Rscript** contain the scripts needed to perform the analysis,
    *run_analyis.R* perform these following actions,
     1. Merge the test and training data into one MergedData
     2. Take only the mean and standard deviation for each measurement
     3. Assign activity names based on id of the datasets
     4. Changed the data column names into descriptive names
     5. Create a second independent data with mean for every subject and activity
     6. Return the tidy datasets into a new .txt file
     
2. **Final Data.txt** is the final datasets exported from the run_analyisis.R script
3. **Codebook.md** is the explanation of the steps and data used in this assignment

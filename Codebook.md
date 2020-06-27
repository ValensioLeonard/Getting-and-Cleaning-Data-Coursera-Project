The run_analysis.R script main function is to prepare data taken from UCI HAR Dataset and turns it into tidy datasets

download the datasets
data was taken from the link provided, unzip the file to retrieve the data.

Step 1: Read the data and assign it into variables
take the .txt file from the dataset, assign it into variables
features <- features.txt 
activities <- activity_labels.txt, etc

Step 2: Merge the test sets and train sets using row bind and column bind function
combine x_test and x_train using rbind function and assign it into x_bind variable.
combine y_test and y_train using rbind function and assign it into y_bind variable.
combine subject_test and subject_train using rbind function and assign it into subject_binded variable.
combine all data (x_bind, y_bind, and subject_binded) into new data using cbind (columnbind) and assign it into MergedData variable.

Step 3 : Take only the data with column subject, id, contains("mean"), contains("std")
take MergedData and select the column needed using select function, assign the new sets to variable named data.

Step 4 : Change the id into activity names
change the data$id column into acivity names by assigning activities data to data$id

Step 5: Change the data column names into descriptive variable names
change the name of the column using gsub function, this function will change based on a pattern we put.

Step 6 : Group the data by activity and summarize the data with  average of each variable for each activity and each subject
using the group_by function with subject and activity as the parameter
using the summarise_all function with function mean as the parameter
assign the new sets to FinalData variable

Step 7 : Write the tidy data
Write the FinalData as .txt file using write.table and row.names equals false.

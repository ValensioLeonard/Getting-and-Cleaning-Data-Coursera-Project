## The run_analysis.R script main function is to prepare data taken from UCI HAR Dataset and turns it into tidy datasets

*download the datasets
data was taken from the link provided, unzip the file to retrieve the data.*

**Step 1: Read the data and assign it into variables**
  1.  take the .txt file from the dataset, assign it into variables
  2.  features <- features.txt 
  3.  activities <- activity_labels.txt, etc

**Step 2: Merge the test sets and train sets using row bind and column bind function**
  1.  combine x_test and x_train using rbind function and assign it into x_bind variable.
  2.  combine y_test and y_train using rbind function and assign it into y_bind variable.
  3.  combine subject_test and subject_train using rbind function and assign it into subject_binded variable.
  4.  combine all data (x_bind, y_bind, and subject_binded) into new data using cbind (columnbind) and assign it into MergedData variable.

**Step 3 : Take only the data with column subject, id, contains("mean"), contains("std")**
  1.  take MergedData and select the column needed using select function, assign the new sets to variable named data.

**Step 4 : Change the id into activity names**
  1.  change the data$id column into acivity names by assigning activities data to data$id

**Step 5: Change the data column names into descriptive variable names**
  1.  change the name of the column using gsub function, this function will change based on a p attern we put.

**Step 6 : Group the data by activity and summarize the data with  average of each variable for each activity and each subject**
  1.  using the group_by function with subject and activity as the parameter
  2.  using the summarise_all function with function mean as the parameter
  3.  assign the new sets to FinalData variable

**Step 7 : Write the tidy data**
  1.  Write the FinalData as .txt file using write.table and row.names equals false.

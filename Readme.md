Inorder to run the run_analysis script, you should download the Dataset.zip file to your local machine and unzip the content of the zip file.

Set your working directory(setwd) to the location of the downloaded files.

The 'run_analysis.R' script will load the following datasets to R. (reference the readme.txt file located in the 'getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset\' directory
of the downloaded file for more information)

* features.txt': List of all features.
* X_train.txt': Training set
* y_train.txt': Training labels
* X_test.txt': Test set
* y_test.txt': Test labels
* subject_train.txt: Subject training id
* subject_test.txt: Subject test id

The 'run_analysis.R' script inserts the column header(names) to each of these datasets. The 'y_train' dataset contains the activities which are coded in numbers 1-6. 
The 'run_analysis.R'script renames these codes with the activity_label defined in the 'activity_label.txt' file[1.WALKING,2.WALKING_UPSTAIRS,3.WALKING_DOWNSTAIRS,4.SITTING,5.STANDING,6.LAYING].
At this point, all the dataset noted above are then merged together by the 'run_analysis.R'script.

The columns noted below are extracted from the merged dataset and set to a new dataset -'finalDataset' which is written to a text file named 'finalDataset.txt'
 

* id               
* Activity"          
* tBodyAcc-mean()-X 
* tBodyAcc-mean()-Y 
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X  
* tBodyAcc-std()-Y  
* tBodyAcc-std()-Z

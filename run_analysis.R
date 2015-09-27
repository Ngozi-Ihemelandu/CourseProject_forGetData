#load the dplyr package
library(dplyr)
#With reference to the readme.txt file located in the downloaded 'getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset directory,
#we will need to load all relevant dataset to R. 

#Get the dataset of - features.txt': List of all features.
feature.Header <- read.table("features.txt") 
feature.Header <- feature.Header[2]
#Transpose the feature.Header data.frame such that the layout is horizontal
feature.Header <- t(feature.Header)
#Coerce the class to a charcater vector
feature.Header <- as.character(feature.Header)

#Get the Training dataset  - X_train.txt': 
trainDataset <- read.table("X_train.txt")
#Insert the feature.Header(column names) to the trainDataset dataframe
colnames(trainDataset) <- feature.Header

#Get the Training labels- y_train.txt': and insert the column name "Activity"
trainLabelDataset <- read.table("y_train.txt")
colnames(trainLabelDataset) = c("Activity")

#This dataset contains the activity codes. We need to rename these codes with the activity_label defined in the 'activity_label.txt' file
#[1.WALKING,2.WALKING_UPSTAIRS,3.WALKING_DOWNSTAIRS,4.SITTING,5.STANDING,6.LAYING] and merge it to the trainDataset dataset
trainLabelDataset <- mutate(trainLabelDataset, Activity = factor(Activity, labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))

#Merge the trainLabelDataset dataset with the trainDataset dataset
trainDataset <- cbind(trainLabelDataset,trainDataset)

#Get the identities of the subject who performed the activities - subject_train.txt
ids <- read.table("subject_train.txt")
colnames(ids) = c("id")
#Merge the ids dataset with the trainDataset dataset
trainDataset <- cbind(ids,trainDataset)

#Now we need to get the test dataset and Merge of the different test dataset together
#Get the Test dataset  - X_train.txt': 
testDataset <- read.table("X_test.txt")
#Insert the feature.Header(column names) to the testDataset dataframe
colnames(testDataset) <- feature.Header
#Get the Test labels- y_test.txt: "
testLabelDataset <- read.table("y_test.txt")
colnames(testLabelDataset) = c("Activity")

#This dataset contains the activity codes. We need to rename these codes with the activity_label defined in the 'activity_label.txt' file
#[1.WALKING,2.WALKING_UPSTAIRS,3.WALKING_DOWNSTAIRS,4.SITTING,5.STANDING,6.LAYING] and merge it to the trainDataset dataset
testLabelDataset <- mutate(testLabelDataset, Activity = factor(Activity, labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))

#Merge the testLabelDataset dataset with the testDataset dataset
testDataset <- cbind(testLabelDataset,testDataset)

#Get the identities of the subject who performed the activities - subject_test.txt
idsTest <- read.table("subject_test.txt")
colnames(idsTest) = c("id")
#Merge the ids dataset with the trainDataset dataset
testDataset <- cbind(idsTest,testDataset)

#Merge the training and the test sets to create one data set.
trainDataset <- rbind(trainDataset,testDataset)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
finalDataset <- trainDataset[,1:8,426:429]
#finalDataset <- group_by(finalDataset,Activity,id)
#summarise(finalDataset,meantBodyAccX = mean("tBodyAcc-mean()-X", rm.na = TRUE))

write.table(finalDataset,"finalDataset.txt",row.name=FALSE ) 


## Read metadata (such as variable names)
variables     <- read.table( "UCI HAR Dataset/features.txt" )
activities    <- read.table( "UCI HAR Dataset/activity_labels.txt" )

## Read raw data
subject_train  <-  read.table("UCI HAR Dataset/train/subject_train.txt")
X_train        <-  read.table("UCI HAR Dataset/train/X_train.txt")
y_train        <-  read.table("UCI HAR Dataset/train/y_train.txt")

subject_test   <-  read.table("UCI HAR Dataset/test/subject_test.txt")
X_test         <-  read.table("UCI HAR Dataset/test/X_test.txt")
y_test         <-  read.table("UCI HAR Dataset/test/y_test.txt")

## Merge test and train data
subject    <-  rbind( subject_train, subject_test )
feat.vec   <-  rbind( X_train, X_test )
activity   <-  rbind( y_train, y_test )

## Extract relevant mean and std variables
u.std.cols     <- grep("mean\\(\\)|std\\(\\)", variables[,2])
u.std.feat.vec <- feat.vec[,u.std.cols]

## Re-label activity as text instead of number
activity <- factor( activity$V1,
                    levels = activities[,1],
                    labels = activities[,2]) 

## Merge all variables into a data frame
data.set.1  <-  cbind( subject, activity, u.std.feat.vec )

## Set column names
varnames  <-  variables[u.std.cols,2]
varnames  <-  gsub( "\\(|\\)","", varnames )
varnames  <-  gsub( "-","_", varnames )

colnames( data.set.1 )  <-  c( "subject", "activity", varnames )

## Average over subject and activity
library(dplyr)
data.set.2  <-  data.set.1 %>% 
                group_by( subject, activity ) %>% 
                summarise_each( funs(mean) )

write.table( data.set.2, file="averagedMeanAndStdData.txt",row.name=FALSE )



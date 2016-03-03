### I have taken some  code from other sources to make my project work 



run_analysis<-function(){


setwd("/home/sean/R/Assignment")

if(!file.exists("UCI HAR Dataset")){         

dir.create("UCI HAR Dataset")

}

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./UCI HAR Dataset.zip", method ="curl")

dateDownloaded<-date()

 

####Borrowed CODE http://www.randomo.space
#testing Data 

X_test<-read.table("./UCI HAR Dataset /test/X_test.txt")

y_test<-read.table("./UCI HAR Dataset /test/y_test.txt")

subject_test<-read.table("./UCI HAR Dataset /test/subject_test.txt")

X_train<-read.table("./UCI HAR Dataset /train/X_train.txt")

y_train<-read.table("./UCI HAR Dataset /train/y_train.txt")

subject_train<-read.table("./UCI HAR Dataset /train/subject_train.txt")

features<-read.table("./UCI HAR Dataset /features.txt")

activity<-read.table("./UCI HAR Dataset /activity_labels.txt")

 


dim(X_test)

dim(y_test)

dim(subject_test)

dim(X_train)

dim(y_train)

dim(subject_train)

dim(features)

dim(activity)


 



Raw<-rbind(X_test,X_train)

ActivityID<-rbind(y_test,y_train)

subjectID<-rbind(subject_test,subject_train)

Features_inc<-grep("-mean\(\)|-std\(\)",features[,2])

dim(Raw)

dim(ActivityID)

dim(subjectID)

 


colnames(subjectID)<-"SubID"

 

library(plyr)

Activity<-join(ActivityID,activity)

Activity2<-Activity[,2]

Activity2<-data.frame(Activity2)

colnames(Activity2)<-"Activity_Label"

 



Raw<-Raw[,Features_inc]

names(Raw)<-gsub("\(|\)","",features$V2[Features_inc])

 



Alldata<-cbind(subjectID,Raw,Activity2)

write.table(Alldata,"merged_Alldata.txt")

 




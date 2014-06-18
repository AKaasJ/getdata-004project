#project

#Reading tables

xtest<-read.table("UCI HAR Dataset\\test\\X_test.txt")
ytest<-read.table("UCI HAR Dataset\\test\\y_test.txt")
subjecttest<-read.table("UCI HAR Dataset\\test\\subject_test.txt")

xtrain<-read.table("UCI HAR Dataset\\train\\X_train.txt")
ytrain<-read.table("UCI HAR Dataset\\train\\y_train.txt")
subjecttrain<-read.table("UCI HAR Dataset\\train\\subject_train.txt")

#load features, use as column names
features<-read.table("UCI HAR Dataset\\features.txt")

#Combining tables into dataset
testdata<-cbind(subjecttest,ytest,xtest)
traindata<-cbind(subjecttrain,ytrain,xtrain)
data<-rbind(testdata,traindata)
data<-data

#formatting "data"
colnames(data)[3:563] <- as.character(features[1:561,2])
colnames(data)[1:2]<-c("ID","Activity")

#Formatting activities from numeric to character
data[data[,2] == 1,2] <- "WALKING"
data[data[,2] == 2,2] <- "WALKING_UPSTAIRS"
data[data[,2] == 3,2] <- "WALKING_DOWNSTAIRS"
data[data[,2] == 4,2] <- "SITTING"
data[data[,2] == 5,2] <- "STANDING"
data[data[,2] == 6,2] <- "LAYING"

#finding all columns containing mean and std
meancol<-grep("mean",as.character(features[,2]))+2
stdcol<-grep("std",as.character(features[,2]))+2

#Chooses which columns to keep (1,2, mean and std) removes all others
coltokeep<-c(1,2,meancol,stdcol)
data<-data[,coltokeep]

#Orders data, ID first then activity, and removes rownames
data<-data[order(data[,1],data[,2]),]
row.names(data)<-NULL

#creates vector containing the activities
activities<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#I didn't know how to do this without nested for loops, any suggestions are welcome!

#Use nested for-loops to generate df (the tidydata dataframe)
df<-data.frame() #intialize dataframe
#loops through activities
for (x in 1:6){ #6 could be length of activities
  #loops through IDs
  for (y in 1:30){ #30 could be max(data[,1])
    #loops through variables
    for (z in 3:81){ #81 could be dim(data)[2]
      
      #inserts data into data frame (df) aka. the tidydata dataframe
      df[y+(30*(x-1)),1]<-y
      df[y+(30*(x-1)),2]<-activities[x]
      df[y+(30*(x-1)),z]<-(mean(data[which(data[,1]==y & data[,2] == activities[x]),z]))
      
      
    }
    
  }
  
}

#last formatting, attaching columnnames, ordering and removing rownames
colnames(df)<-colnames(data)
df<-df[order(df[,1],df[,2]),]
row.names(df)<-NULL

#After the script has been run the data frame df will contain a tidy dataset.

#Call Libraries That using in this Project

library(data.table)
library(reshape2)

#Set Working Directory
setwd("~//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset")

#UsiNG DataTable To match Column Names with Raw Data
xtest <- fread(".//test//X_test.txt", col.names = fread("features.txt", header = FALSE)$V2)
xtrain <- fread(".//train//X_train.txt", col.names = fread("features.txt", header = FALSE)$V2)

#Read Other Files (Activities and Pariticipants)
subtest <- read.table(".//test//subject_test.txt", header = FALSE)
ytest <- read.table(".//test//y_test.txt", header = FALSE)

subtrain <- read.table(".//train//subject_train.txt", header = FALSE)
ytrain <- read.table(".//train//y_train.txt", header = FALSE)

#Merge 2 data Test and Train
merged <- rbind(xtest,xtrain)

#Extract Mean() MeanFeq() and Std() to new Data Table
cols <- grep("mean|std", names(merged))
extracted <- merged[, ..cols]

#Combine test , train Participants and Activities
sub <- rbind(subtest,subtrain)
yyy <- rbind(ytest,ytrain)

#Final Combine with all the data and Naming Participants and Activities Column
combined <- cbind(sub,yyy,extracted)
colnames(combined)[c(1,2)] <- c("Participants", "Activities")


#Change the data of Activities to be Descriptive
combined[,2] <- factor(combined[,2], labels=c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#Change the dataset column names  to be Descriptive
names(combined) <- sub("^t","Time_",names(combined))
names(combined) <- sub("^f","Frequency_domain_signals_",names(combined))
names(combined) <- sub("Jerk","_Jerk_Signal_",names(combined))
names(combined) <- sub("Mag","Euclidean_norm",names(combined))


#Melt and cast the ata set with the average of each variable for each activity and each subject.
melted <- melt(combined, id=c("Participants","Activities"))
done <- dcast(melted, Participants+Activities ~ variable, mean)

write.table(done,"done.csv",row.names = FALSE)

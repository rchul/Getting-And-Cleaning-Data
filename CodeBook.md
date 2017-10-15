This code book explaining the purpose of the project and method of tidying the data set.

# Introduction

30 Participant using the smart device which capture their movement in 3 dimensional sense and translate to numbers.

# Raw Data

features.rxt : Name of the columns for both x_test & x_train

activity_labels.txt : Names of Activites for the y_test & y_train , 2 columns range from 1 - 6 which translate to 6 activities.

x_train.txt : Observation Volunteers , First Part (21 Participants)

x_test.txt : Remaining 9 Participants

y_test : Indicate Activites commited by 9 participants and how many times

x_test : Indicate Activites commited by 21 participants and how many times 

More Information About Raw data included in Reamdme.txt

# Process
1. Organizing and merging data that needs to be use for the project.
2. Match the columns name file and data given.
4. Extract only columns that include mean() std() and also meanFeq().
5. Name the Participants column and Activites for easy data management.
6. Make activities column data descriptive using factor() as well as naming dataset with descriptive label.
7. Melt for long table data and using reshape2 dcast() to reshape the data with the average of each variable for each activity and each subject.

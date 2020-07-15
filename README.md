Initial Data for Research

The script was created to analyze data from the UCI Har Dataset.

The following files from the dataset used:
    1.features.txt - includes the descriptions for features measured
    2.train/X_train.txt - includes the measurements of the features in            train set (one row - 1 measurement of 561 features)
    3.test/X_test.txt - includes the measurements of the features in             test set
    4.train/subject_train.txt - subject for each measurement from the            train set
    5.test/subject_test.txt - subject for each measurement from the              test set
    6.train/y_train.txt - activity (from 1 to 6) for each measurement            from the train set
    7.test/y_test.txt - activity (from 1 to 6) for each measurement              from the test set





How the script works:
The script includes the following steps.

1. Data is loaded into R and Train and Test Data is merged. 
2. Data pertaining to mean and standard deviation is isolated to         create bound data. 
3. Bound data column names are cleaned; Abbreviations removed, First     letter of words capitalized, Unnecessary characters remvoed. 
4. Subject, Actvity Label, and Mean and Standard Deviation data bound     to create final data set. 
5. Second created data set takes the mean of cleaned data and groups     it by Subject and Activity 
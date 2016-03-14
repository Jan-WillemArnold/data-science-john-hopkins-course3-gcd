# initialize environment

packages <- c("utils", "arules", "dplyr")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
   install.packages(setdiff(packages, rownames(installed.packages())))  
}

library("utils")
library(arules)
library(dplyr)

mainDir <- "~/Documents/coursera/gcd"
subDir <- "finalproject"
outDir <- "output"

# create working directory (to prevent messing up my computer)
dir.create(file.path(mainDir, subDir), showWarnings = FALSE)
dir.create(file.path(mainDir, subDir, outDir), showWarnings = FALSE)

# working directory to project directory
setwd(file.path(mainDir, subDir))

# check working directory
cat ("working directory: ", getwd(), "\n" )

# clean output directory, delete previuous ouput 
fl = file.path(outDir, "mergedData.txt")
if (file.exists(fl)) ? file.remove(fl) 

fl = file.path(outDir, "selectedData.txt")
if (file.exists(fl)) ? file.remove(fl)

fl = file.path(outDir, "avgData.txt")
if (file.exists(fl)) ? file.remove(fl)

# >> here the real work starts

# get the data files
zipfile = "uci_har_data.zip"

if (!file.exists(zipfile)) {
   download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipfile)
   unzip(zipfile)
}


# read all data and definition files
dftrain     <- read.table("UCI HAR Dataset/train/X_train.txt")
dftest      <- read.table("UCI HAR Dataset/test/X_test.txt")
dfytrain    <- read.table("UCI HAR Dataset/train/y_train.txt")
dfytest     <- read.table("UCI HAR Dataset/test/y_test.txt")
dfsubjtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
dfsubjtest  <- read.table("UCI HAR Dataset/test/subject_test.txt")
dflabels    <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
dfactlabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# append the columns with the activity and the subject
dftrain$activity <- dfytrain$V1
dftest$activity  <- dfytest$V1
dftrain$subject  <- dfsubjtrain$V1
dftest$subject   <- dfsubjtest$V1

# merge vertically and create one big dataframe (note: assignment #1)
dftt <- rbind(dftrain,dftest)

# give feedback on merge, dimensions should be sum and the same
cat ("source 1, dimensions dftrain: ", dim(dftrain), "\n" )
cat ("source 2, dimensions  dftest: ", dim(dftest), "\n" )
cat ("merged,   dimensions    dftt: ", dim(dftt), "\n" )

# add a field activityname with the text value (, and keep the original data)
dftt$activityname <- dfactlabels[dftt$activity, 2]

# add 'activity' and 'subject' to the list of variable labels
i = dim(dflabels)[1]
i = i + 1; dflabels <- rbind(dflabels, c(i, "activity"))
i = i + 1; dflabels <- rbind(dflabels, c(i, "subject"))
i = i + 1; dflabels <- rbind(dflabels, c(i, "activityname"))

# assign variable names - only care about the merged table (note: assignment #4)
names(dftt) <- dflabels$V2

# filter to selected measurements (note: assignment #2)
dfindex <- grep ("(-std)|(-mean)|(activity)|(subject)", dflabels$V2)
dftts <- dftt[, dfindex]

# write the complete file and the selected file
write.table(dftt, file=file.path(outDir, "mergedData.txt") )
write.table(dftts, file=file.path(outDir, "selectedData.txt") )

# calculate the average by subject and by activity
dfttavg <- aggregate(dftts[, 1:79], list(dftts$activityname, dftts$subject), mean)
# set variable names
names(dfttavg)[1] <- "subject"
names(dfttavg)[2] <- "activity"

# write the output file with teh averages
write.table(dfttavg, file=file.path(outDir, "avgData.txt") )

#write codebooks
write.table(names(dftt), file=file.path(outDir, "mergedFeatures.txt") );
write.table(names(dftts), file=file.path(outDir, "selectedFeatures.txt") );
write.table(names(dfttavg), file=file.path(outDir, "avgFeatures.txt") );

# done
cat("run_analysis.R completed")



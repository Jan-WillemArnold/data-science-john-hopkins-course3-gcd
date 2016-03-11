---
title: "README.md"
output: html_document
---

## Repository contents

* Codebook and feature lists
    + codebook.md
    + mergedFeatures.txt
    + selectedFeatures.txt
    + avgDataFeatures.txt
* Script
    + run_analysis.R
* Datasets
    + mergedData.txt
    + selectedData.txt
    + avgData.txt
* README.md (this file)

## Description
This repository contains the processed outcome of the original datasets of the 'Human Activity Recognition Using Smartphones Dataset'. The resulting single dataset contains the by activity and by subject averages on a selection of the original variables, specifically the means and standard deviation of all measurements. The dataset is tidy and contains variable names and value names for the activity variable. 

The result has been derived from the original dataset only by running the included script run_analysis.R. No manual intervention besides this script is needed. 

The original datasets can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Codebook
`avgDataFeatures.txt` contains the list of variables in the output file `avgData.txt`. The codebook is present in codebook.md.

## Running the script
The script requires packages "utils", "arules" and "dplyr", and will attempt to install them. A working directory is set in line 6 of the script to `~/Documents/coursera/gcd/finalproject`. It can be changed if necessary. In this working directory files will be written and deleted. Output will be written in a subdirectory 'output'. The script will end with the message 'run_analysis.R completed'.

The script will output three data files:

* `mergedData.txt`: the combined dataset of the original sets with training and test data.
* `selectedData.txt`: contains only the selected variables.
* `avgData.txt`: the real output, the data by user and by activity, averages on all measurements.

## Author
Jan-Willem Arnold jw@delarte.nl

## Original Dataset
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universita degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

## License
Any usage of this repository is subject to the original license of the project, awhich is as follows. 

Use of this dataset in publications must be acknowledged by referencing the following publication [1]   

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.   

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.   
---
title: "README for Getting and Cleaning Data course project"
author: "Frida Nellros"
date: '2015-03-21'
output: html_document
---
# README for Getting and Cleaning Data course project

## Instructions
To achieve the output averagedMeanAndStdData.txt, described by the CodeBook.md file,
run the script 'run_analysis.R' in working directory containing the 
Activity Recognition data set provided at [this web page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

If you do not yet have the data set, run 'retrieve_data.R' to download and 
extract the files.

For further analysis of the outputted results, load the data frame using the
following command:
```{r}
data <- read.table( 'averagedMeanAndStdData.txt",header = TRUE )
```

Or, to run all described scripts:
```{r}
source("retrieve_data.R")
source("run_analysis.R")
rm(list=ls()) #to clear all that heavy data from in memory
data <- read.table( "averagedMeanAndStdData.txt",header = TRUE ) #to reload results
```

## File contents

### retrieve_data.R
```{r}
d.url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file( d.url, "Dataset.zip", method = "curl" )
unzip( "Dataset.zip" )
```

### run_analysis.R
Performs the following steps:

1. Read metadata (such as variable names)
2. Read raw data
3. Merge test and train data
4. Extract relevant mean and std variables
5. Re-label activity as text instead of number
6. Merge all variables into a data frame
7. Set column names
8. Average over subject and activity

## Requirements
dplyr package



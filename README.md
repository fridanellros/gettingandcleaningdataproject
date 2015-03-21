---
title: "README for Getting and Cleaning Data course project"
author: "Frida Nellros"
date: '2015-03-21'
output: html_document
---


## Instructions
To achieve the output dataframe2.txt, described by the CodeBook.md file,
run the script 'run_analysis.R' in working directory containing the 
Activity Recognition data set provided at [this web page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

If you do not yet have the data set, run 'retrieve_data.R' to download and 
extract the files.

For further analysis of the outputted results, load the data frame using the
following command:
```{r}
data <- read.table( "dataframe2.txt",header = TRUE )
```

Or, running all described scripts:
```{r}
source(retrieve_data.R)
source(run_analysis.R)
rm(list=ls()) #to clear all that heavy data from in memory
data <- read.table( "dataframe2.txt",header = TRUE ) #to reload results
```

## File contents





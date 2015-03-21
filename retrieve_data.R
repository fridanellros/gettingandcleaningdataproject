## Download data
d.url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file( d.url, "Dataset.zip", method = "curl" )

## Unzip file 
unzip( "Dataset.zip" )

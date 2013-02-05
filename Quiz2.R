## Question 2:
## Open a connection to the old version of my blog: 
## http://simplystatistics.tumblr.com/ , read the first 150 lines of the file 
## and assign them to a vector simplyStats. Apply the nchar() function to 
## simplyStats to count the characters in each element of simplyStats. How 
## many characters long are the lines 2, 45, and 122?
con <- url(url="http://simplystatistics.tumblr.com/", open="r")
simplyStats <- readLines(con, n=150)
close(con)
answer2 <- nchar(simplyStats[c(2,45,122)])
answer2

## Question 3:
# The American Community Survey distributes downloadable data about United
# States communities. Download the 2006 microdata survey about housing for the
# state of Idaho using download.file() from here:
# 
# https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv or here
# 
# https://spark-public.s3.amazonaws.com/dataanalysis/ss06hid.csv
# 
# and load the data into R. You will use this data for the next several
# questions. The code book, describing the variable names is here:
# 
# https://dl.dropbox.com/u/7710864/data/PUMSDataDict06.pdf or here:
# 
# https://spark-public.s3.amazonaws.com/dataanalysis/PUMSDataDict06.pdf
# 
# How many housing units in this survey were worth more than $1,000,000?
dataFileURL <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(url=dataFileURL, destfile="data/W2Q3_ss06hid.csv", method="curl")

ID_Survey.df <- read.csv("data/W2Q3_ss06hid.csv")
answer3 <- nrow(ID_Survey.df[ID_Survey.df$VAL==24 & !is.na(ID_Survey.df$VAL),])
answer3

## Question 5:
# Use the data you loaded from Question 3. How many households have 3 bedrooms
# and and 4 total rooms? How many households have 2 bedrooms and 5 total rooms?
# How many households have 2 bedrooms and 7 total rooms?
rooms.df <- data.frame(beds=c(3,2,2), total=c(4,5,7),nHouse=c(rep(NA,3)))
for (i in 1:nrow(rooms.df)) {
  rooms.df$nHouse[i] <- length(which(ID_Survey.df$BDS==rooms.df[i,1] & 
                                       ID_Survey.df$RMS==rooms.df[i,2]))
  # Can also use sum(cond1 & cond2, na.rm=TRUE)
}
answer5 <- rooms.df$nHouse
answer5

## Question 6:
# Use the data from Question 3. Create a logical vector that identifies the
# households on greater than 10 acres who sold more than $10,000 worth of
# agriculture products. Assign that logical vector to the variable
# agricultureLogical. Apply the which() function like this to identify the rows
# of the data frame where the logical vector is TRUE.

# which(agricultureLogical) 

# What are the first 3 values that result?
agricultureLogical <- ID_Survey.df$ACR==3 & ID_Survey.df$AGS==6
answer6 <- which(agricultureLogical)[1:3] # which() treats NAs as FALSE
answer6

## Question 7:
# Use the data from Question 3. Create a logical vector that identifies the
# households on greater than 10 acres who sold more than $10,000 worth of
# agriculture products. Assign that logical vector to the variable
# agricultureLogical. Apply the which() function like this to identify the rows
# of the data frame where the logical vector is TRUE and assign it to the
# variable indexes.
# 
# indexes =  which(agricultureLogical) 
#
# If your data frame for the complete data is called dataFrame you can create a
# data frame with only the above subset with the command:
# 
# subsetDataFrame  = dataFrame[indexes,] 
#
# Note that we are subsetting this way because the NA values in the variables
# will cause problems if you subset directly with the logical statement. How
# many households in the subsetDataFrame have a missing value for the mortgage
# status (MRGX) variable?
indexes <-  which(agricultureLogical)

ID_Survey.df.subset <- ID_Survey.df[indexes,]
answer7 <- nrow(ID_Survey.df.subset[is.na(ID_Survey.df.subset$MRGX),])
answer7

## Question 8: Use the data from Question 3. Apply strsplit() to split all the
# names of the data frame on the characters "wgtp". What is the value of the 123
# element of the resulting list?
answer8 <- strsplit(names(ID_Survey.df),"wgtp")[123]
answer8

## Question 9: What are the 0% and 100% quantiles of the variable YBL? Is there
# anything wrong with these values? Hint: you may need to use the na.rm
# parameter.
answer9 <- quantile(ID_Survey.df$YBL, na.rm=TRUE)[c(1,5)]
answer9

## Question 10: In addition to the data from Question 3, the American Community
# Survey also collects data about populations. Using download.file(), download 
# the population record data from:
#
# https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv
#
# or here
#
# https://spark-public.s3.amazonaws.com/dataanalysis/ss06pid.csv
#
# Load the data into R. Assign the housing data from Question 3 to a data frame 
# housingData and the population data from above to a data frame populationData.
#
# Use the merge command to merge these data sets based only on the common 
# identifier "SERIALNO". What is the dimension of the resulting data set?
#
# [OPTIONAL] For fun, you might look at the data and see what happened when they 
# merged.

download.file("https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv"
              , "data/W2Q10_ss06pid.csv", method="curl")

ID_Pop.df <- read.csv("data/W2Q10_ss06pid.csv")
ID_Pop_Survey.df <- merge(ID_Survey.df,ID_Pop.df,by="SERIALNO", all=TRUE)
answer10 <- dim(ID_Pop_Survey.df)
answer10

answer2;answer3;answer5;answer6;answer7;answer8;answer9;answer10
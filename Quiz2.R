## Question 2:
## Open a connection to the old version of my blog: 
## http://simplystatistics.tumblr.com/ , read the first 150 lines of the file 
## and assign them to a vector simplyStats. Apply the nchar() function to 
## simplyStats to count the characters in each element of simplyStats. How 
## many characters long are the lines 2, 45, and 122?
con <- url("http://simplystatistics.tumblr.com/", "r")
simplyStats <- readLines(con, n=150)
answer <- nchar(simplyStats[c(2,45,122)])
answer

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
dataDictURL <- "https://spark-public.s3.amazonaws.com/dataanalysis/PUMSDataDict06.pdf"
download.file(url=dataFileURL, destfile="data/W2Q3_ss06hid.csv")
download.file(url=dataDictURL, destfile="data/PUMSDataDict06.pdf")
ID_Survey.df <- read.csv("data/W2Q3_ss06hid.csv")
<<<<<<< HEAD
answer <- nrow(ID_Survey.df[ID_Survey.df$VAL==24 & !is.na(ID_Survey.df$VAL),])
answer

## Question 5:
# Use the data you loaded from Question 3. How many households have 3 bedrooms
# and and 4 total rooms? How many households have 2 bedrooms and 5 total rooms?
# How many households have 2 bedrooms and 7 total rooms?
answer <- nrow(ID_Survey.df[ID_Survey.df$BDS==2 & ID_Survey.df$RMS==7 & 
                                 !is.na(ID_Survey.df$BDS) & 
                                 !is.na(ID_Survey.df$RMS),])
answer

## Question 6:
# Use the data from Question 3. Create a logical vector that identifies the
# households on greater than 10 acres who sold more than $10,000 worth of
# agriculture products. Assign that logical vector to the variable
# agricultureLogical. Apply the which() function like this to identify the rows
# of the data frame where the logical vector is TRUE.

# which(agricultureLogical) 

# What are the first 3 values that result?
agricultureLogical <- ID_Survey.df$ACR==3 & !is.na(ID_Survey.df$ACR) & 
  ID_Survey.df$AGS==6 & !is.na(ID_Survey.df$AGS)
which(agricultureLogical)
=======
answer <- nrow(ID_Survey.df[ID_Survey.df$VAL==24,])
answer
>>>>>>> 89034f91a88e019dff702bbdcbaea476b72d60d3

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
answer <- nrow(ID_Survey.df[ID_Survey.df$VAL==24,])
answer

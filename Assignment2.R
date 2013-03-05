download.file('https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda'
              ,"./data/assignment2_orig.rda")

load("./data/assignment2_orig.rda")

dim(samsungData)
str(samsungData)
names(samsungData)

train.data <- samsungData[samsungData$subject %in% c(1,3,5,6),]
test.data <- samsungData[samsungData$subject %in% c(27:30),]
table(train.data$subject)
table(test.data$subject)
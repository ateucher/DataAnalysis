## Download and load data
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/loansData.rda"
              , "data/assignment1_orig.rda")
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/loansCodebook.pdf"
              , "doc/LoansCodeBook.pdf", mode="wb")
load("data/assignment1_orig.rda")

## Check it out
summary(loansData)
str(loansData)
head(loansData)

## Convert fields to appropriate formats
loansData$Interest.Rate <- as.numeric(gsub("%","",loansData$Interest.Rate))/100
loansData$Debt.To.Income.Ratio <- as.numeric(
  gsub("%","",loansData$Debt.To.Income.Ratio))/100
loansData$Amount.Requested <- as.numeric(loansData$Amount.Requested)
loansData$Revolving.CREDIT.Balance <- as.numeric(loansData$Revolving.CREDIT.Balance)

hist(loansData$Interest.Rate)

## Quick visual inspection of all variables against Interest Rate
par(mfrow=c(3,5)) # Plot all graphs in one panel
for (col in 1:ncol(loansData)) {
  if (names(loansData)[col] != "Interest.Rate") {
    plot(loansData[,col], loansData$Interest.Rate, xlab=names(loansData)[col])
  }
  rm(col)
}
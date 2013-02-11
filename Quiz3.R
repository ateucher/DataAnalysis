## Question 3:
# Load the iris data into R using the following commands:
library(datasets)
data(iris)

# Subset the iris data to the first four columns and call this matrix
# irisSubset. Apply hierarchical clustering to the irisSubset data frame to
# cluster the rows. If I cut the dendrogram at a height of 3 how many clusters
# result?
irisSubset <- iris[,1:4]
distIrisSubset <- dist(irisSubset)
hClustering <- hclust(distIrisSubset)
plot(hClustering)

cutted <- cutree(hClustering,h=3)
table(cutted)

## Question 4:
# Load the following data set into R using either the .rda or .csv file:
# 
# https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.rda 
# https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv
# 
# Make a scatterplot of the x versus y values. How many clusters do you observe?
# Perform k-means clustering using your estimate as to the number of clusters.
# Color the scatterplot of the x, y values by what cluster they appear in. Is
# there anything wrong with the resulting cluster estimates?
download.file("https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv", destfile="data/q3question4.csv", method="curl")
q4.df <- read.csv("data/q3question4.csv", row.names=1)
head(q4.df)

plot(q4.df$x,q4.df$y)
q4.kmeans <- kmeans(q4.df,2)
q4.kmeans <- kmeans(q4.df,2, iter.max=100, nstart=10)

plot(q4.df$x,q4.df$y, col=q4.kmeans$cluster, pch=19, cex=1)
points(q4.kmeans$centers, col=1:2, pch=3, cex=3, lwd=3)

## Question 5:
# Load the hand-written digits data using the following commands:
  
library(ElemStatLearn)
data(zip.train)

# Each row of the zip.train data set corresponds to a hand written digit. The
# first column of the zip.train data is the actual digit. The next 256 columns
# are the intensity values for an image of the digit. To visualize the adigit we
# can use the zip2image() function to convert a row into a 16 x 16 matrix:
  
# Create an image matrix for the 3rd row, which is a 4

im = zip2image(zip.train,3)
image(im)

# Using the zip2image file, create an image matrix for the 8th and 18th rows.
# For each image matrix calculate the svd of the matrix (with no scaling). What
# is the percent variance explained by the first singular vector for the image
# from the 8th row? What is the percent variance explained for the image from
# the 18th row? Why is the percent variance lower for the image from the 18th
# row?

summary(zip.train)
dim(zip.train)

## Extract data for appropriate rows and convert to matrices
im8 <- zip2image(zip.train,8)
im18 <- zip2image(zip.train,18)

## Row 8: ################
# compute SVD (no scaling)
im8svd <- svd(im8)

# Plot the image and the first left and right singular vectors
par(mfrow=c(1,3))
image(t(im8)[,nrow(im8):1])
plot(im8svd$u[,1],nrow(im8):1:1,,xlab="Row",ylab="First left singular vector",pch=19)
plot(im8svd$v[,1],xlab="Column",ylab="First right singular vector",pch=19)

# Plot D and the percent variance explained
par(mfrow=c(1,2))
plot(im8svd$d,xlab="Column",ylab="Singluar value",pch=19)
plot(im8svd$d^2/sum(im8svd$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)

# Answer: get the percent variance explained by the first singular vector
im8svd$d[1]^2/sum(im8svd$d^2)

## Row 18: ################
# compute SVD (no scaling)
im18svd <- svd(im18)

# Plot the image and the first left and right singular vectors
par(mfrow=c(1,3))
image(t(im18)[,nrow(im18):1])
plot(im18svd$u[,1],nrow(im18):1:1,,xlab="Row",ylab="First left singular vector",pch=19)
plot(im18svd$v[,1],xlab="Column",ylab="First right singular vector",pch=19)

# Plot D and the percent variance explained
par(mfrow=c(1,2))
plot(im18svd$d,xlab="Column",ylab="Singluar value",pch=19)
plot(im18svd$d^2/sum(im18svd$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)

# Answer: get the percent variance explained by the first singular vector
im18svd$d[1]^2/sum(im18svd$d^2)

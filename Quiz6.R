## Question 3:
install.packages("ElemStatLearn")
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

missClass = function(values,prediction){
  sum(((prediction > 0.5)*1) != values)/length(values)
}

head(SAheart)

lr1 <- glm(chd ~ age + alcohol + obesity + tobacco + typea + ldl, data=trainSA, 
           family="binomial")

lr1.train.predict <- predict(lr1, type="response")
missclass.lr1.train <- missClass(trainSA$chd, lr1.train.predict)

lr1.test.predict <- predict(lr1, newdata=testSA, type="response")
missclass.lr1.test <- missClass(testSA$chd, lr1.test.predict)

## Question 4:
install.packages("pgmm")
library(pgmm)
data(olive)
olive = olive[,-1]

require(tree)

head(olive)

olive.tree <- tree(Area ~ Palmitic + Palmitoleic + Stearic + Oleic + Linoleic + 
                     Linolenic + Arachidic + Eicosenoic, data=olive)

newdata = as.data.frame(t(colMeans(olive)))

predict(olive.tree, newdata)


## Question 5:
olive.tree <- tree(as.factor(Area) ~ Palmitic + Palmitoleic + Stearic + Oleic + Linoleic + 
                     Linolenic + Arachidic + Eicosenoic, data=olive)

plot(olive.tree); text(olive.tree)

olive.tree.pruned <- prune.tree(olive.tree,best=6)

plot(olive.tree.pruned); text(olive.tree.pruned)

newData = data.frame(Palmitic = 1200, Palmitoleic = 120, Stearic=200
                     , Oleic=7000, Linoleic = 900, Linolenic = 32, Arachidic=60
                     , Eicosenoic=6)

predict(olive.tree.pruned, newData)
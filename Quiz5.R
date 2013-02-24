## Question 1:
data(warpbreaks)

summary(warpbreaks)

aov.model <- aov(breaks~wool+tension, data=warpbreaks)
summary(aov.model)

## Question 2:
p <- 0.2
odds.p <- p/(1-p)
log.odds.p <- log(odds.p)
log.odds.p

## Question 3:
require(glm2)
data(crabs)
summary(crabs)
head(crabs)

crabs.pois <- glm2(Satellites ~ Width, data=crabs, family="poisson")
summary(crabs.pois)
exp(0.164)

## Question 4:
exp(-3.30476)*exp(0.16405*22)

## Question 5:
require(MASS)
data(quine)
lm1 = lm(log(Days + 2.5) ~.,data=quine)
step(lm1)
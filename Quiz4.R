download.file("https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt"
              , "./data/movies.txt")
movies.df <- read.delim("./data/movies.txt")
names(movies.df)[1] <- "title"

## Question 1:
lm1 <- lm(movies.df$score ~ movies.df$box.office)
summary(lm1)
answer1 <- lm1$coefficients[2]

## Question 2:
int.90 <- confint(lm1, level=0.90)
answer2 <- int.90["(Intercept)",]

# Question 3:
lm3 <- lm(movies.df$score ~ movies.df$box.office + movies.df$running.time)
summary(lm3)
answer3 <- lm3$coefficients[3]

## Question 4:
summary(lm(movies.df$running.time ~ movies.df$box.office))
summary(lm(movies.df$score ~ movies.df$running.time))

## Question 5:
plot(movies.df$running.time, movies.df$score)
## outliers with greater than ~180m running time
lm4 <- lm(movies.df$score[movies.df$running.time<180] ~ 
            movies.df$box.office[movies.df$running.time<180] + 
            movies.df$running.time[movies.df$running.time<180])
summary(lm3); summary(lm4)

## Question 6:
summary(lm3)

## Question 7:
lm7 <- lm(movies.df$score ~ movies.df$running.time*movies.df$rating)
summary(lm7)
answer7 <- lm7$coefficients


## Question 8:
summary(lm7)
answer8 <- lm7$coefficient["movies.df$running.time"] + 
  lm7$coefficient["movies.df$running.time:movies.df$ratingPG"]

## Question 9:
data(warpbreaks)
head(warpbreaks)
dim(warpbreaks)

lm9 <- lm(warpbreaks$breaks ~ relevel(warpbreaks$tension, ref="H"))
summary(lm9)
confint(lm9)[3,1:2]


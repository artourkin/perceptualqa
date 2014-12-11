
#Useful functions to draw lines.
draw.threshold.vert <- function(){
  abline(v = metric.coef[1], col = 4)
  abline(v = metric.ci[1,1], col = 6)
  abline(v = metric.ci[1,2], col = 6)
  return(0)
}
draw.threshold.hor <- function(){
  abline(h = metric.coef[1], col = 4)
  abline(h = metric.ci[1,1], col = 6)
  abline(h = metric.ci[1,2], col = 6)
  return(0)
}
# Define a function to perform a Bernoulli trial for each value of pHash, 
#   with probability of success for each trial determined by the logistic
#   model with intercept = alpha and coef for pHash = beta.
# The function also plots the outcomes of these Bernoulli trials against the 
#   random temp data, and overlays the curve that corresponds to the model
#   used to simulate the response data.
sim.human <- function(alpha, beta) {
  n <-100 # size of random sample
  metric <- runif(n, 0, 1)  # generate random pHash data (n draws, uniform b/w 0 and 30)
  y <- sapply(metric, function(x) rbinom(1, 1, plogis(alpha + beta*x)))  
  plot(y ~ metric, pch=20, xlab='Human', ylab='Metric')
  curve(plogis(alpha + beta*x), min(metric), max(metric), add=TRUE, lwd=2)    
  return(y)
}


#Loading data.
data <- read.csv("data.csv",header=F, sep = ";")

data_struct <- structure(list(Human = data$V3, Metric = data$V2), .Names = c("Human", "Metric"), 
                 class = "data.frame", row.names = c(NA, -27L))

#Calculating a model using logistic regression.
metric.glm <- glm(Human ~ Metric, data=data_struct, family=binomial)
metric.coef<-(metric.glm$coefficients)
metric.ci<-confint.default(metric.glm)

message("Threshold:")
print( structure(as.numeric( metric.coef[1]), .Names= "Intercept"))
message("Confidence Interval:")
print(metric.ci[1,])

#Box-and-whisker diagram shows distribution of pHash results w.r.t. Human perception levels. 
#This data is obtained from manual assessment.
boxplot(data_struct$Metric~data_struct$Human,xlab='Human', ylab='Metric')
draw.threshold.hor()

#There are 2 options to draw an S-curve that describes the calculated model:
####Option 1
plot(data_struct$Metric, data_struct$Human, xlab="Metric", ylab="Human")
curve(predict(metric.glm, data.frame(Metric=x), type="resp"), add=TRUE, col="red")
points(data_struct$Metric,fitted(metric.glm),pch=20)
draw.threshold.vert()
####Option 2
#library(popbio)
#logi.hist.plot(data_struct$Metric,data_struct$Human,boxp=TRUE,type="hist",col="gray",xlabel="Metric", ylabel2="Human")
#draw.threshold.vert()



##Useful functions to describe correlation between data:
#print(cor.test(data_struct$Metric,data_struct$Human))
#print(summary(aov(data_struct$Human~data_struct$Metric)))
#print(ftable(data_struct$Human,data_struct$Metric))


##To run simulation, based on the calculated model:
y <- sim.human(coef(metric.glm)[1], coef(metric.glm)[2])

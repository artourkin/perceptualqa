
#Useful functions to draw lines.
draw.threshold.vert <- function(){
  abline(v = phash.coef[1], col = 4)
  abline(v = phash.ci[1,1], col = 6)
  abline(v = phash.ci[1,2], col = 6)
  return(0)
}
draw.threshold.hor <- function(){
  abline(h = phash.coef[1], col = 4)
  abline(h = phash.ci[1,1], col = 6)
  abline(h = phash.ci[1,2], col = 6)
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
  phash <- runif(n, 0, 30)  # generate random pHash data (n draws, uniform b/w 0 and 30)
  y <- sapply(phash, function(x) rbinom(1, 1, plogis(alpha + beta*x)))  
  plot(y ~ phash, pch=20, xlab='Human', ylab='pHash')
  curve(plogis(alpha + beta*x), min(phash), max(phash), add=TRUE, lwd=2)    
  return(y)
}


#Loading data.
#rawdata1 <-read.csv("../phash/phash_DxO.csv")
#rawdata2 <-read.csv("../phash/phash_CO.csv")
#rawdata3 <-read.csv("../phash/phash_ADC.csv")
#newssim <- read.csv("../src/data.csv", sep = ";")
newssim = read.csv2(file.choose(),header=F, sep = ";")
#rawdata <- rbind(rawdata1,rawdata2,rawdata3)
dat <- structure(list(Human = newssim$V3, pHash = newssim$V2), .Names = c("Human", "pHash"), 
                 class = "data.frame", row.names = c(NA, -27L))
#Calculating a model using logistic regression.
phash.glm <- glm(Human ~ pHash, data=dat, family=binomial)
phash.coef<-(phash.glm$coefficients)
phash.ci<-confint.default(phash.glm)

message("Threshold:")
print( structure(as.numeric( phash.coef[1]), .Names= "Intercept"))
message("Confidence Interval:")
print(phash.ci[1,])

#Box-and-whisker diagram shows distribution of pHash results w.r.t. Human perception levels. 
#This data is obtained from manual assessment.
boxplot(dat$pHash~dat$Human,xlab='Human', ylab='pHash')
draw.threshold.hor()

#There are 2 options to draw an S-curve that describes the calculated model:
####Option 1
plot(dat$pHash, dat$Human, xlab="pHash", ylab="Human")
curve(predict(phash.glm, data.frame(pHash=x), type="resp"), add=TRUE, col="red")
points(dat$pHash,fitted(phash.glm),pch=20)
draw.threshold.vert()
####Option 2
#library(popbio)
#logi.hist.plot(dat$pHash,dat$Human,boxp=TRUE,type="hist",col="gray",xlabel="pHash", ylabel2="Human")
#draw.threshold.vert()



##Useful functions to describe correlation between data:
#print(cor.test(dat$pHash,dat$Human))
#print(summary(aov(dat$Human~dat$pHash)))
#print(ftable(dat$Human,dat$pHash))


##To run simulation, based on the calculated model:
#y <- sim.response(coef(phash.glm)[1], coef(phash.glm)[2])

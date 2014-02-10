rawdata <-read.csv("/home/artur/rnd/git/perceptualqa/DxOnew.csv")

dat <- structure(list(Human = rawdata$human, pHash = rawdata$phash), .Names = c("Human", "pHash"), 
                 class = "data.frame", row.names = c(NA, -27L))

phash.glm <- glm(Human ~ pHash, data=dat, family=binomial)
plot(dat$pHash, dat$Human, xlab="pHash", ylab="Human")
curve(predict(phash.glm, data.frame(pHash=x), type="resp"), 
      add=TRUE, col="red")

points(dat$pHash,fitted(phash.glm),pch=20)
phash.coef<-(phash.glm$coefficients)
abline(v = phash.coef[1], col = 4)
print(confint.default(phash.glm))
phash.ci<-confint.default(phash.glm)
abline(v = phash.ci[1,1], col = 6)
abline(v = phash.ci[1,2], col = 6)
print(phash.ci[1,2]- phash.ci[1,1])
#curve(plogis(-88.4505 + 2.9677*x), min(dat$pHash), max(dat$pHash), add=TRUE, lwd=2, lty=3)
#legend('bottomright', c('pHash.glm', 'Set 1'), lty=c(1, 3), col=2:1, lwd=1:2, bty='n', cex=0.8)






# Define a function to perform a Bernoulli trial for each value of temp, 
#   with probability of success for each trial determined by the logistic
#   model with intercept = alpha and coef for temperature = beta.
# The function also plots the outcomes of these Bernoulli trials against the 
#   random temp data, and overlays the curve that corresponds to the model
#   used to simulate the response data.
sim.response <- function(alpha, beta) {
  n <-100 # size of random sample
  temp <- runif(n, 0, 30)  # generate random temperature data (n draws, uniform b/w 27 and 33)
  y <- sapply(temp, function(x) rbinom(1, 1, plogis(alpha + beta*x)))  
  plot(y ~ temp, pch=20, xlab='Human', ylab='pHash')
  curve(plogis(alpha + beta*x), min(temp), max(temp), add=TRUE, lwd=2)    
  return(y)
}

#y <- sim.response(coef(phash.glm)[1], coef(phash.glm)[2])

#xy<-data.frame( cbind(rawdata$phash,rawdata$human))
#names(xy) <-c ("phash", "human")
#attach(xy)
#xy$human <- (xy$human + 1) %% 2
#ph.aov <- aov(human~phash)
#print(summary(aov(human~phash)))
#print(ftable(xy$human,xy$phash))
#xy$human<-factor(xy$human)
#plot(xy$human~xy$phash)




#plot(xy$phash, xy$human)


library(popbio)
logi.hist.plot(dat$pHash,dat$Human,boxp=TRUE,type="hist",col="gray")
phash.coef<-(phash.glm$coefficients)
abline(v = phash.coef[1], col = 4)
print(confint.default(phash.glm))
phash.ci<-confint.default(phash.glm)
abline(v = phash.ci[1,1], col = 6)
abline(v = phash.ci[1,2], col = 6)
print(phash.ci[1,2]- phash.ci[1,1])
#lg <- function(x){ exp(x)/(1 + exp(x)) }
#mylogit<-glm(xy$human ~ xy$phash, data = xy, family = "binomial")
#prGLM <- predict(mylogit,type="link",se=TRUE)
#summary(prGLM)
#print(summary(mylogit))
#print(confint.default(mylogit))



#print(residuals(mylogit, type="deviance"))
#line <- lm(phash~human)
#abline(line)
#xy[xy[,1] <= 2,1] <- 1
#xy[xy[,1] > 2,1] <- 0
#xy$human <- (xy$human + 1) %% 2


#plot(xy$phash~xy$human,data=xy, xlab="human annotation", ylab="phash distance")
#abline(lm(xy$phash~xy$human))
#plot(phash,human)


#Test <- factor(phash, levels=c("0","1"), labels=c("T-","T+"), ordered=T)
#Human <-factor(human, levels=c("0","1"), labels=c("H-","H+"), ordered=T)
#library(prettyR)
#test<-calculate.xtab(Test, Human, varnames=c("Test","Human","T+","T-","H+","H-"))
#print(test, html=T)


#auc <- slot(performance(pred, "auc"), "y.values")[[1]]
#library(ROCR)
#pred<-prediction(xy$phash,xy$human )
#plot(performance(pred, "tpr", "fpr") ,lwd=2) 
#lines(c(0,1),c(0,1))
#text(0.6,0.2,paste("AUC=", round(auc,4), sep=""), cex=1.4)
#chisq.test(xy$phash, xy$human )
#hist(xy[xy$human==0,]$phash) 


#testtable <-data.frame( rbind(c(1,2,3,4,6,7,9),c(1,4,5,6,6,8,10)))
#print(ftable(X1,X2))
#ph.aov <- aov(X1~X2)
#print(summary(aov(X1~X2)))##
#
#print(t.test(phash,human, paired=F))
#print(t.test(X1,X2, paired=F))##
#
#print(chisq.test(phash,human))
#print(chisq.test(X1,X2))

#print(cor.test(phash,human))
#print(cor.test(X1,X2))

#plot(X1,X2)
#line <- lm(X2~X1)
#abline(line)
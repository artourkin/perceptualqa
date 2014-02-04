rawdata <-read.csv("/home/artur/rnd/git/perceptualqa/DxOnew.csv")
xy<- data.frame( cbind(rawdata$phash,rawdata$human))
names(xy) <-c ("phash", "human")
attach(xy)
#boxplot(xy$phash~xy$human,data=xy, xlab="human annotation", ylab="phash difference")

xy[xy[,1] <= 2,1] <- 1
xy[xy[,1] > 2,1] <- 0
#xy$human <- (xy$human + 1) %% 2

#Test <- factor(phash, levels=c("0","1"), labels=c("T-","T+"), ordered=T)
#Human <-factor(human, levels=c("0","1"), labels=c("H-","H+"), ordered=T)
#library(prettyR)
#test<-calculate.xtab(Test, Human, varnames=c("Test","Human","T+","T-","H+","H-"))
#print(test, html=T)


boxplot(xy$phash~xy$human,data=xy, xlab="human annotation", ylab="phash difference")

results <- t.test(phash,human, paired=T)
#auc <- slot(performance(pred, "auc"), "y.values")[[1]]
#library(ROCR)
#pred<-prediction(xy$phash,xy$human )
#plot(performance(pred, "tpr", "fpr") ,lwd=2) 
#lines(c(0,1),c(0,1))
#text(0.6,0.2,paste("AUC=", round(auc,4), sep=""), cex=1.4)
#chisq.test(xy$phash, xy$human )
#hist(xy[xy$human==0,]$phash) 



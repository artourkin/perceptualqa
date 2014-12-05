#
# R Staticstics tests tutorial code
# Art1 - Binominal tests
# Ex2 - spam detector
#
# Author: Alexander Ledovsky
#

# loading data
# don't forget to set your working directory
tab<-read.csv(file="/home/artur/Downloads/code_2/data2.csv", header=TRUE, sep=",", dec=".")
attach(tab)

# ROC-curve
library(ROCR)
pred<-prediction(Messages, Bot)
plot(performance(pred, "tpr", "fpr"),lwd=2) 
lines(c(0,1),c(0,1))
#text(0.6,0.2,paste("AUC=", round(auc,4), sep=""), cex=1.4)
title("ROC Curve")

# area under the curve calculation
#auc<-slot(performance(pred, "auc"), "y.values")[[1]]

# ROC-curve with better plotting
plot(performance(pred, "tpr", "fpr"), print.cutoffs.at=c(30,40,60,81), text.adj=c(1.1,-0.5) ,lwd=2) 
lines(c(0,1),c(0,1))
#text(0.6,0.2,paste("AUC=", round(auc,4), sep=""), cex=1.4)
title("ROC Curve")




                                                


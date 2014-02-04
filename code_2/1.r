#
# R Staticstics tests tutorial code
# Art1 - Binominal tests
# Ex1 - human detection test
#
# Author: Alexander Ledovsky
#

# loading data
# don't forget to set your working directory
tab<-read.csv(file="/home/artur/Downloads/code_2/data1.csv", header=TRUE, sep=",", dec=".")
attach(tab)
Test<-factor(Test, levels=c("0","1"), labels=c("T-","T+"), ordered=T)
Human<-factor(Human, levels=c("0","1"), labels=c("H-","H+"), ordered=T)

# possible way
addmargins(table(Test, Human))

library(prettyR)
test<-calculate.xtab(Test, Human, varnames=c("Test","Human","T+","T-","H+","H-"))
print(test)

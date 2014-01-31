rawdata <-read.csv("/home/artur/rnd/git/perceptualqa/DxOnew.csv")
xy<- data.frame( cbind(rawdata$phash,rawdata$human))
names(xy) <-c ("phash", "human")
boxplot(xy$phash~xy$human,data=xy, xlab="human annotation", ylab="phash difference")

hist(xy[xy$human==0,]$phash) 



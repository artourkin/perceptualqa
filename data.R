rawdata <-read.csv("/home/artur/rnd/git/perceptualqa/dxo.csv")
x <- cbind(rawdata$ssimSimple,rawdata$Brightness)
plot(x,col=ifelse(x[,2]>2,2,1))
z <- x[x[,2] == 2,] 
boxplot(z[,1])
     
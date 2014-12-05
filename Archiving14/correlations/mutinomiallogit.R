require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)
data <-read.csv("../old data/ssim_DxO.csv")
attach(data)
#plot(data$ssimSimple~data$r1_clipping*data$r1_brightness*data$r1_hue)
data$r_aver<-(r1_brightness+r1_clipping+r1_hue+r2_brightness+r2_clipping+r2_hue)/18
data$ssim_aver<-(ssimSimple+ssimSimpleHue+ssimSimpleSaturation)/3
attach(data)
#plot(ssim_aver~r_aver)
#print(cor.test(ssim_aver,r_aver))
#print(summary(aov(ssim_aver~r_aver)))
print(t.test(ssim_aver,r_aver,paired=TRUE))
#fit <- lm(ssim_aver ~ r_aver, data=data)

#print(summary(fit))

#ml <- read.dta("http://www.ats.ucla.edu/stat/data/hsbdemo.dta")
#ml$prog2 <- relevel(ml$prog, ref = "academic")
#test <- multinom(prog2 ~ ses + write, data = ml)
#print(summary(test))
#exp(coef(test))
#head(pp <- fitted(test))
#dses <- data.frame(ses = c("low", "middle", "high"), write = mean(ml$write))
#predict(test, newdata = dses, "probs")

#dwrite <- data.frame(ses = rep(c("low", "middle", "high"), each = 41), write = rep(c(30:70),3))
## store the predicted probabilities for each value of ses and write
#pp.write <- cbind(dwrite, predict(test, newdata = dwrite, type = "probs", se = TRUE))
## calculate the mean probabilities within each level of ses
#by(pp.write[, 3:5], pp.write$ses, colMeans)
#lpp <- melt(pp.write, id.vars = c("ses", "write"), value.name = "probability")
#head(lpp)  # view first few rows
#ggplot(lpp, aes(x = write, y = probability, colour = ses)) + geom_line() + facet_grid(variable ~., scales = "free")
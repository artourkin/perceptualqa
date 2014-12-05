rawdata_ADC <-read.csv("../phash/phash_ADC.csv")
rawdata_CO <-read.csv("../phash/phash_CO.csv")
rawdata_DxO <-read.csv("../phash/phash_DxO.csv")
#rawdata_ADC[rawdata_ADC=="Image size does not match"] <- NA
#rawdata_CO[rawdata_CO=="Image size does not match"] <- NA
#rawdata_DxO[rawdata_DxO=="Image size does not match"] <- NA

rawdata<-rbind(rawdata_ADC,rawdata_CO,rawdata_DxO)


#rawdata$rae<-as.numeric(as.character(rawdata$rae))
#rawdata$rmae<-as.numeric(as.character(rawdata$rmae))
#rawdata$rmse<-as.numeric(as.character(rawdata$rmse))
#rawdata$rpae<-as.numeric(as.character(rawdata$rpae))

#rawdata$total <- rawdata$r1_clipping+rawdata$r2_clipping+rawdata$r1_brightness+rawdata$r2_brightness+rawdata$r1_hue+rawdata$r2_hue

#rawdata$total <- rawdata$r1_brightness+rawdata$r2_brightness
#rawdata$total <- rawdata$r1_hue+rawdata$r2_hue

#rawdata<-rawdata[order(rawdata$total),]

rawdata<-rawdata[rawdata$human==0,]
#print(summary(rawdata$total))

#rawdata$total <- rawdata$r1_clipping+rawdata$r2_clipping
#rawdata<-rawdata[order(rawdata$human),]



par(mfrow=c(1,2))
plot(rawdata$human)
plot(rawdata$phash)


#print(summary(rawdata_best))

#photohawk<-rawdata[9:14]
#experts<-rawdata[3:8]


#colnames(experts) <-c("R1:Clipping","R1:Brightness", "R1:Hue","R2:Clipping","R2:Brightness", "R2:Hue")
#experts$total <- experts$r1_clipping+experts$r1_brightness+experts$r1_hue+experts$r2_clipping+experts$r2_brightness+experts$r2_hue

#library(psych)
#print(corr.test(photohawk,experts, use="complete"))


#library(corrgram)
#corrgram(experts, order=FALSE, lower.panel=panel.conf,
#         upper.panel=panel.pie, text.panel=panel.txt)


#rawdata<-cbind(rawdata1$r1_clipping,rawdata1$r1_brightness,rawdata1$r1_hue,rawdata1$ssimSimple,rawdata1$ssimSimpleHue,rawdata1$ssimSimpleSaturation)

#rawdata$r1_brightness<-ordered(rawdata$r1_brightness)
#rawdata$r1_hue<-ordered(rawdata$r1_hue)
#rawdata$r1_clipping<-ordered(rawdata$r1_clipping)
#rawdata$r2_brightness<-ordered(rawdata$r2_brightness)
#rawdata$r2_hue<-ordered(rawdata$r2_hue)
#rawdata$r2_clipping<-ordered(rawdata$r2_clipping)


#test <- data.frame(cbind(rawdata_DxO$r1_hue,rawdata_DxO$ssim_value,rawdata_DxO$rmae))

#colnames(test) <-c("r1_hue","ssim_value", "rmae")
#test$r1_hue<-ordered(test$r1_hue)


#rawdata_DxO[12] <- as.numeric(rawdata_DxO[12])
#x <- rawdata[3:8]
#y <- rawdata[9:15]
#xy <- cbind(x,y)




#testt <- xtabs(~r1_hue_experts$ssim_value+r1_hue_experts$r1_hue, data=r1_hue_experts)
#print(chisq.test(testt))



#by(r1_hue_experts,r1_hue_experts$r1_hue,boxplot)




#library(pastecs)
#print(stat.desc(rawdata_DxO))

#library(polycor)
#res<-hetcor(xy)
#print(res)


#library(coin)
#permutation_test<-oneway_test(rawdata_DxO$ssim_value~rawdata_DxO$r1_hue, data=rawdata_DxO,
#            distribution=approximate(B=9999))

#print(permutation_test)

#stripchart(y, method = "jitter")
#xy <- cbind(x,y)
#print(cor(x, y))
#summary(rawdata_DxO)
#library(polycor)
#hetcor(rawdata_DxO) 


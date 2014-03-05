rawdata_ADC <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_ADC.csv")
rawdata_CO <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_CO.csv")
rawdata_DxO <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_DxO_update.csv")
rawdata_ADC[rawdata_ADC=="Image size does not match"] <- NA
rawdata_CO[rawdata_CO=="Image size does not match"] <- NA
rawdata_DxO[rawdata_DxO=="Image size does not match"] <- NA
library(parallel)

#rawdata<-cbind(rawdata1$r1_clipping,rawdata1$r1_brightness,rawdata1$r1_hue,rawdata1$ssimSimple,rawdata1$ssimSimpleHue,rawdata1$ssimSimpleSaturation)

rawdata_DxO$r1_brightness<-ordered(rawdata_DxO$r1_brightness)
rawdata_DxO$r1_hue<-ordered(rawdata_DxO$r1_hue)
rawdata_DxO$r1_clipping<-ordered(rawdata_DxO$r1_clipping)
rawdata_DxO$r2_brightness<-ordered(rawdata_DxO$r2_brightness)
rawdata_DxO$r2_hue<-ordered(rawdata_DxO$r2_hue)
rawdata_DxO$r2_clipping<-ordered(rawdata_DxO$r2_clipping)
test <- data.frame(cbind(rawdata_DxO$r1_hue,rawdata_DxO$ssim_value,rawdata_DxO$rmae))

#colnames(test) <-c("r1_hue","ssim_value", "rmae")

#test$r1_hue<-ordered(test$r1_hue)
rawdata_DxO$rae<-as.numeric(as.character(rawdata_DxO$rae))
rawdata_DxO$rmae<-as.numeric(as.character(rawdata_DxO$rmae))
rawdata_DxO$rmse<-as.numeric(as.character(rawdata_DxO$rmse))
rawdata_DxO$rpae<-as.numeric(as.character(rawdata_DxO$rpae))
#rawdata_DxO[12] <- as.numeric(rawdata_DxO[12])
#x <- rawdata_DxO[3:8]
#y <- rawdata_DxO[9:15]
#xy <- cbind(x,y)
rawdata_DxO<-rawdata_DxO[3:15]
library(polycor)
#res<-hetcor(rawdata_DxO)
#print(res)


library(coin)
permutation_test<-oneway_test(rawdata_DxO$ssim_value~rawdata_DxO$r1_hue, data=rawdata_DxO,
            distribution=approximate(B=9999))

print(permutation_test)

#stripchart(y, method = "jitter")
#xy <- cbind(x,y)
#print(cor(x, y))
#summary(rawdata_DxO)
#library(polycor)
#hetcor(rawdata_DxO) 

#library(corrgram)
#corrgram(rawdata_DxO, order=FALSE, lower.panel=panel.pts,
#         upper.panel=panel.pie, text.panel=panel.txt, main="Correlation between metrics in DxO experiment")
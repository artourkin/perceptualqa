rawdata_ADC <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_ADC.csv")
rawdata_CO <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_CO.csv")
rawdata_DxO <-read.csv("/home/artur/rnd/git/perceptualqa/rawdata_DxO_update.csv")
rawdata_ADC[rawdata_ADC=="Image size does not match"] <- NA
rawdata_CO[rawdata_CO=="Image size does not match"] <- NA
rawdata_DxO[rawdata_DxO=="Image size does not match"] <- NA

raw <- data.frame(rawdata_DxO)

#rawdata<-cbind(rawdata1$r1_clipping,rawdata1$r1_brightness,rawdata1$r1_hue,rawdata1$ssimSimple,rawdata1$ssimSimpleHue,rawdata1$ssimSimpleSaturation)
#mt<-mtcars
rawdata_DxO[order(as.numeric(rawdata_DxO[,12])), ]
#rawdata_DxO[12] <- as.numeric(rawdata_DxO[12])
x <- rawdata_DxO[3:8]
y <- rawdata_DxO[9:15]
xy <- cbind(x,y)

#stripchart(xy, method = "jitter")
#xy <- cbind(x,y)
#print(cor(x, y))
#summary(rawdata_DxO)
#library(polycor)
#hetcor(rawdata_DxO) 

library(corrgram)
corrgram(raw, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt, main="Correlation between metrics in DxO experiment")
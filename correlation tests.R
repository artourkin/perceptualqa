rawdata1 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_ADC.csv")
rawdata1 <- ifelse(rawdata1 == "Image size does not match", NA, x)
#rawdata1[rawdata1 == "Image size does not match"]<-NA
rawdata2 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_CO.csv")
rawdata3 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_DxO.csv")
rawdata<-rbind(rawdata1,rawdata2,rawdata3)
attach (rawdata)
rawdata$r_aver<-(r1_brightness+r1_clipping+r1_hue+r2_brightness+r2_clipping+r2_hue)/18
rawdata$ssim_aver<-(ssimSimple+ssimSimpleHue+ssimSimpleSaturation)/3
rawdata$ae_aver<-(aeRelative+paeRelative+maeRelative+mseRelative)/4
attach (rawdata)
pairs(~r1_clipping+r1_brightness+r1_hue+r2_clipping+r2_brightness+r2_hue,data=rawdata3, 
      main="Simple Scatterplot Matrix")
#rawdata<-cbind(r1_clipping,
#               r1_brightness,
#               r1_hue,
#               r2_clipping,
#               r2_brightness,
#               r2_hue
#               ,ssimSimple,ssimSimpleHue,ssimSimpleSaturation
#               )  
library(corrgram)
corrgram(rawdata, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Perceptual QA")


#mt<-mtcars
rawdata3 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_ADC.csv")
rawdata2 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_CO.csv")
rawdata1 <-read.csv("/home/artur/rnd/git/perceptualqa/ssim_ADC.csv")
rawdata<-cbind(rawdata1$r1_clipping,rawdata1$r1_brightness,rawdata1$r1_hue,rawdata1$ssimSimple,rawdata1$ssimSimpleHue,rawdata1$ssimSimpleSaturation)
mt<-mtcars
library(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Perceptual QA")
rawdata_ADC <-read.csv("../data/ADC.csv",sep="\t")
rawdata_CO <-read.csv("../data/CO.csv",sep="\t")
rawdata_DxO <-read.csv("../data/DxO.csv",sep="\t")

rawdata<-rbind(rawdata_ADC,rawdata_CO,rawdata_DxO)
#rawdata$total <- rawdata$r1_clipping+rawdata$r2_clipping+rawdata$r1_brightness+rawdata$r2_brightness+rawdata$r1_hue+rawdata$r2_hue
rawdata<-rawdata[1:230,]
rawdata$total <- rawdata$r1_clipping+rawdata$r2_clipping
#rawdata<-rawdata[order(rawdata$total),]

rawdata$total2 <- rawdata$r1_brightness+rawdata$r2_brightness
rawdata$total3 <- rawdata$r1_hue+rawdata$r2_hue
par(mfrow=c(3,4))
plot(rawdata$total, ylab="Reviewers:Framing")
plot(rawdata$total2, ylab="Reviewers:Brightness")
plot(rawdata$total3, ylab="Reviewers:Hue")
plot(rawdata$ssim_v_int, ylab="SSIM Brightness")
plot(rawdata$ssim_h_int, ylab="SSIM Hue")
plot(rawdata$ssim_s_int, ylab="SSIM Saturation")
plot(rawdata$rae_int, ylab="rAE interpolated")
plot(rawdata$rae_unint, ylab="rAE uninterpolated")
plot(rawdata$rmse_int, ylab="rMSE interpolated")
plot(rawdata$rmse_unint, ylab="rMSE uninterpolated")
plot(rawdata$rmae_unint, ylab="rMAE uninterpolated")
plot(rawdata$rpae_unint, ylab="rPAE uninterpolated")

rawdata$total <- rawdata$r1_brightness+rawdata$r2_brightness
#rawdata<-rawdata[order(rawdata$total),]

par(mfrow=c(3,3))
plot(rawdata$total, ylab="Reviewers:Brightness")
plot(rawdata$ssim_v_int, ylab="SSIM Brightness")
#plot(rawdata$ssim_h_int)
#plot(rawdata$ssim_s_int)
plot(rawdata$rae_int, ylab="rAE interpolated")
plot(rawdata$rae_unint, ylab="rAE uninterpolated")
plot(rawdata$rmse_int, ylab="rMSE interpolated")
plot(rawdata$rmse_unint, ylab="rMSE uninterpolated")
plot(rawdata$rmae_unint, ylab="rMAE uninterpolated")
plot(rawdata$rpae_unint, ylab="rPAE uninterpolated")


rawdata$total <- rawdata$r1_hue+rawdata$r2_hue
#rawdata<-rawdata[order(rawdata$total),]

par(mfrow=c(3,3))
plot(rawdata$total, ylab="Reviewers:Hue")
#plot(rawdata$ssim_v_int)
plot(rawdata$ssim_h_int, ylab="SSIM Hue")
plot(rawdata$ssim_s_int, ylab="SSIM Saturation")
plot(rawdata$rae_int, ylab="rAE interpolated")
#plot(rawdata$rae_unint)
plot(rawdata$rmse_int, ylab="rMSE interpolated")
#plot(rawdata$rmse_unint)
#plot(rawdata$rmae_unint)
#plot(rawdata$rpae_unint)

rawdata$total <- rawdata$r1_hue+rawdata$r2_hue
par(mfrow=c(2,1))
plot(rawdata$total, ylab="Reviewers:Hue")
plot(rawdata$ssim_h_int, ylab="SSIM Hue")

#rawdata<-rawdata[rawdata$total==4,]

plot(rawdata$total ~ rawdata$ssim_v_int + rawdata$rae_int  )

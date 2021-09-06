#1w
AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)

zscore_EUR_AFR <-data.frame()
zscore_EUR_SAS <-data.frame()
zscore_EUR_EAS<-data.frame()
zscore_AFR_SAS<-data.frame()
zscore_AFR_EAS<-data.frame()
zscore_SAS_EAS<-data.frame()

for (j in 5:dim(EUR)[2]){
f<-lm(EUR[,j] ~ EUR$f.21003.2.0)$residuals
EUR[,j][!is.na(EUR[,j])]=f
EUR_m0 <- EUR[EUR$f.22001.0.0==1,]
f<-lm(AFR[,j] ~ AFR$f.21003.2.0)$residuals
AFR[,j][!is.na(AFR[,j])]=f
AFR_m0 <- AFR[AFR$f.22001.0.0==1,]
f<-lm(EAS[,j] ~ EAS$f.21003.2.0)$residuals
EAS[,j][!is.na(EAS[,j])]=f
EAS_m0 <- EAS[EAS$f.22001.0.0==1,]
f<-lm(SAS[,j] ~ SAS$f.21003.2.0)$residuals
SAS[,j][!is.na(SAS[,j])]=f
SAS_m0 <- SAS[SAS$f.22001.0.0==1,]

EUR_f0 <- EUR[EUR$f.22001.0.0==0,]
AFR_f0 <- AFR[AFR$f.22001.0.0==0,]
EAS_f0 <- EAS[EAS$f.22001.0.0==0,]
SAS_f0 <- SAS[SAS$f.22001.0.0==0,]

EUR_mean_m <- mean(EUR_m0[,j])
EUR_sd_m <- sd(EUR_m0[,j])
AFR_mean_m <- mean(AFR_m0[,j])
AFR_sd_m <- sd(AFR_m0[,j])
SAS_mean_m <- mean(SAS_m0[,j])
SAS_sd_m <- sd(SAS_m0[,j])
EAS_mean_m <- mean(EAS_m0[,j])
EAS_sd_m <- sd(EAS_m0[,j])

EUR_mean_f <- mean(EUR_f0[,j])
EUR_sd_f <- sd(EUR_f0[,j])
AFR_mean_f <- mean(AFR_f0[,j])
AFR_sd_f <- sd(AFR_f0[,j])
SAS_mean_f <- mean(SAS_f0[,j])
SAS_sd_f <- sd(SAS_f0[,j])
EAS_mean_f <- mean(EAS_f0[,j])
EAS_sd_f <- sd(EAS_f0[,j])
SEmeur = EUR_sd_m^2/dim(EUR_m0)[1]
SEmafr = AFR_sd_m^2/dim(AFR_m0)[1]
SEmsas = SAS_sd_m^2/dim(SAS_m0)[1]
SEmeas = EAS_sd_m^2/dim(EAS_m0)[1]
SEfeur = EUR_sd_f^2/dim(EUR_f0)[1]
SEfafr = AFR_sd_f^2/dim(AFR_f0)[1]
SEfsas = SAS_sd_f^2/dim(SAS_f0)[1]
SEfeas = EAS_sd_f^2/dim(EAS_f0)[1]

z_EUR_AFR <- ((EUR_mean_f-AFR_mean_f)-(EUR_mean_m-AFR_mean_m))/sqrt(SEmeur + SEmafr + SEfeur + SEfafr)
z_EUR_SAS <- ((EUR_mean_f-SAS_mean_f)-(EUR_mean_m-SAS_mean_m))/sqrt(SEmeur + SEmsas + SEfeur + SEfsas)
z_EUR_EAS <- ((EUR_mean_f-EAS_mean_f)-(EUR_mean_m-EAS_mean_m))/sqrt(SEmeur + SEmeas + SEfeur + SEfeas)
z_AFR_SAS <- ((AFR_mean_f-SAS_mean_f)-(AFR_mean_m-SAS_mean_m))/sqrt(SEmafr + SEmsas + SEfafr + SEfsas)
z_AFR_EAS <- ((AFR_mean_f-EAS_mean_f)-(AFR_mean_m-EAS_mean_m))/sqrt(SEmafr + SEmeas + SEfafr + SEfeas)
z_SAS_EAS <- ((SAS_mean_f-EAS_mean_f)-(SAS_mean_m-EAS_mean_m))/sqrt(SEmsas + SEmeas + SEfsas + SEfeas)

zscore_EUR_AFR <- rbind(zscore_EUR_AFR,cbind(colnames(EUR_m0)[j],z_EUR_AFR))
zscore_EUR_SAS <- rbind(zscore_EUR_SAS,cbind(colnames(EUR_m0)[j],z_EUR_SAS))
zscore_EUR_EAS <- rbind(zscore_EUR_EAS,cbind(colnames(EUR_m0)[j],z_EUR_EAS))
zscore_AFR_SAS <- rbind(zscore_AFR_SAS,cbind(colnames(EUR_m0)[j],z_AFR_SAS))
zscore_AFR_EAS <- rbind(zscore_AFR_EAS,cbind(colnames(EUR_m0)[j],z_AFR_EAS))
zscore_SAS_EAS <- rbind(zscore_SAS_EAS,cbind(colnames(EUR_m0)[j],z_SAS_EAS))
}
write.table(zscore_EUR_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_AFR",quote=F,row.names=F)
write.table(zscore_EUR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_SAS",quote=F,row.names=F)
write.table(zscore_EUR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_EAS",quote=F,row.names=F)
write.table(zscore_AFR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_AFR_SAS",quote=F,row.names=F)
write.table(zscore_AFR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_AFR_EAS",quote=F,row.names=F)
write.table(zscore_SAS_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_SAS_EAS",quote=F,row.names=F)

AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)

mean_EUR_m1=data.frame()
mean_EUR_f1=data.frame()
mean_AFR_m1=data.frame()
mean_AFR_f1=data.frame()
mean_EAS_m1=data.frame()
mean_EAS_f1=data.frame()
mean_SAS_m1=data.frame()
mean_SAS_f1=data.frame()

for (j in 5:dim(EUR)[2]){
     f<-lm(EUR[,j] ~ EUR$f.21003.2.0)$residuals
     EUR[,j][!is.na(EUR[,j])]=f
     EUR_m <- EUR[EUR$f.22001.0.0==1,j]
     mean_EUR_m <- mean(EUR_m)
     mean_EUR_m1 <- rbind(mean_EUR_m1,cbind(colnames(EUR)[j],mean_EUR_m))
     EUR_f <- EUR[EUR$f.22001.0.0==0,j]
     mean_EUR_f <- mean(EUR_f)
     mean_EUR_f1 <- rbind(mean_EUR_f1,cbind(colnames(EUR)[j],mean_EUR_f))
    }
EUR_mean <- cbind(mean_EUR_m1,mean_EUR_f1)
write.table(EUR_mean,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/EUR_residual_mean",quote=F,row.names=F)

for (j in 5:dim(AFR)[2]){
     f<-lm(AFR[,j] ~ AFR$f.21003.2.0)$residuals
     AFR[,j][!is.na(AFR[,j])]=f
     AFR_m <- AFR[AFR$f.22001.0.0==1,j]
     mean_AFR_m <- mean(AFR_m)
     mean_AFR_m1 <- rbind(mean_AFR_m1,cbind(colnames(AFR)[j],mean_AFR_m))
     AFR_f <- AFR[AFR$f.22001.0.0==0,j]
     mean_AFR_f <- mean(AFR_f)
     mean_AFR_f1 <- rbind(mean_AFR_f1,cbind(colnames(AFR)[j],mean_AFR_f))
    }
AFR_mean <- cbind(mean_AFR_m1,mean_AFR_f1)
write.table(AFR_mean,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/AFR_residual_mean",quote=F,row.names=F)

for (j in 5:dim(EAS)[2]){
     f<-lm(EAS[,j] ~ EAS$f.21003.2.0)$residuals
     EAS[,j][!is.na(EAS[,j])]=f
     EAS_m <- EAS[EAS$f.22001.0.0==1,j]
     mean_EAS_m <- mean(EAS_m)
     mean_EAS_m1 <- rbind(mean_EAS_m1,cbind(colnames(EAS)[j],mean_EAS_m))
     EAS_f <- EAS[EAS$f.22001.0.0==0,j]
     mean_EAS_f <- mean(EAS_f)
     mean_EAS_f1 <- rbind(mean_EAS_f1,cbind(colnames(EAS)[j],mean_EAS_f))
    }
EAS_mean <- cbind(mean_EAS_m1,mean_EAS_f1)
write.table(EAS_mean,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/EAS_residual_mean",quote=F,row.names=F)

for (j in 5:dim(SAS)[2]){
     f<-lm(SAS[,j] ~ SAS$f.21003.2.0)$residuals
     SAS[,j][!is.na(SAS[,j])]=f
     SAS_m <- SAS[SAS$f.22001.0.0==1,j]
     mean_SAS_m <- mean(SAS_m)
     mean_SAS_m1 <- rbind(mean_SAS_m1,cbind(colnames(SAS)[j],mean_SAS_m))
     SAS_f <- SAS[SAS$f.22001.0.0==0,j]
     mean_SAS_f <- mean(SAS_f)
     mean_SAS_f1 <- rbind(mean_SAS_f1,cbind(colnames(SAS)[j],mean_SAS_f))
    }
SAS_mean <- cbind(mean_SAS_m1,mean_SAS_f1)
write.table(SAS_mean,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/SAS_residual_mean",quote=F,row.names=F)

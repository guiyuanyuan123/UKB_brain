#1w
AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)

EUR_m <- EUR[EUR$f.22001.0.0==1,]
AFR_m <- AFR[AFR$f.22001.0.0==1,]
SAS_m <- SAS[SAS$f.22001.0.0==1,]
EAS_m <- EAS[EAS$f.22001.0.0==1,]

EUR_f <- EUR[EUR$f.22001.0.0==0,]
AFR_f <- AFR[AFR$f.22001.0.0==0,]
SAS_f <- SAS[SAS$f.22001.0.0==0,]
EAS_f <- EAS[EAS$f.22001.0.0==0,]
zscore_EUR_AFR <-data.frame()
zscore_EUR_SAS <-data.frame()
zscore_EUR_EAS<-data.frame()
zscore_AFR_SAS<-data.frame()
zscore_AFR_EAS<-data.frame()
zscore_SAS_EAS<-data.frame()

for (j in 5:dim(AFR_m)[2]){
#EUR_m00=EUR_m[sample(nrow(EUR_m),100,replace=F),]
#EUR_m0 <- cbind(EUR_m00,EUR_m00[,4]*EUR_m00[,j])
EUR_m0 <- cbind(EUR_m,EUR_m[,4]*EUR_m[,j])
AFR_m0 <- cbind(AFR_m,AFR_m[,4]*AFR_m[,j])
SAS_m0 <- cbind(SAS_m,SAS_m[,4]*SAS_m[,j])
EAS_m0 <- cbind(EAS_m,EAS_m[,4]*EAS_m[,j])

#EUR_f00=EUR_f[sample(nrow(EUR_f),100,replace=F),]
#EUR_f0 <- cbind(EUR_f00,EUR_f00[,4]*EUR_f00[,j])
EUR_f0 <- cbind(EUR_f,EUR_f[,4]*EUR_f[,j])
AFR_f0 <- cbind(AFR_f,AFR_f[,4]*AFR_f[,j])
SAS_f0 <- cbind(SAS_f,SAS_f[,4]*SAS_f[,j])
EAS_f0 <- cbind(EAS_f,EAS_f[,4]*EAS_f[,j])

EUR_mean_m <- mean(EUR_m0[,164])
EUR_sd_m <- sd(EUR_m0[,164])
AFR_mean_m <- mean(AFR_m0[,164])
AFR_sd_m <- sd(AFR_m0[,164])
SAS_mean_m <- mean(SAS_m0[,164])
SAS_sd_m <- sd(SAS_m0[,164])
EAS_mean_m <- mean(EAS_m0[,164])
EAS_sd_m <- sd(EAS_m0[,164])

EUR_mean_f <- mean(EUR_f0[,164])
EUR_sd_f <- sd(EUR_f0[,164])
AFR_mean_f <- mean(AFR_f0[,164])
AFR_sd_f <- sd(AFR_f0[,164])
SAS_mean_f <- mean(SAS_f0[,164])
SAS_sd_f <- sd(SAS_f0[,164])
EAS_mean_f <- mean(EAS_f0[,164])
EAS_sd_f <- sd(EAS_f0[,164])
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
write.table(zscore_EUR_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_AFR",quote=F)
write.table(zscore_EUR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_SAS",quote=F)
write.table(zscore_EUR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_EUR_EAS",quote=F)
write.table(zscore_AFR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_AFR_SAS",quote=F)
write.table(zscore_AFR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_AFR_EAS",quote=F)
write.table(zscore_SAS_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_zscore_SAS_EAS",quote=F)

zscore_EUR_AFR<-read.table("1w_zscore_EUR_AFR",header=T,stringsAsFactors=F)
zscore_EUR_SAS<-read.table("1w_zscore_EUR_SAS",header=T,stringsAsFactors=F)
zscore_EUR_EAS<-read.table("1w_zscore_EUR_EAS",header=T,stringsAsFactors=F)
zscore_AFR_SAS<-read.table("1w_zscore_AFR_SAS",header=T,stringsAsFactors=F)
zscore_AFR_EAS<-read.table("1w_zscore_AFR_EAS",header=T,stringsAsFactors=F)
zscore_SAS_EAS<-read.table("1w_zscore_SAS_EAS",header=T,stringsAsFactors=F)

p_EUR_AFR=data.frame()
p_EUR_SAS=data.frame()
p_EUR_EAS=data.frame()
p_AFR_SAS=data.frame()
p_AFR_EAS=data.frame()
p_SAS_EAS=data.frame()
for (i in 1:dim(zscore_EUR_AFR)[1]){
    if(zscore_EUR_AFR[i,3]>0){
    p0 = 2*(1-pnorm(zscore_EUR_AFR[i,3]))
    p_EUR_AFR = rbind(p_EUR_AFR,cbind(zscore_EUR_AFR[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_AFR[i,3])
    p_EUR_AFR = rbind(p_EUR_AFR,cbind(zscore_EUR_AFR[i,c(2,3)],p0))
}}
write.table(p_EUR_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_AFR",quote=F)

for (i in 1:dim(zscore_EUR_SAS)[1]){
    if(zscore_EUR_SAS[i,3]>0){
    p0 = 2*(1-pnorm(zscore_EUR_SAS[i,3]))
    p_EUR_SAS = rbind(p_EUR_SAS,cbind(zscore_EUR_SAS[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_SAS[i,3])
    p_EUR_SAS = rbind(p_EUR_SAS,cbind(zscore_EUR_SAS[i,c(2,3)],p0))
}}
write.table(p_EUR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_SAS",quote=F)

for (i in 1:dim(zscore_EUR_EAS)[1]){
    if(zscore_EUR_EAS[i,3]>0){
    p0 = 2*(1-pnorm(zscore_EUR_EAS[i,3]))
    p_EUR_EAS = rbind(p_EUR_EAS,cbind(zscore_EUR_EAS[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_EAS[i,3])
    p_EUR_EAS = rbind(p_EUR_EAS,cbind(zscore_EUR_EAS[i,c(2,3)],p0))
}}
write.table(p_EUR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_EAS",quote=F)

for (i in 1:dim(zscore_AFR_SAS)[1]){
    if(zscore_AFR_SAS[i,3]>0){
    p0 = 2*(1-pnorm(zscore_AFR_SAS[i,3]))
    p_AFR_SAS = rbind(p_AFR_SAS,cbind(zscore_AFR_SAS[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_AFR_SAS[i,3])
    p_AFR_SAS = rbind(p_AFR_SAS,cbind(zscore_AFR_SAS[i,c(2,3)],p0))
}}
write.table(p_AFR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_AFR_SAS",quote=F)

for (i in 1:dim(zscore_AFR_EAS)[1]){
    if(zscore_AFR_EAS[i,3]>0){
    p0 = 2*(1-pnorm(zscore_AFR_EAS[i,3]))
    p_AFR_EAS = rbind(p_AFR_EAS,cbind(zscore_AFR_EAS[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_AFR_EAS[i,3])
    p_AFR_EAS = rbind(p_AFR_EAS,cbind(zscore_AFR_EAS[i,c(2,3)],p0))
}}
write.table(p_AFR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_AFR_EAS",quote=F)

for (i in 1:dim(zscore_SAS_EAS)[1]){
    if(zscore_SAS_EAS[i,3]>0){
    p0 = 2*(1-pnorm(zscore_SAS_EAS[i,3]))
    p_SAS_EAS = rbind(p_SAS_EAS,cbind(zscore_SAS_EAS[i,c(2,3)],p0))
    }else{
    p0 = 2*pnorm(zscore_SAS_EAS[i,3])
    p_SAS_EAS = rbind(p_SAS_EAS,cbind(zscore_SAS_EAS[i,c(2,3)],p0))
}}
write.table(p_SAS_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_SAS_EAS",quote=F)

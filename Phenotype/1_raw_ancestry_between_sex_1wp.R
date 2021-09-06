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
    if(zscore_EUR_AFR[i,2]>0){
    p0 = 2*(1-pnorm(zscore_EUR_AFR[i,2]))
    p_EUR_AFR = rbind(p_EUR_AFR,cbind(zscore_EUR_AFR[i,],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_AFR[i,2])
    p_EUR_AFR = rbind(p_EUR_AFR,cbind(zscore_EUR_AFR[i,],p0))
}}
write.table(p_EUR_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_AFR",quote=F,row.names=F)

for (i in 1:dim(zscore_EUR_SAS)[1]){
    if(zscore_EUR_SAS[i,2]>0){
    p0 = 2*(1-pnorm(zscore_EUR_SAS[i,2]))
    p_EUR_SAS = rbind(p_EUR_SAS,cbind(zscore_EUR_SAS[i,c(1,2)],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_SAS[i,2])
    p_EUR_SAS = rbind(p_EUR_SAS,cbind(zscore_EUR_SAS[i,c(1,2)],p0))
}}
write.table(p_EUR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_SAS",quote=F,row.names=F)

for (i in 1:dim(zscore_EUR_EAS)[1]){
    if(zscore_EUR_EAS[i,2]>0){
    p0 = 2*(1-pnorm(zscore_EUR_EAS[i,2]))
    p_EUR_EAS = rbind(p_EUR_EAS,cbind(zscore_EUR_EAS[i,c(1,2)],p0))
    }else{
    p0 = 2*pnorm(zscore_EUR_EAS[i,2])
    p_EUR_EAS = rbind(p_EUR_EAS,cbind(zscore_EUR_EAS[i,c(1,2)],p0))
}}
write.table(p_EUR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_EUR_EAS",quote=F,row.names=F)

for (i in 1:dim(zscore_AFR_SAS)[1]){
    if(zscore_AFR_SAS[i,2]>0){
    p0 = 2*(1-pnorm(zscore_AFR_SAS[i,2]))
    p_AFR_SAS = rbind(p_AFR_SAS,cbind(zscore_AFR_SAS[i,c(1,2)],p0))
    }else{
    p0 = 2*pnorm(zscore_AFR_SAS[i,2])
    p_AFR_SAS = rbind(p_AFR_SAS,cbind(zscore_AFR_SAS[i,c(1,2)],p0))
}}
write.table(p_AFR_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_AFR_SAS",quote=F,row.names=F)

for (i in 1:dim(zscore_AFR_EAS)[1]){
    if(zscore_AFR_EAS[i,2]>0){
    p0 = 2*(1-pnorm(zscore_AFR_EAS[i,2]))
    p_AFR_EAS = rbind(p_AFR_EAS,cbind(zscore_AFR_EAS[i,c(1,2)],p0))
    }else{
    p0 = 2*pnorm(zscore_AFR_EAS[i,2])
    p_AFR_EAS = rbind(p_AFR_EAS,cbind(zscore_AFR_EAS[i,c(1,2)],p0))
}}
write.table(p_AFR_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_AFR_EAS",quote=F,row.names=F)

for (i in 1:dim(zscore_SAS_EAS)[1]){
    if(zscore_SAS_EAS[i,2]>0){
    p0 = 2*(1-pnorm(zscore_SAS_EAS[i,2]))
    p_SAS_EAS = rbind(p_SAS_EAS,cbind(zscore_SAS_EAS[i,c(1,2)],p0))
    }else{
    p0 = 2*pnorm(zscore_SAS_EAS[i,2])
    p_SAS_EAS = rbind(p_SAS_EAS,cbind(zscore_SAS_EAS[i,c(1,2)],p0))
}}
write.table(p_SAS_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/1w_p_SAS_EAS",quote=F,row.names=F)

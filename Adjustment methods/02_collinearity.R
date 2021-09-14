AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)[,c(1:4,9,5:8,10:163)]
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)[,c(1:4,9,5:8,10:163)]
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)[,c(1:4,9,5:8,10:163)]
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)[,c(1:4,9,5:8,10:163)]
library(car)

combeur=data.frame()
meur=data.frame()
feur=data.frame()

combafr=data.frame()
mafr=data.frame()
fafr=data.frame()

combeas=data.frame()
meas=data.frame()
feas=data.frame()

combsas=data.frame()
msas=data.frame()
fsas=data.frame()


vif_EUR= vif(lm(EUR[,6] ~ EUR$f.25010.2.0 + EUR$f.21003.2.0 + EUR$f.22001.0.0))
vif_AFR= vif(lm(AFR[,6] ~ AFR$f.25010.2.0 + AFR$f.21003.2.0 + AFR$f.22001.0.0))
vif_EAS= vif(lm(EAS[,6] ~ EAS$f.25010.2.0 + EAS$f.21003.2.0 + EAS$f.22001.0.0))
vif_SAS= vif(lm(SAS[,6] ~ SAS$f.25010.2.0 + SAS$f.21003.2.0 + SAS$f.22001.0.0))
#sqrt(vif_EUR)>2 False

for (j in 5:dim(EUR)[2]){
EUR1=cbind(EUR,EUR$f.21003.2.0 * EUR$f.22001.0.0)
AFR1=cbind(AFR,AFR$f.21003.2.0 * AFR$f.22001.0.0)
EAS1=cbind(EAS,EAS$f.21003.2.0 * EAS$f.22001.0.0)
SAS1=cbind(SAS,SAS$f.21003.2.0 * SAS$f.22001.0.0)

#EUR
model= lm(EUR1[,j] ~ EUR1$f.21003.2.0 + EUR1$f.22001.0.0 + EUR1[,164])
p_combeur <- summary(model)$coeff[4,4]
beta_combeur <- summary(model)$coeff[4,1]
combeur <- rbind(combeur,cbind(colnames(EUR1)[j],beta_combeur,p_combeur))
#AFR
model= lm(AFR1[,j] ~ AFR1$f.21003.2.0 + AFR1$f.22001.0.0 + AFR1[,164])
p_combafr <- summary(model)$coeff[4,4]
beta_combafr <- summary(model)$coeff[4,1]
combafr <- rbind(combafr,cbind(colnames(AFR1)[j],beta_combafr,p_combafr))
#EAS
model= lm(EAS1[,j] ~ EAS1$f.21003.2.0 + EAS1$f.22001.0.0 + EAS1[,164])
p_combeas <- summary(model)$coeff[4,4]
beta_combeas <- summary(model)$coeff[4,1]
combeas <- rbind(combeas,cbind(colnames(EAS1)[j],beta_combeas,p_combeas))
#SAS
model= lm(SAS1[,j] ~ SAS1$f.21003.2.0 + SAS1$f.22001.0.0 + SAS1[,164])
p_combsas <- summary(model)$coeff[4,4]
beta_combsas <- summary(model)$coeff[4,1]
combsas <- rbind(combsas,cbind(colnames(SAS1)[j],beta_combsas,p_combsas))
}
write.table(combafr,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/interact_combafr",quote=F,row.names=F)
write.table(vif_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/vif_afr",quote=F,row.names=F)
write.table(combeur,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/interact_combeur",quote=F,row.names=F)
write.table(vif_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/vif_eur",quote=F,row.names=F)
write.table(combsas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/interact_combsas",quote=F,row.names=F)
write.table(vif_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/vif_sas",quote=F,row.names=F)
write.table(combeas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/interact_combeas",quote=F,row.names=F)
write.table(vif_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/vif_eas",quote=F,row.names=F)

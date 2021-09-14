AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)[,c(1:4,9,5:8,10:163)]
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)[,c(1:4,9,5:8,10:163)]
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)[,c(1:4,9,5:8,10:163)]
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)[,c(1:4,9,5:8,10:163)]


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

for (j in 6:dim(EUR)[2]){
EUR1=cbind(EUR,EUR[,j]/EUR$f.25010.2.0)
AFR1=cbind(AFR,AFR[,j]/AFR$f.25010.2.0)
EAS1=cbind(EAS,EAS[,j]/EAS$f.25010.2.0)
SAS1=cbind(SAS,SAS[,j]/SAS$f.25010.2.0)
EUR_f <- EUR1[EUR1$f.22001.0.0==0,]
AFR_f <- AFR1[AFR1$f.22001.0.0==0,]
EAS_f <- EAS1[EAS1$f.22001.0.0==0,]
SAS_f <- SAS1[SAS1$f.22001.0.0==0,]
EUR_m <- EUR1[EUR1$f.22001.0.0==1,]
AFR_m <- AFR1[AFR1$f.22001.0.0==1,]
EAS_m <- EAS1[EAS1$f.22001.0.0==1,]
SAS_m <- SAS1[SAS1$f.22001.0.0==1,]

#EUR
p_combeur <- summary(lm(EUR1$f.25010.2.0 ~ EUR1$f.21003.2.0 + EUR1$f.22001.0.0 + EUR1[,164]))$coeff[4,4]
beta_combeur <- summary(lm(EUR1$f.25010.2.0 ~ EUR1$f.21003.2.0 + EUR1$f.22001.0.0 + EUR1[,164]))$coeff[4,1]
combeur <- rbind(combeur,cbind(colnames(EUR1)[j],beta_combeur,p_combeur))

p_meur <- summary(lm(EUR_m$f.25010.2.0 ~ EUR_m$f.21003.2.0 + EUR_m[,164]))$coeff[3,4]
beta_meur <- summary(lm(EUR_m$f.25010.2.0 ~ EUR_m$f.21003.2.0 + EUR_m[,164]))$coeff[3,1]
meur <- rbind(meur,cbind(colnames(EUR_m)[j],beta_meur,p_meur))

p_feur <- summary(lm(EUR_f$f.25010.2.0 ~ EUR_f$f.21003.2.0 + EUR_f[,164]))$coeff[3,4]
beta_feur <- summary(lm(EUR_f$f.25010.2.0 ~ EUR_f$f.21003.2.0 + EUR_f[,164]))$coeff[3,1]
feur <- rbind(feur,cbind(colnames(EUR_f)[j],beta_feur,p_feur))

#AFR
p_combafr <- summary(lm(AFR1$f.25010.2.0 ~ AFR1$f.21003.2.0 + AFR1$f.22001.0.0 + AFR1[,164]))$coeff[4,4]
beta_combafr <- summary(lm(AFR1$f.25010.2.0 ~ AFR1$f.21003.2.0 + AFR1$f.22001.0.0 + AFR1[,164]))$coeff[4,1]
combafr <- rbind(combafr,cbind(colnames(AFR1)[j],beta_combafr,p_combafr))

p_mafr <- summary(lm(AFR_m$f.25010.2.0 ~ AFR_m$f.21003.2.0 + AFR_m[,164]))$coeff[3,4]
beta_mafr <- summary(lm(AFR_m$f.25010.2.0 ~ AFR_m$f.21003.2.0 + AFR_m[,164]))$coeff[3,1]
mafr <- rbind(mafr,cbind(colnames(AFR_m)[j],beta_mafr,p_mafr))

p_fafr <- summary(lm(AFR_f$f.25010.2.0 ~ AFR_f$f.21003.2.0 + AFR_f[,164]))$coeff[3,4]
beta_fafr <- summary(lm(AFR_f$f.25010.2.0 ~ AFR_f$f.21003.2.0 + AFR_f[,164]))$coeff[3,1]
fafr <- rbind(fafr,cbind(colnames(AFR_f)[j],beta_fafr,p_fafr))

#EAS
p_combeas <- summary(lm(EAS1$f.25010.2.0 ~ EAS1$f.21003.2.0 + EAS1$f.22001.0.0 + EAS1[,164]))$coeff[4,4]
beta_combeas <- summary(lm(EAS1$f.25010.2.0 ~ EAS1$f.21003.2.0 + EAS1$f.22001.0.0 + EAS1[,164]))$coeff[4,1]
combeas <- rbind(combeas,cbind(colnames(EAS1)[j],beta_combeas,p_combeas))

p_meas <- summary(lm(EAS_m$f.25010.2.0 ~ EAS_m$f.21003.2.0 + EAS_m[,164]))$coeff[3,4]
beta_meas <- summary(lm(EAS_m$f.25010.2.0 ~ EAS_m$f.21003.2.0 + EAS_m[,164]))$coeff[3,1]
meas <- rbind(meas,cbind(colnames(EAS_m)[j],beta_meas,p_meas))

p_feas <- summary(lm(EAS_f$f.25010.2.0 ~ EAS_f$f.21003.2.0 + EAS_f[,164]))$coeff[3,4]
beta_feas <- summary(lm(EAS_f$f.25010.2.0 ~ EAS_f$f.21003.2.0 + EAS_f[,164]))$coeff[3,1]
feas <- rbind(feas,cbind(colnames(EAS_f)[j],beta_feas,p_feas))

#SAS
p_combsas <- summary(lm(SAS1$f.25010.2.0 ~ SAS1$f.21003.2.0 + SAS1$f.22001.0.0 + SAS1[,164]))$coeff[4,4]
beta_combsas <- summary(lm(SAS1$f.25010.2.0 ~ SAS1$f.21003.2.0 + SAS1$f.22001.0.0 + SAS1[,164]))$coeff[4,1]
combsas <- rbind(combsas,cbind(colnames(SAS1)[j],beta_combsas,p_combsas))

p_msas <- summary(lm(SAS_m$f.25010.2.0 ~ SAS_m$f.21003.2.0 + SAS_m[,164]))$coeff[3,4]
beta_msas <- summary(lm(SAS_m$f.25010.2.0 ~ SAS_m$f.21003.2.0 + SAS_m[,164]))$coeff[3,1]
msas <- rbind(msas,cbind(colnames(SAS_m)[j],beta_msas,p_msas))

p_fsas <- summary(lm(SAS_f$f.25010.2.0 ~ SAS_f$f.21003.2.0 + SAS_f[,164]))$coeff[3,4]
beta_fsas <- summary(lm(SAS_f$f.25010.2.0 ~ SAS_f$f.21003.2.0 + SAS_f[,164]))$coeff[3,1]
fsas <- rbind(fsas,cbind(colnames(SAS_f)[j],beta_fsas,p_fsas))
}
write.table(combafr,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/combafr",quote=F,row.names=F)
write.table(mafr,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/mafr",quote=F,row.names=F)
write.table(fafr,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/fafr",quote=F,row.names=F)

write.table(combeur,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/combeur",quote=F,row.names=F)
write.table(meur,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/meur",quote=F,row.names=F)
write.table(feur,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/feur",quote=F,row.names=F)

write.table(combsas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/combsas",quote=F,row.names=F)
write.table(msas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/msas",quote=F,row.names=F)
write.table(fsas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/fsas",quote=F,row.names=F)

write.table(combeas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/combeas",quote=F,row.names=F)
write.table(meas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/meas",quote=F,row.names=F)
write.table(feas,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/ratio_tbv/feas",quote=F,row.names=F)

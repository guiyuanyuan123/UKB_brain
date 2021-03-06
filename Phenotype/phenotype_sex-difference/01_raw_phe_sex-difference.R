AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)

tst_EUR=data.frame()
wtest_EUR=data.frame()

tst_AFR=data.frame()
twst_AFR=data.frame()
wtest_AFR=data.frame()

tst_EAS=data.frame()
wtest_EAS=data.frame()
twst_EAS=data.frame()

tst_SAS=data.frame()
wtest_SAS=data.frame()
twst_SAS=data.frame()

for (j in 5:dim(EUR)[2]){
     f<-lm(EUR[,j] ~ EUR$f.21003.2.0)$residuals
     EUR[,j][!is.na(EUR[,j])]=f
#正态检验
#pm_EUR =ks.test(EUR[EUR$f.22001.0.0==1,j],"pnorm")$p.value
#pf_EUR =ks.test(EUR[EUR$f.22001.0.0==0,j],"pnorm")$p.value
p_EUR =var.test(EUR[EUR$f.22001.0.0==0,j],EUR[EUR$f.22001.0.0==1,j])$p.value

        if(p_EUR > 0.05){
 #方差齐
        tp<-t.test(EUR[EUR$f.22001.0.0==0,j],EUR[EUR$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$p.value
        ts=t.test(EUR[EUR$f.22001.0.0==0,j],EUR[EUR$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$statistic
        tst_EUR=rbind(tst_EUR,cbind(colnames(EUR)[j],tp,ts))
        }else{
        wp=t.test(EUR[EUR$f.22001.0.0==0,j],EUR[EUR$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$p.value
        ws=t.test(EUR[EUR$f.22001.0.0==0,j],EUR[EUR$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$statistic
	wtest_EUR=rbind(wtest_EUR,cbind(colnames(EUR)[j],wp,ws))	
}
}
colnames(wtest_EUR)<-c("V1","tp","ts")
tst_EUR$ts <- as.numeric(as.character(tst_EUR$ts))
wtest_EUR$ts <- as.numeric(as.character(wtest_EUR$ts))
EURt_test <- rbind(tst_EUR,wtest_EUR)
for (i in 1:159){
        if(EURt_test[i,3] > 0){
                EURt_test[i,4]="EUR_f"}else{EURt_test[i,4]="EUR_m"}}
write.table(EURt_test,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EUR_t_test",row.names=F,quote=F)


#AFR
for (j in 5:dim(AFR)[2]){
     f<-lm(AFR[,j] ~ AFR$f.21003.2.0)$residuals
     AFR[,j][!is.na(AFR[,j])]=f
#正态检验
pm_AFR =shapiro.test(AFR[AFR$f.22001.0.0==1,j])$p.value
pf_AFR =shapiro.test(AFR[AFR$f.22001.0.0==0,j])$p.value
p_AFR =var.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j])$p.value

	if(pm_AFR>0.05 & pf_AFR>0.05 & p_AFR > 0.05){ 
#方差齐
        tp<-t.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$p.value
        ts=t.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$statistic
        tst_AFR=rbind(tst_AFR,cbind(colnames(AFR)[j],tp,ts))
	}else if(pm_AFR>0.05 & pf_AFR>0.05 & p_AFR < 0.05){
	twp<-t.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$p.value
	tws=t.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$statistic
	twst_AFR=rbind(twst_AFR,cbind(colnames(AFR)[j],twp,tws))
        }else{
        wp=wilcox.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],alternative="two.sided")$p.value
        ws=wilcox.test(AFR[AFR$f.22001.0.0==0,j],AFR[AFR$f.22001.0.0==1,j],alternative="two.sided")$statistic

        m_x<-AFR[AFR$f.22001.0.0==1,j]
        f_x<-AFR[AFR$f.22001.0.0==0,j]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2
        wtest_AFR=rbind(wtest_AFR,cbind(colnames(AFR)[j],wp,ws,l))
        }
}

wtest_AFR <- within(wtest_AFR,{ts= as.numeric(as.character(ws))-as.numeric(as.character(l))})[,c("V1","wp","ts")]
colnames(wtest_AFR) <- c("V1","tp","ts")

colnames(twst_AFR)<-c("V1","tp","ts")
tst_AFR$ts <- as.numeric(as.character(tst_AFR$ts))
twst_AFR$ts <- as.numeric(as.character(twst_AFR$ts))
AFRt_test <- rbind(tst_AFR,twst_AFR,wtest_AFR)
for (i in 1:159){
        if(AFRt_test[i,3] > 0){
                AFRt_test[i,4]="AFR_f"}else{AFRt_test[i,4]="AFR_m"}}

write.table(AFRt_test,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_AFR_t_test",row.names=F,quote=F)

#EAS
for (j in 5:dim(EAS)[2]){
     f<-lm(EAS[,j] ~ EAS$f.21003.2.0)$residuals
     EAS[,j][!is.na(EAS[,j])]=f
#正态检验
pm_EAS =shapiro.test(EAS[EAS$f.22001.0.0==1,j])$p.value
pf_EAS =shapiro.test(EAS[EAS$f.22001.0.0==0,j])$p.value
p_EAS =var.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j])$p.value

        if(pm_EAS>0.05 & pf_EAS>0.05 & p_EAS > 0.05){
#方差齐
        tp<-t.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$p.value
        
        ts=t.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$statistic
        tst_EAS=rbind(tst_EAS,cbind(colnames(EAS)[j],tp,ts))
        }else if(pm_EAS>0.05 & pf_EAS>0.05 & p_EAS < 0.05){
        twp<-t.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$p.value
        tws=t.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$statistic
        twst_EAS=rbind(twst_EAS,cbind(colnames(EAS)[j],twp,tws))
        }else{
        wp=wilcox.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],alternative="two.sided")$p.value
        ws=wilcox.test(EAS[EAS$f.22001.0.0==0,j],EAS[EAS$f.22001.0.0==1,j],alternative="two.sided")$statistic

        m_x<-EAS[EAS$f.22001.0.0==1,j]
        f_x<-EAS[EAS$f.22001.0.0==0,j]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2
        wtest_EAS=rbind(wtest_EAS,cbind(colnames(EAS)[j],wp,ws,l))
        }
}
wtest_EAS <- within(wtest_EAS,{ts= as.numeric(as.character(ws))-as.numeric(as.character(l))})[,c("V1","wp","ts")]
colnames(wtest_EAS) <- c("V1","tp","ts")

colnames(twst_EAS)<-c("V1","tp","ts")
tst_EAS$ts <- as.numeric(as.character(tst_EAS$ts))
twst_EAS$ts <- as.numeric(as.character(twst_EAS$ts))
EASt_test <- rbind(tst_EAS,twst_EAS,wtest_EAS)
for (i in 1:159){
        if(EASt_test[i,3] > 0){
                EASt_test[i,4]="EAS_f"}else{EASt_test[i,4]="EAS_m"}}

write.table(EASt_test,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EAS_t_test",row.names=F,quote=F)

#SAS
for (j in 5:dim(SAS)[2]){
     f<-lm(SAS[,j] ~ SAS$f.21003.2.0)$residuals
     SAS[,j][!is.na(SAS[,j])]=f
#正态检验
pm_SAS =shapiro.test(SAS[SAS$f.22001.0.0==1,j])$p.value
pf_SAS =shapiro.test(SAS[SAS$f.22001.0.0==0,j])$p.value
p_SAS =var.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j])$p.value

        if(pm_SAS>0.05 & pf_SAS>0.05 & p_SAS > 0.05){
#方差齐
        tp<-t.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$p.value
        
        ts=t.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],var.equal=T,alternative="two.sided")$statistic
        tst_SAS=rbind(tst_SAS,cbind(colnames(SAS)[j],tp,ts))
        }else if(pm_SAS>0.05 & pf_SAS>0.05 & p_SAS < 0.05){
        twp<-t.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$p.value
        tws=t.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],var.equal=F,alternative="two.sided")$statistic
        twst_SAS=rbind(twst_SAS,cbind(colnames(SAS)[j],twp,tws))
        }else{
        wp=wilcox.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],alternative="two.sided")$p.value
        ws=wilcox.test(SAS[SAS$f.22001.0.0==0,j],SAS[SAS$f.22001.0.0==1,j],alternative="two.sided")$statistic

        m_x<-SAS[SAS$f.22001.0.0==1,j]
        f_x<-SAS[SAS$f.22001.0.0==0,j]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2

        wtest_SAS=rbind(wtest_SAS,cbind(colnames(SAS)[j],wp,ws,l))
        }
}
wtest_SAS <- within(wtest_SAS,{ts= as.numeric(as.character(ws))-as.numeric(as.character(l))})[,c("V1","wp","ts")]
colnames(wtest_SAS) <- c("V1","tp","ts")

colnames(twst_SAS)<-c("V1","tp","ts")
tst_SAS$ts <- as.numeric(as.character(tst_SAS$ts))
twst_SAS$ts <- as.numeric(as.character(twst_SAS$ts))
SASt_test <- rbind(tst_SAS,twst_SAS,wtest_SAS)
for (i in 1:159){
        if(SASt_test[i,3] > 0){
                SASt_test[i,4]="SAS_f"}else{SASt_test[i,4]="SAS_m"}}
write.table(SASt_test,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_SAS_t_test",row.names=F,quote=F)

t_test<-rbind(EURt_test,AFRt_test,EASt_test,SASt_test)
write.table(t_test,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_4race_t_test",row.names=F,quote=F)

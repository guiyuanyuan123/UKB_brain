AFR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/AFR_5",header=T)
EAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EAS_5",header=T)
SAS<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/SAS_5",header=T)
EUR<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)

t_EUR=data.frame()
tst_EUR=data.frame()
wtestp_EUR=data.frame()
wtest_EUR=data.frame()
ltest_EUR=data.frame()

t_AFR=data.frame()
tst_AFR=data.frame()
wtestp_AFR=data.frame()
wtest_AFR=data.frame()
ltest_AFR=data.frame()

t_EAS=data.frame()
tst_EAS=data.frame()
wtestp_EAS=data.frame()
wtest_EAS=data.frame()
ltest_EAS=data.frame()

t_SAS=data.frame()
tst_SAS=data.frame()
wtestp_SAS=data.frame()
wtest_SAS=data.frame()
ltest_SAS=data.frame()

for (j in 5:dim(EUR)[2]){
EUR_0 <- cbind(EUR,EUR[,4]*EUR[,j])

#正态检验
#pm_EUR =ks.test(EUR_0[EUR_0$f.22001.0.0==1,164],"pnorm")$p.value
#pf_EUR =ks.test(EUR_0[EUR_0$f.22001.0.0==0,164],"pnorm")$p.value
p_EUR =var.test(EUR_0[EUR_0$f.22001.0.0==0,164],EUR_0[EUR_0$f.22001.0.0==1,164])$p.value

        if(p_EUR > 0.05){
 #方差齐
        tp<-t.test(EUR_0[EUR_0$f.22001.0.0==0,164],EUR_0[EUR_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$p.value
        #t_EUR=rbind(t_EUR,cbind(colnames(EUR_0)[j],tp))
        ts=t.test(EUR_0[EUR_0$f.22001.0.0==0,164],EUR_0[EUR_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$statistic
        tst_EUR=rbind(tst_EUR,cbind(colnames(EUR_0)[j],tp,ts))
        }else{
        wp=wilcox.test(EUR_0[EUR_0$f.22001.0.0==0,164],EUR_0[EUR_0$f.22001.0.0==1,164],alternative="two.sided")$p.value
        ws=wilcox.test(EUR_0[EUR_0$f.22001.0.0==0,164],EUR_0[EUR_0$f.22001.0.0==1,164],alternative="two.sided")$statistic

        m_x<-EUR_0[EUR_0$f.22001.0.0==1,164]
        f_x<-EUR_0[EUR_0$f.22001.0.0==0,164]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2

        wtest_EUR=rbind(wtest_EUR,cbind(colnames(EUR_0)[j],wp,ws,l))
        #wtestp_EUR=rbind(wtestp_EUR,cbind(colnames(EUR_0)[j],wp))
        }

#m_x<-EUR_0[EUR_0$f.22001.0.0==1,164]
#f_x<-EUR_0[EUR_0$f.22001.0.0==0,164]
#m_x<-na.omit(m_x)
#f_x<-na.omit(f_x)
#l=length(m_x)*length(f_x)/2
#ltest_EUR=rbind(ltest_EUR,cbind(colnames(EUR_0)[j],l))
}

#write.table(t_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EUR_t_p",row.names=F,quote=F)
write.table(tst_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EUR_t_stat",row.names=F,quote=F)
write.table(wtest_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EUR_wtest_stat",row.names=F,quote=F)
#write.table(wtestp_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EUR_wtest_p",row.names=F,quote=F)
#write.table(ltest_EUR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EUR_lwtest",row.names=F,quote=F)

#AFR
for (j in 5:dim(AFR)[2]){
AFR_0 <- cbind(AFR,AFR[,4]*AFR[,j])
#正态检验
pm_AFR =shapiro.test(AFR_0[AFR_0$f.22001.0.0==1,164])$p.value
pf_AFR =shapiro.test(AFR_0[AFR_0$f.22001.0.0==0,164])$p.value
p_AFR =var.test(AFR_0[AFR_0$f.22001.0.0==0,164],AFR_0[AFR_0$f.22001.0.0==1,164])$p.value

        if(pm_AFR>0.05 & pf_AFR>0.05 & p_AFR > 0.05){
 #方差齐
        tp<-t.test(AFR_0[AFR_0$f.22001.0.0==0,164],AFR_0[AFR_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$p.value
        #t_AFR=rbind(t_AFR,cbind(colnames(AFR_0)[j],tp))
        ts=t.test(AFR_0[AFR_0$f.22001.0.0==0,164],AFR_0[AFR_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$statistic
        tst_AFR=rbind(tst_AFR,cbind(colnames(AFR_0)[j],tp,ts))
        }else{
        wp=wilcox.test(AFR_0[AFR_0$f.22001.0.0==0,164],AFR_0[AFR_0$f.22001.0.0==1,164],alternative="two.sided")$p.value
        ws=wilcox.test(AFR_0[AFR_0$f.22001.0.0==0,164],AFR_0[AFR_0$f.22001.0.0==1,164],alternative="two.sided")$statistic
         
        m_x<-AFR_0[AFR_0$f.22001.0.0==1,164]
        f_x<-AFR_0[AFR_0$f.22001.0.0==0,164]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2

        wtest_AFR=rbind(wtest_AFR,cbind(colnames(AFR_0)[j],wp,ws,l))
       # wtestp_AFR=rbind(wtestp_AFR,cbind(colnames(AFR_0)[j],wp))
        }

#m_x<-AFR_0[AFR_0$f.22001.0.0==1,164]
#f_x<-AFR_0[AFR_0$f.22001.0.0==0,164]
#m_x<-na.omit(m_x)
#f_x<-na.omit(f_x)
#l=length(m_x)*length(f_x)/2
#ltest_AFR=rbind(ltest_AFR,cbind(colnames(AFR_0)[j],l))
}
#write.table(t_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/AFR_t_p",row.names=F,quote=F)
write.table(tst_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/AFR_t_stat",row.names=F,quote=F)
write.table(wtest_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/AFR_wtest_stat",row.names=F,quote=F)
#write.table(wtestp_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/AFR_wtest_p",row.names=F,quote=F)
#write.table(ltest_AFR,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/AFR_lwtest",row.names=F,quote=F)

#EAS
for (j in 5:dim(EAS)[2]){
EAS_0 <- cbind(EAS,EAS[,4]*EAS[,j])

#正态检验
pm_EAS =shapiro.test(EAS_0[EAS_0$f.22001.0.0==1,164])$p.value
pf_EAS =shapiro.test(EAS_0[EAS_0$f.22001.0.0==0,164])$p.value
p_EAS =var.test(EAS_0[EAS_0$f.22001.0.0==0,164],EAS_0[EAS_0$f.22001.0.0==1,164])$p.value

        if(pm_EAS>0.05 & pf_EAS>0.05 & p_EAS > 0.05){
 #方差齐
        tp<-t.test(EAS_0[EAS_0$f.22001.0.0==0,164],EAS_0[EAS_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$p.value
        #t_EAS=rbind(t_EAS,cbind(colnames(EAS_0)[j],tp))
        ts=t.test(EAS_0[EAS_0$f.22001.0.0==0,164],EAS_0[EAS_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$statistic
        tst_EAS=rbind(tst_EAS,cbind(colnames(EAS_0)[j],tp,ts))
        }else{
        wp=wilcox.test(EAS_0[EAS_0$f.22001.0.0==0,164],EAS_0[EAS_0$f.22001.0.0==1,164],alternative="two.sided")$p.value
        ws=wilcox.test(EAS_0[EAS_0$f.22001.0.0==0,164],EAS_0[EAS_0$f.22001.0.0==1,164],alternative="two.sided")$statistic
        m_x<-EAS_0[EAS_0$f.22001.0.0==1,164]
        f_x<-EAS_0[EAS_0$f.22001.0.0==0,164]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2

        wtest_EAS=rbind(wtest_EAS,cbind(colnames(EAS_0)[j],wp,ws,l))
        #wtestp_EAS=rbind(wtestp_EAS,cbind(colnames(EAS_0)[j],wp))
        }

#m_x<-EAS_0[EAS_0$f.22001.0.0==1,164]
#f_x<-EAS_0[EAS_0$f.22001.0.0==0,164]
#m_x<-na.omit(m_x)
#f_x<-na.omit(f_x)
#l=length(m_x)*length(f_x)/2
#ltest_EAS=rbind(ltest_EAS,cbind(colnames(EAS_0)[j],l))
}
#write.table(t_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EAS_t_p",row.names=F,quote=F)
write.table(tst_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EAS_t_stat",row.names=F,quote=F)
write.table(wtest_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EAS_wtest_stat",row.names=F,quote=F)
#write.table(wtestp_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EAS_wtest_p",row.names=F,quote=F)
#write.table(ltest_EAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/EAS_lwtest",row.names=F,quote=F)

for (j in 5:dim(SAS)[2]){
SAS_0 <- cbind(SAS,SAS[,4]*SAS[,j])

#正态检验
pm_SAS =shapiro.test(SAS_0[SAS_0$f.22001.0.0==1,164])$p.value
pf_SAS =shapiro.test(SAS_0[SAS_0$f.22001.0.0==0,164])$p.value
p_SAS =var.test(SAS_0[SAS_0$f.22001.0.0==0,164],SAS_0[SAS_0$f.22001.0.0==1,164])$p.value

        if(pm_SAS>0.05 & pf_SAS>0.05 & p_SAS > 0.05){
 #方差齐
        tp<-t.test(SAS_0[SAS_0$f.22001.0.0==0,164],SAS_0[SAS_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$p.value
#       t_SAS=rbind(t_SAS,cbind(colnames(SAS_0)[j],tp))
        ts=t.test(SAS_0[SAS_0$f.22001.0.0==0,164],SAS_0[SAS_0$f.22001.0.0==1,164],var.equal=T,alternative="two.sided")$statistic
        tst_SAS=rbind(tst_SAS,cbind(colnames(SAS_0)[j],tp,ts))
        }else{
        wp=wilcox.test(SAS_0[SAS_0$f.22001.0.0==0,164],SAS_0[SAS_0$f.22001.0.0==1,164],alternative="two.sided")$p.value
        ws=wilcox.test(SAS_0[SAS_0$f.22001.0.0==0,164],SAS_0[SAS_0$f.22001.0.0==1,164],alternative="two.sided")$statistic
        m_x<-SAS_0[SAS_0$f.22001.0.0==1,164]
        f_x<-SAS_0[SAS_0$f.22001.0.0==0,164]
        m_x<-na.omit(m_x)
        f_x<-na.omit(f_x)
        l=length(m_x)*length(f_x)/2

        wtest_SAS=rbind(wtest_SAS,cbind(colnames(SAS_0)[j],wp,ws,l))
#        wtestp_SAS=rbind(wtestp_SAS,cbind(colnames(SAS_0)[j],wp))
        }

#m_x<-SAS_0[SAS_0$f.22001.0.0==1,164]
#f_x<-SAS_0[SAS_0$f.22001.0.0==0,164]
#m_x<-na.omit(m_x)
#f_x<-na.omit(f_x)
#l=length(m_x)*length(f_x)/2
#ltest_SAS=rbind(ltest_SAS,cbind(colnames(SAS_0)[j],l))
}
#write.table(t_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/SAS_t_p",row.names=F,quote=F)
write.table(tst_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/SAS_t_stat",row.names=F,quote=F)
write.table(wtest_SAS,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/SAS_wtest_stat",row.names=F,quote=F)
                                                                                

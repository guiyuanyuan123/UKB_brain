for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' inter/${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> female_inter_h2;
done

for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' inter/${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> male_inter_h2;
done

paste female/female_inter_h2 male/male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2>$4' > pos_zscore
paste female/female_inter_h2 male/male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2<$4' > neg_zscore

a<-read.table("pos_zscore")
colnames(a)<-c("Trait","f_h2","f_se","m_h2","m_se")
a<-within(a,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*(1-pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2)))})

write.table(a,"LDSC_inter_h2_pos",quote=F,row.names=F)

b<-read.table("neg_zscore")
colnames(b)<-c("Trait","f_h2","f_se","m_h2","m_se")
b<-within(b,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2))})
write.table(b,"LDSC_inter_h2_neg",quote=F,row.names=F,col.names=F)

cat LDSC_inter_h2_pos LDSC_inter_h2_neg  > LDSC_inter_h2

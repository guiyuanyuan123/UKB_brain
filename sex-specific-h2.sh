for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' tbv_inter/tbv_${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> tbv_female_inter_h2;
done

for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' tbv_inter/tbv_${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> tbv_male_inter_h2;
done

paste female/tbv_female_inter_h2 male/tbv_male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2>$4' > tbv_inter_pos_zscore
paste female/tbv_female_inter_h2 male/tbv_male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2<$4' > tbv_inter_neg_zscore

a<-read.table("tbv_pos_zscore")
colnames(a)<-c("Trait","f_h2","f_se","m_h2","m_se")
a<-within(a,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*(1-pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2)))})

write.table(a,"tbv_LDSC_inter_h2_pos",quote=F,row.names=F)

b<-read.table("tbv_neg_zscore")
colnames(b)<-c("Trait","f_h2","f_se","m_h2","m_se")
b<-within(b,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2))})
write.table(b,"tbv_LDSC_inter_h2_neg",quote=F,row.names=F,col.names=F)

cat tbv_LDSC_inter_h2_pos tbv_LDSC_inter_h2_neg  > tbv_LDSC_inter_h2

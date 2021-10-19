for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' tbv_inter/tbv_${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> tbv_female_inter_h2;
done

for i in `cat ../../header_vol`;do 
grep -w 'Total Observed scale h2:' tbv_inter/tbv_${i}_h2.log|awk -F":" '{print "'${i}'",$2}'|grep -wv 'NA' >> tbv_male_inter_h2;
done

paste female/tbv_female_inter_h2 male/tbv_male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2>$4' > tbv_inter_pos_zscore
paste female/tbv_female_inter_h2 male/tbv_male_inter_h2 |awk '{print $1,$2,$3,$5,$6}' |awk -F"(" '{print $1,$2,$3}'|awk -F")" '{print $1,$2,$3}'|awk '$2<$4' > tbv_inter_neg_zscore

a<-read.table("tbv_inter_pos_zscore")
colnames(a)<-c("Trait","f_h2","f_se","m_h2","m_se")
a<-within(a,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*(1-pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2)))})

write.table(a,"tbv_LDSC_inter_h2_pos",quote=F,row.names=F)

b<-read.table("tbv_inter_neg_zscore")
colnames(b)<-c("Trait","f_h2","f_se","m_h2","m_se")
b<-within(b,{z=(f_h2-m_h2)/sqrt(f_se^2+m_se^2)
          p=2*pnorm((f_h2-m_h2)/sqrt(f_se^2+m_se^2))})
write.table(b,"tbv_LDSC_inter_h2_neg",quote=F,row.names=F,col.names=F)

cat tbv_LDSC_inter_h2_pos tbv_LDSC_inter_h2_neg  > tbv_LDSC_inter_h2

a<-read.table("confounder_7_LDSC_inter_h2_BH")
a$V2=round(a$V2,3)
a$V3=round(a$V3,3)
a$V4=round(a$V4,3)
a$V5=round(a$V5,3)
write.table(a,"confounder_7_LDSC_inter_h2_BH_0",quote=F,row.names=F,col.names=F)
sort -gk1 confounder_7_LDSC_inter_h2_BH_0|awk '{print $2"("$3")\t"$4"("$5")\t"$7"\t"$6"\t"$8}' > confounder_7_LDSC_inter_h2_BH_1

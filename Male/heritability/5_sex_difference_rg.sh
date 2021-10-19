rm gc;for i in `cat ../../header_vol`;do 
tail -n 4 tbv_rg/tbv_${i}_inter_hg.log|head -n 1|awk '{print "'$i'",$3,$4,$5,$6}' >>gc
done
vim gc ;Trait rg se z p_0 
awk '$2-0>=0' gc > pos_gc
awk '$2-0<0' gc > neg_gc

a<-read.table("pos_gc",header=T)
a<-within(a,{p_1=1-pnorm((1-rg)/se)}) #significant difference from 1 
write.table(a,"pos_between_sex_rg",quote=F,row.names=F)
b<-read.table("neg_gc",header=T)
b<-within(b,{p_1=1-pnorm((1+rg)/se)})
write.table(b,"neg_between_sex_rg",quote=F,row.names=F)
#method 1
awk '$2+1.96*$3<1 && $2<0.6' between_sex_rg > vol_low_hg
awk '{print $1}' vol_low_hg > vol_low_header
#method2
python BH_adjust.py
vim Trait rg se z p_0 p_1 q_1
awk '$7<0.05' between_sex_rg_BH
awk '$6<0.05/159' between_sex_rg 
#linear_5e-8
for i in `cat vol_low_header`;do awk '$12<5e-8' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/male_linear/${i}.glm.linear > vol_low_M_${i}_5e-8;done
for i in `cat vol_low_header`;do awk '$12<5e-8' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/female_linear/${i}.glm.linear > vol_low_F_${i}_5e-8;done

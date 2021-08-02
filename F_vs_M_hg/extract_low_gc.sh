rm gc;for i in `cat /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/header_vol`;do 
tail -n 4 vol_F_M_${i}_hg.log |head -n 1|awk -F" " '{print "'${i}'",$3,$4}' >> gc;
done

awk '$2<=0.6' gc|awk '{print $0,$2+2*$3}' |awk '$4<0.92' > vol_low_hg
awk '{print $1}' vol_low_hg > vol_low_header
#linear_5e-8
for i in `cat vol_low_header`;do awk '$12<5e-8' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/male_linear/${i}.glm.linear > vol_low_M_${i}_5e-8;done
for i in `cat vol_low_header`;do awk '$12<5e-8' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/female_linear/${i}.glm.linear > vol_low_F_${i}_5e-8;done

  /export/home/guiyuanyuan/tools/plink2 --bfile /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/UKB_male \
  --freq \
  --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/UKB_male
  
  /export/home/guiyuanyuan/tools/plink2 --bfile /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/UKB_female \
  --freq \
  --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/UKB_female
#/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/5e-8/m_5e-8.sh
for i in `cat ../../../header_vol`;do 
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/confounder_7_linear/${i}.glm.linear > male_confounder_7_${i}_5e-8;
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/raw_linear/${i}.glm.linear > male_raw_${i}_5e-8;
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/tbv_linear/${i}.glm.linear > male_tbv_${i}_5e-8;
done

#f_5e-8.sh
for i in `cat ../../../header_vol`;do 
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/confounder_7_linear/${i}.glm.linear > female_confounder_7_${i}_5e-8;
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/raw_linear/${i}.glm.linear > female_raw_${i}_5e-8;
awk '$12<5e-8' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/tbv_linear/${i}.glm.linear > female_tbv_${i}_5e-8;
done

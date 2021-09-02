for i in `cat header_vol_0`;do
/export/home/guiyuanyuan/tools/plink2 --bfile /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/UKB_male --pheno /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/brain_pheno --pheno-name ${i} --linear hide-covar --covar /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/covar_m_vbt --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/raw_${i} --threads 5 --memory 35840 --covar-variance-standardize;
#header_vol_0 removed f.25010.2.0
awk '!/'NA'/' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/raw_${i}.${i}.glm.linear > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/${i}.glm.linear;
rm /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/raw_${i}.${i}.glm.linear;
awk '(NR>1){SNP=$3;A1=$6;A2=$4;N=$8;Z=$9/$10}(NR==1){printf "SNP\tA1\tA2\tN\tZ"}{print SNP"\t"A1"\t"A2"\t"N"\t"Z}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/${i}.glm.linear > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/tbv_txt/${i}.txt;
done
